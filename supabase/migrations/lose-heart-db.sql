-- Função para perder coração (versão simplificada)
-- Execute no SQL Editor do Supabase

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
  -- Get profile
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

  -- Decrease heart
  v_new_hearts := v_effective_hearts - 1;
  
  -- Update profile
  UPDATE profiles SET
    hearts = v_new_hearts,
    hearts_updated_at = NOW()
  WHERE id = p_user_id;

  RETURN json_build_object('success', true, 'hearts', v_new_hearts);
END;
$$;