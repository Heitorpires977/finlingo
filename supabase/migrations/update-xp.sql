-- Atualizar XP de todas as lições para 25
UPDATE public.lessons SET xp_reward = 25 WHERE xp_reward = 10;

-- Verificar
SELECT id, title, xp_reward FROM public.lessons ORDER BY section_id, lesson_number;