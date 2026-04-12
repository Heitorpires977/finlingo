-- ============================================
-- DEBUG COMPLETO
-- Execute no SQL Editor
-- ============================================

-- 1. Verificar se as funções existem
SELECT routine_name, routine_type 
FROM information_schema.routines 
WHERE routine_schema = 'public' 
AND routine_name IN ('complete_lesson_v2', 'lose_heart_v2');

-- 2. Ver user ID e lesson ID
SELECT 
  p.id as user_id,
  p.username,
  p.xp_total,
  l.id as lesson_id,
  l.title as lesson_title,
  l.xp_reward
FROM profiles p
CROSS JOIN LATERAL (
  SELECT id, title, xp_reward 
  FROM lessons 
  ORDER BY section_id, lesson_number 
  LIMIT 1
) l
WHERE p.username IS NOT NULL
LIMIT 1;

-- 3. Testar a função diretamente (substitua os IDs)
-- SELECT complete_lesson_v2('SEU_USER_ID', 'ID_DA_LICAO', 0);