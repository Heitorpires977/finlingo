-- Debug: Testar funções diretamente
-- Execute no SQL Editor

-- Testar complete_lesson_v2 com um user e lesson específicos
-- Substitua os IDs pelos seus dados

SELECT 
  p.id as user_id,
  p.username,
  l.id as lesson_id,
  l.title
FROM profiles p
CROSS JOIN LATERAL (
  SELECT id, title FROM lessons ORDER BY section_id, lesson_number LIMIT 1
) l
WHERE p.username IS NOT NULL
LIMIT 1;