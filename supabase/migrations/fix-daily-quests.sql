-- ============================================
-- CORREÇÕES DAS MISSÕES DIÁRIAS
-- ============================================

-- 1. Adicionar coluna day_index se não existir
ALTER TABLE public.daily_quests ADD COLUMN IF NOT EXISTS day_index INTEGER;

-- 2. Definir as missões com day_index (2 por dia = rotação de 4 dias)
TRUNCATE public.daily_quests CASCADE;

INSERT INTO public.daily_quests (description, requirement_type, requirement_value, xp_reward, fincoin_reward, day_index) VALUES
  -- Dia 1
  ('Complete 1 lição', 'lessons_completed', 1, 10, 5, 1),
  ('Ganhe 15 XP hoje', 'xp_earned', 15, 15, 5, 1),
  -- Dia 2
  ('Complete 2 lições', 'lessons_completed', 2, 20, 10, 2),
  ('Ganhe 30 XP hoje', 'xp_earned', 30, 25, 10, 2),
  -- Dia 3
  ('Complete 3 lições', 'lessons_completed', 3, 30, 15, 3),
  ('Mantenha sua sequência', 'streak_maintain', 1, 20, 10, 3),
  -- Dia 4
  ('Complete 1 lição perfeita', 'perfect_lessons', 1, 25, 15, 4),
  ('Ganhe 50 XP hoje', 'xp_earned', 50, 40, 20, 4)
ON CONFLICT DO NOTHING;

-- 3. Criar função para obter as missões do dia baseado no servidor
CREATE OR REPLACE FUNCTION get_daily_quests_for_user(p_user_id UUID)
RETURNS TABLE (
  id UUID,
  description TEXT,
  requirement_type TEXT,
  requirement_value INTEGER,
  xp_reward INTEGER,
  fincoin_reward INTEGER,
  progress INTEGER,
  completed BOOLEAN
) AS $$
BEGIN
  -- Pegar o dia do ano no fuso do servidor
  RETURN QUERY
  SELECT 
    dq.id,
    dq.description,
    dq.requirement_type,
    dq.requirement_value,
    dq.xp_reward,
    dq.fincoin_reward,
    COALESCE(udqp.progress, 0)::INTEGER AS progress,
    COALESCE(udqp.completed, FALSE)::BOOLEAN AS completed
  FROM daily_quests dq
  LEFT JOIN user_daily_quest_progress udqp 
    ON udqp.quest_id = dq.id 
    AND udqp.user_id = p_user_id 
    AND udqp.date = CURRENT_DATE
  WHERE dq.day_index = (
    (EXTRACT(DOY FROM CURRENT_DATE)::INTEGER - 1) % 4 + 1
  )
  ORDER BY dq.id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 4. Criar função para atualizar progresso da missão
CREATE OR REPLACE FUNCTION update_quest_progress(
  p_user_id UUID,
  p_requirement_type TEXT,
  p_value INTEGER
) RETURNS VOID AS $$
DECLARE
  v_today_quests RECORD;
  v_new_progress INTEGER;
  v_completed BOOLEAN;
BEGIN
  -- Para cada missão do dia atual
  FOR v_today_quests IN 
    SELECT dq.id, dq.requirement_type, dq.requirement_value
    FROM daily_quests dq
    WHERE dq.day_index = (EXTRACT(DOY FROM CURRENT_DATE)::INTEGER - 1) % 4 + 1
  LOOP
    -- Verificar se o tipo de requisito corresponde
    IF v_today_quests.requirement_type = p_requirement_type THEN
      -- Calcular novo progresso
      v_new_progress := p_value;
      
      -- Verificar se completou
      v_completed := v_new_progress >= v_today_quests.requirement_value;
      
      -- Atualizar ou inserir progresso
      INSERT INTO user_daily_quest_progress (user_id, quest_id, progress, completed, date)
      VALUES (p_user_id, v_today_quests.id, v_new_progress, v_completed, CURRENT_DATE)
      ON CONFLICT (user_id, quest_id, date) 
      DO UPDATE SET 
        progress = LEAST(v_new_progress, v_today_quests.requirement_value),
        completed = v_completed;
    END IF;
  END LOOP;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 5. Criar função para verificar se é dia de sequência (streak)
CREATE OR REPLACE FUNCTION check_streak_quest(p_user_id UUID)
RETURNS INTEGER AS $$
DECLARE
  v_streak INTEGER;
  v_last_date DATE;
  v_today DATE := CURRENT_DATE;
BEGIN
  -- Buscar último progresso registrado
  SELECT MAX(date), COUNT(DISTINCT date) 
  INTO v_last_date, v_streak
  FROM user_daily_quest_progress
  WHERE user_id = p_user_id 
    AND completed = TRUE;

  -- Se última conclusão foi ontem ou hoje, mantém streak
  IF v_last_date IS NOT NULL AND v_last_date >= v_today - INTERVAL '1 day' THEN
    RETURN v_streak;
  END IF;
  
  RETURN 0;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 6. Criar view para facilitar consulta
CREATE OR REPLACE VIEW user_daily_quests_view AS
SELECT 
  auth.uid() as user_id,
  (get_daily_quests_for_user(auth.uid())).*;