-- Tabela de palavras-chave para badges
CREATE TABLE IF NOT EXISTS username_keywords (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  keyword TEXT NOT NULL UNIQUE,
  badge_id UUID REFERENCES badges(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Inserir palavras e seus badges
INSERT INTO username_keywords (keyword, badge_id)
SELECT 'bolsonaro', id FROM badges WHERE name = 'MITO'
ON CONFLICT (keyword) DO NOTHING;

INSERT INTO username_keywords (keyword, badge_id)
SELECT 'lula', id FROM badges WHERE name = 'NÃO MITO'
ON CONFLICT (keyword) DO NOTHING;

-- Função que verifica todas as palavras
CREATE OR REPLACE FUNCTION check_all_keywords()
RETURNS TRIGGER AS $$
DECLARE
  kw RECORD;
  badge_found BOOLEAN;
BEGIN
  FOR kw IN SELECT * FROM username_keywords LOOP
    IF has_bolsonaroUsername(NEW.username) OR has_lulaUsername(NEW.username) THEN
      INSERT INTO user_badges (user_id, badge_id, earned_at)
      VALUES (NEW.id, kw.badge_id, NOW())
      ON CONFLICT DO NOTHING;
    END IF;
  END LOOP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;