-- Função para leaderboard (dados públicos)
CREATE OR REPLACE FUNCTION get_leaderboard()
RETURNS TABLE (
  id UUID,
  username TEXT,
  xp_weekly INTEGER,
  league TEXT,
  avatar_id INTEGER
) SECURITY DEFINER SET search_path = public AS $$
BEGIN
  RETURN QUERY
  SELECT p.id, p.username, p.xp_weekly, p.league, p.avatar_id
  FROM profiles p
  ORDER BY p.xp_weekly DESC
  LIMIT 20;
END;
$$ LANGUAGE plpgsql;

-- Permitir uso por todos usuários autenticados
GRANT EXECUTE ON FUNCTION get_leaderboard() TO authenticated;
GRANT EXECUTE ON FUNCTION get_leaderboard() TO anon;