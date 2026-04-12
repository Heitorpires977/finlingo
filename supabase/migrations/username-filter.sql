-- Função para verificar username apropriado
CREATE OR REPLACE FUNCTION validate_username(p_username TEXT)
RETURNS BOOLEAN AS $$
DECLARE
  blocked_words TEXT[] := ARRAY[
    'nazi', 'hitler', 'nazismo', 'reich', '3rdreich',
    'racismo', 'racista', 'supremacia', 'whitepower',
    'pedofilia', 'pedofilo', 'pedophile', 'child-sex',
    'puta', 'merda', 'fdp', 'cuzao', 'filho da puta',
    'fuck', 'shit', 'asshole', 'bitch', 'dick',
    'golpe', 'scam', 'fraude', 'phishing',
    'spam', 'bot', 'fake',
    'terrorismo', 'terrorista', 'isis', 'al-qaeda',
    'droga', 'drogado', 'maconha', 'cocaína', 'crack',
    'оружие', 'пистолет', 'автомат', -- russo: arma
    'gewalt', 'toller', 'täter', -- alemão relacionado
    '色情', '淫乱', 'ペド', -- japonês/chinês impróprio
    'xxx', 'porn', 'sex', 'adult',
    'hitler', 'oswald', 'mengele',
    'gas', 'camp', 'auschwitz'
  ];
  lower_username TEXT;
  word TEXT;
BEGIN
  lower_username := LOWER(p_username);
  
  FOREACH word IN ARRAY blocked_words LOOP
    IF word != '' AND position(word IN lower_username) > 0 THEN
      RETURN FALSE;
    END IF;
  END LOOP;
  
  RETURN TRUE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Testar a função
-- SELECT validate_username('heitor'); -- deve retornar true
-- SELECT validate_username('hitlerfan'); -- deve retornar false
-- SELECT validate_username('nazi'); -- deve retornar false

-- Criar constraint na tabela profiles
ALTER TABLE profiles ADD CONSTRAINT username_check 
CHECK (validate_username(username) OR username IS NULL);

-- Se já existir dados inválidos, isso pode falhar. Para resolver:
-- UPDATE profiles SET username = 'Usuário' WHERE NOT validate_username(username);