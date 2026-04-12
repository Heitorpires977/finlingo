-- 1. Criar VIEW com schema explícito
CREATE OR REPLACE VIEW public.leaderboard_profiles AS
SELECT id, username, xp_weekly, league, avatar_id
FROM public.profiles;

-- 2. Política para VIEW
DROP POLICY IF EXISTS "Allow all to view leaderboard" ON public.leaderboard_profiles;
CREATE POLICY "Allow all to view leaderboard" ON public.leaderboard_profiles
FOR SELECT TO authenticated
USING (true);

-- 3. Remover políticas abertas
DROP POLICY IF EXISTS "Users can view all profiles" ON public.profiles;

-- 4. Criar política restritiva
DROP POLICY IF EXISTS "Allow authenticated users to view own profile" ON public.profiles;
CREATE POLICY "Allow authenticated users to view own profile" ON public.profiles
FOR SELECT TO authenticated
USING (auth.uid() = id);