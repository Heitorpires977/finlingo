-- Adicionar mais palavras-chave na função
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
    VALUES (NEW.id, '635eb5b5-5c2c-4a98-8b1f-832973bf8237', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Sabrina → Espresso
  IF uname LIKE '%sabrina%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    VALUES (NEW.id, 'acb137a4-40f3-4378-b07c-36c8d19cd28c', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Vorcaro → Master
  IF uname LIKE '%vorcaro%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    VALUES (NEW.id, '4f3a7795-b4b9-4fa4-b8f7-f9e2257bbcc0', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Adibe → CIBED
  IF uname LIKE '%adibe%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    VALUES (NEW.id, 'ce4a080f-f8c3-4405-94d0-d362fd321088', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Cariani → Island
  IF uname LIKE '%cariani%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    VALUES (NEW.id, 'b88ada2a-6b68-4c4c-b69d-26877501f5ea', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- Tcar → Empreg
  IF uname LIKE '%tcar%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    VALUES (NEW.id, '0a978ed7-7c28-4f54-a74c-ff4bbea04a91', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  
  -- faria lima → Pulta
  IF uname LIKE '%farialima%' THEN
    INSERT INTO user_badges (user_id, badge_id, earned_at)
    VALUES (NEW.id, 'cb3b61c7-cf50-4f07-ac60-49796f8a82bd', NOW())
    ON CONFLICT DO NOTHING;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;