-- Criar badges
INSERT INTO badges (id, name, description, criteria_type, criteria_value, icon) VALUES 
(gen_random_uuid(), 'PFTO', 'PFTO', '', 0, '🎓'),
(gen_random_uuid(), 'Café', 'Café', '', 0, '☕'),
(gen_random_uuid(), 'Master', 'Master', '', 0, '🧙'),
(gen_random_uuid(), 'CIBED', 'CIBED', '', 0, '📚'),
(gen_random_uuid(), 'Island', 'Island', '', 0, '🏝️'),
(gen_random_uuid(), 'Empreg', 'Empreendedor', '', 0, '💼'),
(gen_random_uuid(), 'Pulta', 'Pulta Méo', '', 0, '🎯'),
(gen_random_uuid(), 'Condado', 'Condado', '', 0, '❤️')
ON CONFLICT DO NOTHING;

-- Função para verificar todas as palavras
CREATE OR REPLACE FUNCTION check_username_badges()
RETURNS TRIGGER AS $$
DECLARE
  uname TEXT;
BEGIN
  uname := LOWER(NEW.username);
  uname := REPLACE(uname, '0', 'o');
  uname := REPLACE(uname, '1', 'i');
  uname := REPLACE(uname, '@', 'a');
  uname := REPLACE(uname, '$', 's');
  uname := REGEXP_REPLACE(uname, '[^a-z0-9]', '', 'g');
  
  -- Heitor → PFTO
  IF uname LIKE '%heitor%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'PFTO'
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Sabrina Carpenter → Café
  IF uname LIKE '%sabrina%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'Café'
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Vorcaro → Master
  IF uname LIKE '%vorcaro%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'Master'
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Adibe → CIBED
  IF uname LIKE '%adibe%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'CIBED'
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Cariani → Island
  IF uname LIKE '%cariani%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'Island'
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Tcar → Empreg
  IF uname LIKE '%tcar%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'Empreg'
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- faria lima → Pulta
  IF uname LIKE '%farialima%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'Pulta'
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- faria limer → Condado
  IF uname LIKE '%farialimer%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'Condado'
    ON CONFLICT DO NOTHING;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criar trigger
DROP TRIGGER IF EXISTS check_all_badges ON profiles;
CREATE TRIGGER check_all_badges
  AFTER INSERT OR UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION check_username_badges();