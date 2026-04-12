-- Badge NÃO MITO
INSERT INTO badges (id, name, description, criteria_type, criteria_value, icon)
VALUES (gen_random_uuid(), 'NÃO MITO', 'ÉMISMO!', '', 0, '😡');

-- Função anti-lula
CREATE OR REPLACE FUNCTION has_lulaUsername(text TEXT)
RETURNS BOOLEAN AS $$
BEGIN
  text := LOWER(text);
  text := REPLACE(text, '0', 'o');
  text := REPLACE(text, '1', 'i');
  text := REPLACE(text, '@', 'a');
  text := REPLACE(text, '$', 's');
  text := REGEXP_REPLACE(text, '[^a-z0-9]', '', 'g');
  RETURN text LIKE '%lula%';
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Trigger para dar badge NÃO MITO
CREATE OR REPLACE FUNCTION check_nao_mito_badge()
RETURNS TRIGGER AS $$
DECLARE
  badge_id TEXT;
BEGIN
  SELECT id INTO badge_id FROM badges WHERE name = 'NÃO MITO';
  IF has_lulaUsername(NEW.username) AND badge_id IS NOT NULL THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    VALUES (NEW.id, badge_id, NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS give_nao_mito_badge ON profiles;
CREATE TRIGGER give_nao_mito_badge
  AFTER INSERT OR UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION check_nao_mito_badge();

-- Testar
SELECT has_lulaUsername('LULA');
SELECT has_lulaUsername('lul4');
