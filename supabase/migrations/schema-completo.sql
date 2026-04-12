-- ============================================
-- SCHEMA COMPLETO - FinLingo
-- Rode este arquivo no Supabase SQL Editor
-- ============================================

-- ============ TABELAS PRINCIPAIS ============

-- Profiles table
CREATE TABLE public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username TEXT UNIQUE,
  avatar_id INTEGER DEFAULT 1,
  objective TEXT,
  level TEXT,
  daily_goal_minutes INTEGER DEFAULT 10,
  xp_total INTEGER DEFAULT 0,
  xp_weekly INTEGER DEFAULT 0,
  streak_current INTEGER DEFAULT 0,
  streak_longest INTEGER DEFAULT 0,
  hearts INTEGER DEFAULT 5,
  fincoins INTEGER DEFAULT 0,
  league TEXT DEFAULT 'Bronze',
  xp_boost_until TIMESTAMPTZ DEFAULT NULL,
  last_lesson_date DATE DEFAULT NULL,
  hearts_updated_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view all profiles" ON public.profiles FOR SELECT TO authenticated USING (true);
CREATE POLICY "Users can insert own profile" ON public.profiles FOR INSERT TO authenticated WITH CHECK (auth.uid() = id);

-- Restrictive update policy - only safe fields
DROP POLICY IF EXISTS "Users can update own profile" ON public.profiles;
CREATE POLICY "Users can update own safe fields"
ON public.profiles
FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (
  auth.uid() = id
  AND xp_total IS NOT DISTINCT FROM (SELECT xp_total FROM public.profiles WHERE id = auth.uid())
  AND xp_weekly IS NOT DISTINCT FROM (SELECT xp_weekly FROM public.profiles WHERE id = auth.uid())
  AND hearts IS NOT DISTINCT FROM (SELECT hearts FROM public.profiles WHERE id = auth.uid())
  AND fincoins IS NOT DISTINCT FROM (SELECT fincoins FROM public.profiles WHERE id = auth.uid())
  AND streak_current IS NOT DISTINCT FROM (SELECT streak_current FROM public.profiles WHERE id = auth.uid())
  AND streak_longest IS NOT DISTINCT FROM (SELECT streak_longest FROM public.profiles WHERE id = auth.uid())
  AND league IS NOT DISTINCT FROM (SELECT league FROM public.profiles WHERE id = auth.uid())
  AND xp_boost_until IS NOT DISTINCT FROM (SELECT xp_boost_until FROM public.profiles WHERE id = auth.uid())
  AND last_lesson_date IS NOT DISTINCT FROM (SELECT last_lesson_date FROM public.profiles WHERE id = auth.uid())
);

-- Auto-create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, username)
  VALUES (NEW.id, NEW.raw_user_meta_data->>'username');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Lessons table
CREATE TABLE public.lessons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  section_id INTEGER NOT NULL,
  section_title TEXT NOT NULL,
  lesson_number INTEGER NOT NULL,
  title TEXT NOT NULL,
  xp_reward INTEGER DEFAULT 10,
  activity_data JSONB NOT NULL DEFAULT '[]'::jsonb,
  is_quiz BOOLEAN DEFAULT FALSE
);

ALTER TABLE public.lessons ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read lessons" ON public.lessons FOR SELECT TO authenticated USING (true);

-- User lesson progress
CREATE TABLE public.user_lesson_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  lesson_id UUID NOT NULL REFERENCES public.lessons(id) ON DELETE CASCADE,
  completed BOOLEAN DEFAULT FALSE,
  perfect BOOLEAN DEFAULT FALSE,
  attempts INTEGER DEFAULT 0,
  completed_at TIMESTAMPTZ,
  UNIQUE(user_id, lesson_id)
);

ALTER TABLE public.user_lesson_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own progress" ON public.user_lesson_progress FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own progress" ON public.user_lesson_progress FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own progress" ON public.user_lesson_progress FOR UPDATE TO authenticated USING (auth.uid() = user_id);

-- User quiz results
CREATE TABLE public.user_quiz_results (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  section_id INTEGER NOT NULL,
  score INTEGER,
  passed BOOLEAN,
  taken_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.user_quiz_results ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own quiz results" ON public.user_quiz_results FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own quiz results" ON public.user_quiz_results FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- Daily quests
CREATE TABLE public.daily_quests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  description TEXT NOT NULL,
  requirement_type TEXT NOT NULL,
  requirement_value INTEGER NOT NULL,
  xp_reward INTEGER NOT NULL,
  fincoin_reward INTEGER NOT NULL,
  day_index INTEGER
);

ALTER TABLE public.daily_quests ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read quests" ON public.daily_quests FOR SELECT TO authenticated USING (true);

-- User daily quest progress
CREATE TABLE public.user_daily_quest_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  quest_id UUID NOT NULL REFERENCES public.daily_quests(id) ON DELETE CASCADE,
  progress INTEGER DEFAULT 0,
  completed BOOLEAN DEFAULT FALSE,
  date DATE DEFAULT CURRENT_DATE,
  UNIQUE(user_id, quest_id, date)
);

ALTER TABLE public.user_daily_quest_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own quest progress" ON public.user_daily_quest_progress FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own quest progress" ON public.user_daily_quest_progress FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own quest progress" ON public.user_daily_quest_progress FOR UPDATE TO authenticated USING (auth.uid() = user_id);

-- Transactions (shop)
CREATE TABLE public.transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  item_type TEXT NOT NULL,
  fincoins_spent INTEGER NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.transactions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own transactions" ON public.transactions FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own transactions" ON public.transactions FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- Streak freezes
CREATE TABLE public.streak_freezes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  used BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.streak_freezes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own freezes" ON public.streak_freezes FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own freezes" ON public.streak_freezes FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own freezes" ON public.streak_freezes FOR UPDATE TO authenticated USING (auth.uid() = user_id);

-- Badges
CREATE TABLE public.badges (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT,
  criteria_type TEXT NOT NULL,
  criteria_value INTEGER,
  icon TEXT DEFAULT '🏆'
);

ALTER TABLE public.badges ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read badges" ON public.badges FOR SELECT TO authenticated USING (true);

-- User badges
CREATE TABLE public.user_badges (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  badge_id UUID NOT NULL REFERENCES public.badges(id) ON DELETE CASCADE,
  earned_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, badge_id)
);

ALTER TABLE public.user_badges ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own badges" ON public.user_badges FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own badges" ON public.user_badges FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- League rankings
CREATE TABLE public.league_rankings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  week_start DATE NOT NULL,
  league TEXT NOT NULL,
  rank INTEGER,
  xp_week INTEGER DEFAULT 0,
  promoted_to TEXT,
  demoted_to TEXT,
  UNIQUE(user_id, week_start)
);

ALTER TABLE public.league_rankings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can view rankings" ON public.league_rankings FOR SELECT TO authenticated USING (true);
CREATE POLICY "Users can insert own rankings" ON public.league_rankings FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own rankings" ON public.league_rankings FOR UPDATE TO authenticated USING (auth.uid() = user_id);

-- Technical guides
CREATE TABLE public.technical_guides (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lesson_id UUID NOT NULL REFERENCES public.lessons(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  summary TEXT NOT NULL DEFAULT '',
  content TEXT NOT NULL DEFAULT '',
  icon TEXT NOT NULL DEFAULT '📘',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(lesson_id)
);

ALTER TABLE public.technical_guides ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read guide metadata" ON public.technical_guides FOR SELECT TO authenticated USING (true);

-- User guide reads
CREATE TABLE public.user_guide_reads (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  guide_id UUID NOT NULL REFERENCES public.technical_guides(id) ON DELETE CASCADE,
  read_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(user_id, guide_id)
);

ALTER TABLE public.user_guide_reads ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own reads" ON public.user_guide_reads FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own reads" ON public.user_guide_reads FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- ============ FUNÇÕES ============

-- Get effective hearts (auto-refill 1 per 30 min, max 5)
CREATE OR REPLACE FUNCTION public.get_effective_hearts(p_hearts INTEGER, p_hearts_updated_at TIMESTAMPTZ)
RETURNS INTEGER
LANGUAGE sql
IMMUTABLE
SET search_path = public
AS $$
  SELECT LEAST(5, p_hearts + FLOOR(EXTRACT(EPOCH FROM (NOW() - COALESCE(p_hearts_updated_at, NOW()))) / 1800)::INTEGER);
$$;

-- User completed lesson check
CREATE OR REPLACE FUNCTION public.user_completed_lesson(p_user_id UUID, p_lesson_id UUID)
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.user_lesson_progress
    WHERE user_id = p_user_id
      AND lesson_id = p_lesson_id
      AND completed = true
  );
$$;

-- XP to FinCoins reward
CREATE OR REPLACE FUNCTION public.handle_xp_coin_reward()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  coins_to_add integer;
BEGIN
  IF NEW.xp_total IS NOT NULL AND OLD.xp_total IS NOT NULL AND NEW.xp_total > OLD.xp_total THEN
    coins_to_add := floor(NEW.xp_total / 50.0) - floor(OLD.xp_total / 50.0);
    IF coins_to_add > 0 THEN
      NEW.fincoins := COALESCE(NEW.fincoins, 0) + coins_to_add;
    END IF;
  END IF;
  RETURN NEW;
END;
$$;

-- Trigger for XP to coins
DROP TRIGGER IF EXISTS trg_xp_coin_reward ON public.profiles;
CREATE TRIGGER trg_xp_coin_reward
  BEFORE UPDATE ON public.profiles
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_xp_coin_reward();

-- ============ DADOS INICIAIS (SEEDS) ============

-- Badges
INSERT INTO public.badges (name, description, icon, criteria_type, criteria_value) VALUES
  ('Estudioso', 'Leu todos os guias técnicos disponíveis', '📚', 'guides_read', 3),
  ('Primeira Aula', 'Completou sua primeira lição', '🎯', 'lessons', 1),
  ('Mestre dos Investimentos', 'Completou 50 lições', '📈', 'lessons', 50),
  ('Streak de 7 Dias', 'Mantenha uma sequência de 7 dias', '🔥', 'streak', 7),
  ('Streak de 30 Dias', 'Mantenha uma sequência de 30 dias', '💪', 'streak', 30),
  ('Streak de 100 Dias', 'Mantenha uma sequência de 100 dias', '⚡', 'streak', 100),
  ('Investidor Bronze', 'Alcance a liga Bronze', '🥉', 'league', 1),
  ('Investidor Prata', 'Alcance a liga Prata', '🥈', 'league', 2),
  ('Investidor Ouro', 'Alcance a liga Ouro', '🥇', 'league', 3),
  ('Investidor Diamante', 'Alcance a liga Diamante', '💎', 'league', 4)
ON CONFLICT DO NOTHING;

-- Daily quests padrão
INSERT INTO public.daily_quests (description, requirement_type, requirement_value, xp_reward, fincoin_reward) VALUES
  ('Complete 1 lição', 'lessons', 1, 10, 5),
  ('Complete 3 lições', 'lessons', 3, 25, 10),
  ('Ganhe 15 XP hoje', 'xp', 15, 15, 5),
  ('Ganhe 50 XP hoje', 'xp', 50, 40, 20)
ON CONFLICT DO NOTHING;