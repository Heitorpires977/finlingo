-- =====================================================
-- Funções RPC para o FinLingo
-- Complete Lesson v2
-- =====================================================

CREATE OR REPLACE FUNCTION complete_lesson_v2(
  p_user_id UUID,
  p_lesson_id TEXT,
  p_mistakes INTEGER
)
RETURNS JSONB AS $$
DECLARE
  result JSONB;
  lesson_record RECORD;
  xp_granted INTEGER;
  coins_granted INTEGER;
  is_perfect BOOLEAN;
  current_streak INTEGER;
  current_xp INTEGER;
  current_coins INTEGER;
  current_hearts INTEGER;
BEGIN
  -- Buscar dados da lição
  SELECT * INTO lesson_record FROM lessons WHERE id = p_lesson_id;
  IF lesson_record IS NULL THEN
    RETURN jsonb_build_object('success', false, 'error', 'Lição não encontrada');
  END IF;

  -- Calcular recompensas
  xp_granted := lesson_record.xp_reward;
  coins_granted := CEIL(xp_granted::NUMERIC / 10);
  is_perfect := p_mistakes = 0;
  
  IF is_perfect THEN
    xp_granted := xp_granted + 5;
    coins_granted := coins_granted + 2;
  END IF;

  -- Atualizar perfil do usuário
  UPDATE profiles
  SET 
    xp_total = xp_total + xp_granted,
    xp_weekly = xp_weekly + xp_granted,
    fincoins = fincoins + coins_granted,
    streak_current = CASE 
      WHEN last_lesson_date = CURRENT_DATE - INTERVAL '1 day' THEN streak_current + 1
      WHEN last_lesson_date = CURRENT_DATE THEN streak_current
      ELSE 1
    END,
    streak_longest = CASE 
      WHEN streak_current + 1 > streak_longest THEN streak_current + 1
      ELSE streak_longest
    END,
    last_lesson_date = CURRENT_DATE
  WHERE id = p_user_id;

  -- Registrar progresso
  INSERT INTO user_lesson_progress (user_id, lesson_id, completed, perfect, mistakes, completed_at)
  VALUES (p_user_id, p_lesson_id, true, is_perfect, p_mistakes, NOW())
  ON CONFLICT (user_id, lesson_id) DO UPDATE
  SET completed = true, perfect = is_perfect, mistakes = p_mistakes, completed_at = NOW();

  -- Buscar dados atualizados
  SELECT xp_total, fincoins, streak_current INTO current_xp, current_coins, current_streak
  FROM profiles WHERE id = p_user_id;

  result := jsonb_build_object(
    'success', true,
    'xpEarned', xp_granted,
    'coinsEarned', coins_granted,
    'perfect', is_perfect,
    'xpTotal', current_xp,
    'coinsTotal', current_coins,
    'streak', current_streak
  );

  RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Lose Heart v2
CREATE OR REPLACE FUNCTION lose_heart_v2(p_user_id UUID)
RETURNS JSONB AS $$
DECLARE
  current_hearts INTEGER;
  result JSONB;
BEGIN
  SELECT hearts INTO current_hearts FROM profiles WHERE id = p_user_id;
  
  IF current_hearts IS NULL OR current_hearts <= 0 THEN
    RETURN jsonb_build_object('success', false, 'hearts', 0);
  END IF;

  UPDATE profiles
  SET hearts = hearts - 1, hearts_updated_at = NOW()
  WHERE id = p_user_id;

  SELECT hearts INTO current_hearts FROM profiles WHERE id = p_user_id;
  
  result := jsonb_build_object('success', true, 'hearts', current_hearts);
  RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Purchase Item
CREATE OR REPLACE FUNCTION purchase_item(p_user_id TEXT, p_item_type TEXT)
RETURNS JSONB AS $$
DECLARE
  current_coins INTEGER;
  item_price INTEGER;
  result JSONB;
  item_cost RECORD;
BEGIN
  item_price := CASE p_item_type
    WHEN 'streak_freeze' THEN 50
    WHEN 'xp_boost' THEN 100
    WHEN 'heart_pack' THEN 75
    WHEN 'coin_pack' THEN 50
    ELSE 0
  END;

  IF item_price = 0 THEN
    RETURN jsonb_build_object('success', false, 'error', 'Item inválido');
  END IF;

  SELECT fincoins INTO current_coins FROM profiles WHERE id = p_user_id::UUID;
  
  IF current_coins < item_price THEN
    RETURN jsonb_build_object('success', false, 'error', 'Moedas insuficientes');
  END IF;

  UPDATE profiles
  SET fincoins = fincoins - item_price
  WHERE id = p_user_id::UUID;

  result := jsonb_build_object(
    'success', true,
    'item', p_item_type,
    'price', item_price,
    'coinsRemaining', current_coins - item_price
  );
  RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant XP (admin function)
CREATE OR REPLACE FUNCTION grant_xp(p_user_id TEXT, p_amount INTEGER)
RETURNS VOID AS $$
BEGIN
  UPDATE profiles
  SET xp_total = xp_total + p_amount,
      xp_weekly = xp_weekly + p_amount
  WHERE id = p_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Update Streak (automatic)
CREATE OR REPLACE FUNCTION update_streak()
RETURNS VOID AS $$
BEGIN
  UPDATE profiles
  SET streak_current = 0
  WHERE last_lesson_date < CURRENT_DATE - INTERVAL '1 day';
END;
$$ LANGUAGE plpgsql;