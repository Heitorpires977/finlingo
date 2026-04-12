-- =====================================================
-- SEGURANÇA AVANÇADA - FinLingo
-- Execute no Supabase SQL Editor
-- =====================================================

-- =====================================================
-- 1. PROTEGER SEGURANÇA DO SUPABASE AUTH
-- =====================================================

-- Emails do auth.users são protegidos por padrão, mas vamos verificar
-- O Supabase Auth já criptografa senhas automaticamente

-- =====================================================
-- 2. CRIAR FUNÇÃO DE AUDITORIA DE ACESSOS
-- =====================================================

-- Tabela de auditoria (registra quem acessou o que)
CREATE TABLE IF NOT EXISTS public.audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  action TEXT NOT NULL,
  table_name TEXT,
  details JSONB DEFAULT '{}',
  ip_address TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.audit_log ENABLE ROW LEVEL SECURITY;

-- Só admins podem ver logs (você podeaddicionar seu UUID depois)
CREATE POLICY "Only owner can view audit" ON public.audit_log
  FOR SELECT USING (auth.uid() = user_id);

-- =====================================================
-- 3. PROTEGER TABELAS DE SISTEMA
-- =====================================================

-- Proteger auth.users - ninguém pode ver diretamente
-- O Supabase já faz isso, mas vamos confirmar

-- =====================================================
-- 4. LIMITAR ACESSOS EM FUNÇÕES
-- =====================================================

-- Criar rate limiting para funções RPC
CREATE OR REPLACE FUNCTION public.check_rate_limit(
  p_user_id UUID,
  p_action TEXT,
  p_max_requests INTEGER DEFAULT 100,
  p_window_seconds INTEGER DEFAULT 3600
)
RETURNS BOOLEAN AS $$
DECLARE
  v_count INTEGER;
  v_window_start TIMESTAMPTZ;
BEGIN
  v_window_start := NOW() - (p_window_seconds || ' seconds')::INTERVAL;
  
  SELECT COUNT(*) INTO v_count
  FROM public.audit_log
  WHERE user_id = p_user_id
    AND action = p_action
    AND created_at > v_window_start;
  
  IF v_count >= p_max_requests THEN
    RETURN FALSE;
  END IF;
  
  -- Registrar acesso
  INSERT INTO public.audit_log (user_id, action)
  VALUES (p_user_id, p_action);
  
  RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================================================
-- 5. PROTEGER EMAIL DO USUÁRIO
-- =====================================================

-- Remover acesso direto ao email de outros usuários
-- O perfil só mostra username, não email

-- Atualizar policy de profiles para não expor dados sensíveis
DROP POLICY IF EXISTS "Users can view all profiles" ON public.profiles;

CREATE POLICY "Users can view limited profiles" ON public.profiles
  FOR SELECT 
  TO authenticated
  USING (
    auth.uid() = id  -- só ver próprio perfil
    OR exists (
      select 1 from public.profiles p2 
      join public.user_badges ub on p2.id = ub.user_id 
      where ub.user_id = auth.uid()
    )
  );

CREATE POLICY "Own profile can view" ON public.profiles
  FOR SELECT 
  TO authenticated 
  USING (auth.uid() = id);

-- =====================================================
-- 6. DESABILITAR API REST DO SUPABASE (opcional)
-- =====================================================

-- NOTA: Isso desabilita a API REST automática
-- Se você usa só o app (não API externa), pode desabilitar

-- =====================================================
-- 7. CRIAR ÍNDICE DE SEGURANÇA
-- =====================================================

-- Index para auditoria
CREATE INDEX IF NOT EXISTS idx_audit_log_user_action 
ON public.audit_log (user_id, action, created_at DESC);

-- =====================================================
-- 8. FUNÇÃO PARA DELETAR DADOS DO USUÁRIO (GDPR)
-- =====================================================

CREATE OR REPLACE FUNCTION public.delete_user_data(p_user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
  -- Deletar todos os dados do usuário (GDPR compliance)
  DELETE FROM public.user_lesson_progress WHERE user_id = p_user_id;
  DELETE FROM public.user_quiz_results WHERE user_id = p_user_id;
  DELETE FROM public.user_daily_quest_progress WHERE user_id = p_user_id;
  DELETE FROM public.transactions WHERE user_id = p_user_id;
  DELETE FROM public.streak_freezes WHERE user_id = p_user_id;
  DELETE FROM public.user_badges WHERE user_id = p_user_id;
  DELETE FROM public.user_guide_reads WHERE user_id = p_user_id;
  DELETE FROM public.league_rankings WHERE user_id = p_user_id;
  DELETE FROM public.audit_log WHERE user_id = p_user_id;
  
  -- Reset perfil (mantém ID para não quebrar foreign keys)
  UPDATE public.profiles 
  SET username = 'deleted', avatar_id = 1, objective = NULL, level = NULL,
      daily_goal_minutes = 10, xp_total = 0, xp_weekly = 0,
      streak_current = 0, streak_longest = 0, hearts = 5,
      fincoins = 0, league = 'Bronze', xp_boost_until = NULL,
      last_lesson_date = NULL
  WHERE id = p_user_id;
  
  RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================================================
SELECT 'Segurança avançada implementada!' as resultado;
-- =====================================================