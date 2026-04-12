-- Function to purchase items from shop
CREATE OR REPLACE FUNCTION purchase_item(p_item_type TEXT)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS
$BODY$
DECLARE
  v_user_id UUID;
  v_price INTEGER;
  v_fincoins INTEGER;
BEGIN
  v_user_id := auth.uid();
  IF v_user_id IS NULL THEN
    RETURN json_build_object('error', 'Not authenticated');
  END IF;

  IF p_item_type = 'heart_refill' THEN
    v_price := 3;
  ELSIF p_item_type = 'xp_boost' THEN
    v_price := 50;
  ELSIF p_item_type = 'streak_freeze' THEN
    v_price := 20;
  ELSE
    RETURN json_build_object('error', 'Invalid item');
  END IF;

  SELECT fincoins INTO v_fincoins FROM profiles WHERE id = v_user_id;
  
  IF v_fincoins IS NULL THEN
    RETURN json_build_object('error', 'Profile not found');
  END IF;

  IF v_fincoins < v_price THEN
    RETURN json_build_object('error', 'Insufficient FinCoins');
  END IF;

  UPDATE profiles SET fincoins = fincoins - v_price WHERE id = v_user_id;

  IF p_item_type = 'heart_refill' THEN
    UPDATE profiles SET hearts = 5, hearts_updated_at = NOW() WHERE id = v_user_id;
  ELSIF p_item_type = 'xp_boost' THEN
    UPDATE profiles SET xp_boost_until = NOW() + INTERVAL '30 minutes' WHERE id = v_user_id;
  ELSIF p_item_type = 'streak_freeze' THEN
    INSERT INTO streak_freezes (user_id) VALUES (v_user_id);
  END IF;

  RETURN json_build_object('success', true, 'item', p_item_type);
END;
$BODY$;