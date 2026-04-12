-- Função para completar lição (versão simplificada)
-- Execute no SQL Editor do Supabase

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
  v_multiplier INTEGER := 1;
  v_total_xp INTEGER;
  v_coins INTEGER;
  v_today DATE := CURRENT_DATE;
  v_is_new_day BOOLEAN;
  v_new_streak INTEGER;
  v_result JSON;
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
    RETURN json_build_object('success', true, 'xpEarned', 0, 'coinsEarned', 0, 'perfect', false, 'alreadyCompleted', true);
  END IF;

  -- Calculate XP
  v_perfect := p_mistakes = 0;
  v_xp_reward := COALESCE(v_lesson.xp_reward, 10) + CASE WHEN v_perfect THEN 5 ELSE 0 END;
  
  IF v_profile.xp_boost_until IS NOT NULL AND v_profile.xp_boost_until > NOW() THEN
    v_multiplier := 2;
  END IF;
  
  v_total_xp := v_xp_reward * v_multiplier;
  v_coins := FLOOR(v_total_xp / 50.0);

  -- Check streak
  v_is_new_day := v_profile.last_lesson_date IS DISTINCT FROM v_today;
  IF v_is_new_day THEN
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

  -- Return result
  v_result := json_build_object(
    'success', true,
    'xpEarned', v_total_xp,
    'coinsEarned', v_coins,
    'perfect', v_perfect
  );
  
  RETURN v_result;
END;
$$;