-- =====================================================
-- SEGURANÇA DE USERNAME - VERSÃO ROBUSTA
-- =====================================================

-- 1. Criar tabela de palavras bloqueadas
CREATE TABLE IF NOT EXISTS blocked_usernames (
  id SERIAL PRIMARY KEY,
  term TEXT NOT NULL UNIQUE,
  category TEXT DEFAULT 'general',
  severity INT DEFAULT 1
);

-- 2. Inserir lista de palavras bloqueadas
INSERT INTO blocked_usernames (term, category, severity) VALUES
-- RACISMO E DISCRIMINAÇÃO
('nazi', 'racism', 5), ('nazista', 'racism', 5), ('hitler', 'racism', 5), ('reich', 'racism', 5),
('racismo', 'racism', 5), ('racista', 'racism', 5), ('supremacia', 'racism', 5),
('whitepower', 'racism', 5), ('kku', 'racism', 5), ('kkk', 'racism', 5),
('negr', 'racism', 4), ('negrão', 'racism', 4), ('macaco', 'racism', 4),
('macaca', 'racism', 4), ('preto', 'racism', 3), ('negro', 'racism', 4),
('mongoloide', 'racism', 5), ('oriental', 'racism', 2), ('asiatico', 'racism', 3),
('judeu', 'racism', 3), ('judio', 'racism', 3), ('jew', 'racism', 3),

-- SEXUAL E ABAIXO
('pedofilia', 'sexual', 5), ('pedofilo', 'sexual', 5), ('pedophile', 'sexual', 5),
('childsex', 'sexual', 5), ('porn', 'sexual', 4), ('porno', 'sexual', 4),
('xxx', 'sexual', 4), ('sexo', 'sexual', 2), ('sex', 'sexual', 2),
('puta', 'sexual', 4), ('puto', 'sexual', 4), ('merda', 'sexual', 3),
('buceta', 'sexual', 4), ('caralho', 'sexual', 4), ('viado', 'sexual', 3),
('sapatão', 'sexual', 3), ('sapatona', 'sexual', 3), ('bicha', 'sexual', 3),
('traveco', 'sexual', 3), ('fdp', 'sexual', 3), ('filha da puta', 'sexual', 5),
('estupro', 'sexual', 5), ('estuprador', 'sexual', 5), ('rapist', 'sexual', 5),
('shit', 'sexual', 3), ('fuck', 'sexual', 3), ('asshole', 'sexual', 3),
('bitch', 'sexual', 3), ('dick', 'sexual', 3), ('cock', 'sexual', 3),
('vagina', 'sexual', 2), ('penis', 'sexual', 2), ('pussy', 'sexual', 3),
('boob', 'sexual', 2), ('tits', 'sexual', 2), ('ass', 'sexual', 1),

-- OFENSAS E ABAIXO
('estupido', 'insult', 2), ('estupido', 'insult', 2), ('idiota', 'insult', 2),
('burro', 'insult', 2), ('otario', 'insult', 3), ('otária', 'insult', 3),
('retardado', 'insult', 4), ('retard', 'insult', 4), ('debil', 'insult', 3),
('mongol', 'insult', 4), ('aleijado', 'insult', 4), ('loco', 'insult', 1),
('louco', 'insult', 1), ('maluco', 'insult', 2), ('doido', 'insult', 1),
('gordo', 'insult', 2), ('gorda', 'insult', 2), ('feio', 'insult', 1),
('feia', 'insult', 1), ('piranha', 'insult', 3), ('vagabunda', 'insult', 4),
('vadia', 'insult', 3), ('ladrão', 'crime', 4), ('ladrao', 'crime', 4),
('bandido', 'crime', 4), ('malfiador', 'crime', 4), ('assassino', 'crime', 5),

-- CRIME E DROGAS
('droga', 'drugs', 3), ('drogado', 'drugs', 4), ('drogata', 'drugs', 4),
('maconha', 'drugs', 3), ('cocaína', 'drugs', 4), ('crack', 'drugs', 4),
('heroina', 'drugs', 4), (' LSD', 'drugs', 4), (' ecstasy', 'drugs', 4),
('golpe', 'scam', 4), ('scam', 'scam', 4), ('fraude', 'scam', 4),
('phishing', 'scam', 4), ('spam', 'scam', 3), ('hack', 'scam', 3),
('crackudo', 'drugs', 4), ('macumbeiro', 'discrimination', 4),

-- TERRORISMO
('terrorismo', 'terror', 5), ('terrorista', 'terror', 5), ('isis', 'terror', 5),
('al-qaeda', 'terror', 5), ('bomb', 'terror', 4), ('bomba', 'terror', 4),
('atirador', 'terror', 5), ('tiroteio', 'terror', 4), ('massacre', 'terror', 5),

-- SUICÍDIO
('suicida', 'selfharm', 5), ('suicidio', 'selfharm', 5), ('suicide', 'selfharm', 5),
('se matar', 'selfharm', 5), ('morrer', 'selfharm', 2),

-- OFENSAS RELIGIOSAS
('satanas', 'religious', 4), ('satã', 'religious', 4), ('satan', 'religious', 4),
('demonio', 'religious', 3), ('demônio', 'religious', 3), ('inferno', 'religious', 2),
('blasfemia', 'religious', 3),

-- PALAVRÕES GERAIS EM PT/EN/ES
('cuzao', 'profanity', 3), ('cu', 'profanity', 2), ('porra', 'profanity', 2),
('cacete', 'profanity', 3), ('caralho', 'profanity', 4), ('maldita', 'profanity', 3),
('damn', 'profanity', 3), ('hell', 'profanity', 2), ('fuckyou', 'profanity', 4),

-- ANTI-BYPASS (números e símbolos comuns)
('fdp', 'bypass', 4), ('vsf', 'bypass', 4), ('tnc', 'bypass', 4),
('puta', 'bypass', 4), ('kar', 'bypass', 3), ('krl', 'bypass', 4),
('merd', 'bypass', 3), ('piça', 'bypass', 4), ('pqp', 'bypass', 4)
ON CONFLICT (term) DO NOTHING;

-- 3. Função para normalizar username
CREATE OR REPLACE FUNCTION normalize_username(input_text TEXT)
RETURNS TEXT AS $$
BEGIN
    input_text := LOWER(input_text);
    
    -- Anti-leetspeak: números para letras
    input_text := REPLACE(input_text, '4', 'a');
    input_text := REPLACE(input_text, '@', 'a');
    input_text := REPLACE(input_text, '8', 'b');
    input_text := REPLACE(input_text, '3', 'e');
    input_text := REPLACE(input_text, '1', 'i');
    input_text := REPLACE(input_text, '!', 'i');
    input_text := REPLACE(input_text, '0', 'o');
    input_text := REPLACE(input_text, '$', 's');
    input_text := REPLACE(input_text, '5', 's');
    input_text := REPLACE(input_text, '7', 't');
    input_text := REPLACE(input_text, '2', 'z');
    input_text := REPLACE(input_text, '6', 'g');
    input_text := REPLACE(input_text, '9', 'g');
    input_text := REPLACE(input_text, '|', 'l');
    
    -- Remove acentos
    input_text := TRANSLATE(input_text, 'áàâãäéèêëíìîïóòôõöúùûüçñÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇÑ', 'aaaaaeeeeiiiiooooouuuucnAAAAAEEEEIIIOOOOUUUUCN');
    
    -- Remove caracteres especiais (mantém letras, números)
    input_text := REGEXP_REPLACE(input_text, '[^a-z0-9]', '', 'g');
    
    -- Remove caracteres repetidos (estuprrr -> estabiliza)
    input_text := REGEXP_REPLACE(input_text, '(.)\1+', '\1', 'g');
    
    RETURN input_text;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- 4. Função de validação
CREATE OR REPLACE FUNCTION validate_username(p_username TEXT)
RETURNS BOOLEAN AS $$
DECLARE
    normalized_username TEXT;
    blocked_term TEXT;
BEGIN
    normalized_username := normalize_username(p_username);
    
    -- Verifica termos bloquados
    SELECT term INTO blocked_term
    FROM blocked_usernames
    WHERE position(term IN normalized_username) > 0
    LIMIT 1;
    
    IF FOUND THEN
        RETURN FALSE;
    END IF;
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

-- 5. Constraint na tabela profiles
ALTER TABLE profiles ADD CONSTRAINT username_check 
CHECK (validate_username(username) OR username IS NULL);

-- 6. Função para verificar durante INSERT/UPDATE
CREATE OR REPLACE FUNCTION check_username_valid()
RETURNS TRIGGER AS $$
DECLARE
    normalized_username TEXT;
    blocked_term TEXT;
BEGIN
    IF NEW.username IS NULL THEN
        RETURN NEW;
    END IF;
    
    normalized_username := normalize_username(NEW.username);
    
    SELECT term INTO blocked_term
    FROM blocked_usernames
    WHERE position(term IN normalized_username) > 0
    LIMIT 1;
    
    IF FOUND THEN
        RAISE EXCEPTION 'USERNAME_BLOCKED: Este nome de usuário contém palavras não permitidas. Por favor, escolha outro.';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 7. Criar trigger
DROP TRIGGER IF EXISTS enforce_username_policy ON profiles;
CREATE TRIGGER enforce_username_policy
  BEFORE INSERT OR UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION check_username_valid();

-- 8. Trigger no auth.users (para cadastro)
CREATE OR REPLACE FUNCTION check_username_auth()
RETURNS TRIGGER AS $$
DECLARE
    username TEXT;
    normalized_username TEXT;
    blocked_term TEXT;
BEGIN
    -- Pega só do user_metadata
    username := NEW.user_metadata->>'username';
    
    -- Se não tem username, permite (vai ser criado depois)
    IF username IS NULL OR length(username) < 2 THEN
        RETURN NEW;
    END IF;
    
    normalized_username := normalize_username(username);
    
    -- Verifica termos bloquados
    SELECT term INTO blocked_term
    FROM blocked_usernames
    WHERE position(term IN normalized_username) > 0
    LIMIT 1;
    
    IF FOUND THEN
        RAISE EXCEPTION 'USERNAME_BLOCKED: Este nome de usuário contém palavras não permitidas. Por favor, escolha outro.';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS validate_username_signup ON auth.users;
CREATE TRIGGER validate_username_signup
  BEFORE INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION check_username_auth();

-- Testar
-- SELECT normalize_username('N@z!_4s_s');  -- deve retornar 'nazista'
-- SELECT validate_username('heitor');     -- true
-- SELECT validate_username('hitler');       -- false