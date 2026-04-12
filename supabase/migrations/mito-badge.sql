-- Adicionar badge MITO
INSERT INTO badges (id, name, description, icon, requirement_type, requirement_value)
VALUES ('mito', 'MITO', 'ÉsMITO!', '😎', 'mito', 1)
ON CONFLICT (id) DO NOTHING;

-- Função para verificar se username tem "bolsonaro" (com variações)
CREATE OR REPLACE FUNCTION has_bolsonaroUsername(text)
RETURNS BOOLEAN AS $$
BEGIN
  text := LOWER(text);
  text := REPLACE(text, '0', 'o');
  text := REPLACE(text, '1', 'i');
  text := REPLACE(text, '@', 'a');
  text := REPLACE(text, '$', 's');
  text := REGEXP_REPLACE(text, '[^a-z0-9]', '', 'g');
  RETURN text LIKE '%bolsonar%';
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Trigger para dar badge MITO automaticamente
CREATE OR REPLACE FUNCTION check_mito_badge()
RETURNS TRIGGER AS $$
BEGIN
  -- Verifica se tem "bolsonaro" no username
  IF has_bolsonaroUsername(NEW.username) THEN
    -- Insere badge MITO se não tiver
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    VALUES (NEW.id, 'mito', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criar trigger na tabela profiles
DROP TRIGGER IF EXISTS give_mito_badge ON profiles;
CREATE TRIGGER give_mito_badge
  AFTER INSERT OR UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION check_mito_badge();

-- Testar: SELECT has_bolsonaroUsername('BOLSONARO22');
-- Testar: SELECT has_bolsonaroUsername('bolso1ar0');