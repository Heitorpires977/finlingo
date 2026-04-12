-- Query para ver todos os usuários cadastrados
-- Execute este código no SQL Editor do Supabase

-- Ver usuários na tabela auth.users (emails)
SELECT id, email, created_at, last_sign_in_at 
FROM auth.users 
ORDER BY created_at DESC;

-- Ver perfis na tabela profiles
SELECT * FROM public.profiles ORDER BY created_at DESC;

-- Ver rankings
SELECT * FROM public.league_rankings ORDER BY week_start DESC;