-- ============================================
-- CRIAR FUNÇÕES NO BANCO
-- Execute no SQL Editor do Supabase
-- ============================================

-- 1. Função para completar lição
CREATE OR REPLACE FUNCTION complete_lesson_v2(
  p_user_id UUID,
  p_lesson_id UUID,
  p_mistakes INTEGER DEFAULT 0
)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_lesson RECORD;
  v_profile RECORD;
  v_xp_reward INTEGER;
  v_perfect BOOLEAN;
  v_total_xp INTEGER;
  v_coins INTEGER;
  v_today TEXT;
  v_new_streak INTEGER;
BEGIN
  -- Get lesson
  SELECT * INTO v_lesson FROM lessons WHERE id = p_lesson_id;
  IF NOT FOUND THEN
    RETURN json_build_object('error', 'Lesson not found');
  END IF;

  -- Get profile
  SELECT * INTO v_profile FROM profiles WHERE id = p_user_id;
  IF NOT FOUND THEN
    RETURN json_build_object('error', 'Profile not found');
  END IF;

  -- Check if already completed
  IF EXISTS (
    SELECT 1 FROM user_lesson_progress 
    WHERE user_id = p_user_id AND lesson_id = p_lesson_id AND completed = true
  ) THEN
    RETURN json_build_object('success', true, 'xpEarned', 0, 'coinsEarned', 0, 'perfect', false);
  END IF;

  -- Calculate XP
  v_perfect := p_mistakes = 0;
  v_xp_reward := COALESCE(v_lesson.xp_reward, 10) + CASE WHEN v_perfect THEN 5 ELSE 0 END;
  v_total_xp := v_xp_reward;
  v_coins := FLOOR(v_total_xp / 50.0);
  v_today := CURRENT_DATE::text;

  -- Check streak
  IF v_profile.last_lesson_date IS DISTINCT FROM v_today THEN
    v_new_streak := COALESCE(v_profile.streak_current, 0) + 1;
  ELSE
    v_new_streak := COALESCE(v_profile.streak_current, 0);
  END IF;

  -- Update progress
  INSERT INTO user_lesson_progress (user_id, lesson_id, completed, perfect, attempts, completed_at)
  VALUES (p_user_id, p_lesson_id, true, v_perfect, 1, NOW())
  ON CONFLICT (user_id, lesson_id) DO UPDATE SET
    completed = true,
    perfect = v_perfect,
    attempts = user_lesson_progress.attempts + 1,
    completed_at = NOW();

  -- Update profile
  UPDATE profiles SET
    xp_total = COALESCE(xp_total, 0) + v_total_xp,
    xp_weekly = COALESCE(xp_weekly, 0) + v_total_xp,
    fincoins = COALESCE(fincoins, 0) + v_coins,
    streak_current = v_new_streak,
    streak_longest = GREATEST(COALESCE(streak_longest, 0), v_new_streak),
    last_lesson_date = v_today
  WHERE id = p_user_id;

  RETURN json_build_object(
    'success', true,
    'xpEarned', v_total_xp,
    'coinsEarned', v_coins,
    'perfect', v_perfect
  );
END;
$$;

-- 2. Função para perder coração
CREATE OR REPLACE FUNCTION lose_heart_v2(p_user_id UUID)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_profile RECORD;
  v_elapsed INTEGER;
  v_effective_hearts INTEGER;
  v_new_hearts INTEGER;
BEGIN
  SELECT * INTO v_profile FROM profiles WHERE id = p_user_id;
  IF NOT FOUND THEN
    RETURN json_build_object('error', 'Profile not found');
  END IF;

  -- Calculate effective hearts
  v_elapsed := EXTRACT(EPOCH FROM (NOW() - COALESCE(v_profile.hearts_updated_at, NOW())))::INTEGER;
  v_effective_hearts := LEAST(5, COALESCE(v_profile.hearts, 0) + FLOOR(v_elapsed / 1800));

  IF v_effective_hearts <= 0 THEN
    RETURN json_build_object('success', true, 'hearts', 0);
  END IF;

  v_new_hearts := v_effective_hearts - 1;
  
  UPDATE profiles SET
    hearts = v_new_hearts,
    hearts_updated_at = NOW()
  WHERE id = p_user_id;

  RETURN json_build_object('success', true, 'hearts', v_new_hearts);
END;
$$;

-- Verificar se foram criadas
SELECT 'Funções criadas com sucesso!' as resultado;