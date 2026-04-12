-- Função atualizada com IDs corretos
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
    VALUES ('b808c60d-c0b0-4892-bd5d-ec0dc58eabf1', '635eb5b5-5c2c-4a98-8b1f-832973bf8237', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Sabrina → Espresso
  IF uname LIKE '%sabrina%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    SELECT NEW.id, id, NOW() FROM badges WHERE name = 'Espresso'
    ON CONFLICT DO NOTHING;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_all_badges ON profiles;
CREATE TRIGGER check_all_badges
  AFTER INSERT OR UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION check_username_badges();

-- Forçar atualizar Heitor
UPDATE profiles SET username = username WHERE id = 'b808c60d-c0b0-4892-bd5d-ec0dc58eabf1';