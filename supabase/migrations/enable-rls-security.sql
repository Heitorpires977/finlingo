-- =====================================================
-- Row Level Security (RLS) - Configure proteção no banco
-- Execute este arquivo no Supabase SQL Editor
-- =====================================================

-- ------------------------------------------------------------
-- Tabela: profiles
-- ------------------------------------------------------------
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Usuáriosonly podem ver e editar seus próprios dados
CREATE POLICY "Users can select own profile" ON public.profiles
  FOR SELECT
  USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON public.profiles
  FOR UPDATE
  USING (auth.uid() = id);

-- ------------------------------------------------------------
-- Tabela: user_progress
-- ------------------------------------------------------------
ALTER TABLE public.user_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can select own progress" ON public.user_progress
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own progress" ON public.user_progress
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own progress" ON public.user_progress
  FOR UPDATE
  USING (auth.uid() = user_id);

-- ------------------------------------------------------------
-- Tabela: daily_quests
-- ------------------------------------------------------------
ALTER TABLE public.daily_quests ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can select own daily quests" ON public.daily_quests
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own daily quests" ON public.daily_quests
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own daily quests" ON public.daily_quests
  FOR UPDATE
  USING (auth.uid() = user_id);

-- ------------------------------------------------------------
-- Tabela: transactions
-- ------------------------------------------------------------
ALTER TABLE public.transactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can select own transactions" ON public.transactions
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own transactions" ON public.transactions
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- ------------------------------------------------------------
-- Tabela: user_badges
-- ------------------------------------------------------------
ALTER TABLE public.user_badges ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can select own badges" ON public.user_badges
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own badges" ON public.user_badges
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- ------------------------------------------------------------
-- Tabela: streak_freezes
-- ------------------------------------------------------------
ALTER TABLE public.streak_freezes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can select own streak freezes" ON public.streak_freezes
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own streak freezes" ON public.streak_freezes
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- ------------------------------------------------------------
-- Tabela: lessons (pode ser lida por todos, mas não editada)
-- ------------------------------------------------------------
ALTER TABLE public.lessons ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read lessons" ON public.lessons
  FOR SELECT
  USING (true);

-- ------------------------------------------------------------
-- Tabela: daily_quests (tabela de referência, não editable)
-- ------------------------------------------------------------
ALTER TABLE public.daily_quests_definition ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read quest definitions" ON public.daily_quests_definition
  FOR SELECT
  USING (true);

-- ------------------------------------------------------------
-- Tabela: technical_guides (pode ser lida por todos)
-- ------------------------------------------------------------
ALTER TABLE public.technical_guides ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read technical guides" ON public.technical_guides
  FOR SELECT
  USING (true);

-- ------------------------------------------------------------
-- Tabela: user_technical_guide_progress
-- ------------------------------------------------------------
ALTER TABLE public.user_technical_guide_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can select own guide progress" ON public.user_technical_guide_progress
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own guide progress" ON public.user_technical_guide_progress
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own guide progress" ON public.user_technical_guide_progress
  FOR UPDATE
  USING (auth.uid() = user_id);

-- =====================================================
SELECT 'RLS configurado com sucesso!' as resultado;
-- =====================================================