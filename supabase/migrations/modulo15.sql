-- Módulo 15: Estratégias de Longo Prazo (section_id = 15)
-- Execute este SQL no SQL Editor do Supabase

-- =====================
-- MÓDULO 15: Estratégias de Longo Prazo (section_id = 15)
-- =====================

-- Lesson 15.1: O que é Buy and Hold?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 1, '15.1 O que é Buy and Hold?', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "Comprar, guardar e deixar o tempo trabalhar", "body": "Buy and hold é a estratégia de adquirir ações de empresas de qualidade e mantê-las por muitos anos. Não é passividade — é disciplina.", "emoji": "💡"},
    {"type": "example", "title": "O Investidor que Ficou Rico Não Fazendo Nada", "body": "Ronald Read, faxineiro nos EUA, deixou US$ 8 milhões ao morrer — comprando empresas como Coca-Cola e mantendo por décadas.", "highlight": "Comprar empresas de qualidade\nManter por anos independente de oscilações\nVender apenas se fundamentos mudarem\nTempo no mercado > timing do mercado", "emoji": "🎯"},
    {"type": "activity", "question": "Qual é o princípio central da estratégia buy and hold?", "options": ["Comprar ações e vender rapidamente", "Comprar empresas de qualidade e manter por anos", "Comprar e vender no mesmo dia", "Manter 100% em caixa"], "correct": 1},
    {"type": "true_false", "statement": "Na estratégia buy and hold, o investidor nunca deve vender suas ações.", "correct": 0, "explanation": "Falso! Se os fundamentos mudarem estruturalmente, a venda é correta."},
    {"type": "fill_in_the_blank", "sentence": "A frase: 'O tempo ____ no mercado supera o ____ do mercado'.", "answer": "no", "hint": "Tempo no mercado...", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Buy and hold", "definition": "Comprar e manter por anos"}, {"term": "Timing", "definition": "Tentar acertar o momento"}, {"term": "Venda justificada", "definition": "Mudança estrutural nos fundamentos"}, {"term": "Paciência", "definition": "Ativo mais valioso do longo prazo"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.2: Juros Compostos no Tempo
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 2, '15.2 Juros Compostos no Tempo', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "A oitava maravilha do mundo", "body": "Juros compostos são juros sobre juros — o rendimento de um período é somado ao capital e passa a render também. O efeito ao longo de décadas é absurdo.", "emoji": "💡"},
    {"type": "example", "title": "R$ 1.000 que Viraram R$ 174.000", "body": "R$ 1.000 a 12%/ano: 10 anos = R$ 3.106. 30 anos = R$ 29.960. 50 anos = R$ 289.002. A curva explode no final.", "highlight": "Juros compostos = rendimento sobre rendimento\nEfeito exponencial no longo prazo\nTempo é o fator mais poderoso\nReinvestimento potencializa", "emoji": "🎯"},
    {"type": "activity", "question": "Por que começar aos 20 anos é mais poderoso que aos 35?", "options": ["Menos impostos", "15 anos extras geram diferença exponencial", "Taxas menores", "Empresas crescem mais"], "correct": 1},
    {"type": "true_false", "statement": "O crescimento é linear nos juros compostos.", "correct": 0, "explanation": "Falso! É exponencial."},
    {"type": "fill_in_the_blank", "sentence": "Regra dos ____ calcula anos para dobrar.", "answer": "72", "hint": "72 ÷ taxa = anos", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Juros compostos", "definition": "Rendimento sobre rendimento"}, {"term": "Regra dos 72", "definition": "72 ÷ taxa"}, {"term": "Exponencial", "definition": "Curva que acelera"}, {"term": "Reinvestimento", "definition": "Usar rendimentos para comprar mais"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.3: Aportes Regulares — DCA
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 3, '15.3 Aportes Regulares — O Poder do DCA', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "Investir todo mês independente do preço", "body": "DCA é investir valor fixo em intervalos regulares. Mercado cai = compra mais. Mercado sobe = compra menos. Preço médio tende a ser melhor.", "emoji": "💡"},
    {"type": "example", "title": "DCA vs Timing", "body": "Investidor A: aplica R$ 1.000 todo dia 10. Investidor B: tenta acertar o melhor momento. A quase sempre supera B no longo prazo.", "highlight": "Valor fixo em intervalos regulares\nCompra mais quando barato\nElimina estresse do timing\nFunciona para ações, ETFs, FIIs", "emoji": "🎯"},
    {"type": "activity", "question": "Ativo cai 30%. Qual resultado positivo do DCA?", "options": ["Perde 30%", "Compra mais — reduz preço médio", "Congela aportes", "Protegido por 30 dias"], "correct": 1},
    {"type": "true_false", "statement": "DCA é sempre inferior a investir tudo de uma vez.", "correct": 0, "explanation": "Falso! Em teoria sim, mas na prática impossível acertar o fundo."},
    {"type": "fill_in_the_blank", "sentence": "DCA = Dollar Cost ____.", "answer": "Averaging", "hint": "Custo médio", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "DCA", "definition": "Aportes regulares"}, {"term": "Preço médio", "definition": "Resultado de compras a preços diferentes"}, {"term": "Disciplina", "definition": "Remove emoção"}, {"term": "Mensal", "definition": "Forma mais comum"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.4: Carteira de Dividendos
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 4, '15.4 Carteira de Dividendos', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "Construindo uma máquina de renda passiva", "body": "Carteira de dividendos é focada em empresas que distribuem consistentemente. O objetivo é fluxo crescente de renda passiva.", "emoji": "💡"},
    {"type": "example", "title": "A Carteira que Paga Suas Contas", "body": "Meta R$ 5.000/mês com DY 7%: precisa R$ 857.000 investidos. Com DCA de R$ 2.000/mês por 20 anos a 10%, chega lá.", "highlight": "DY alto e consistente\nEmpresas maduras\nReinvestir no início\nNão precisa vender ativos\nIdeal para independência financeira", "emoji": "🎯"},
    {"type": "activity", "question": "Qual tipo de empresa para carteira de dividendos?", "options": ["Startups", "Empresas maduras", "Empresas em expansão", "Payout zero"], "correct": 1},
    {"type": "true_false", "statement": "Carteira de dividendos permite viver sem vender ações.", "correct": 1, "explanation": "Verdadeiro!"},
    {"type": "fill_in_the_blank", "sentence": "Empresas com 25+ anos de dividendos são aristocratas de ____.", "answer": "dividendos", "hint": "Elite dos pagadores", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Carteira dividendos", "definition": "Foco em renda passiva"}, {"term": "Aristocrata", "definition": "25+ anos crescendo"}, {"term": "Independência", "definition": "Viver dos dividendos"}, {"term": "Reinvestimento", "definition": "加速 composição"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.5: Aristocratas de Dividendos
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 5, '15.5 O que são Aristocratas de Dividendos?', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "A elite dos pagadores", "body": "Aristocratas: 25+ anos aumentando dividendos. No Brasil, 5-10 anos já é pagador consistente.", "emoji": "💡"},
    {"type": "example", "title": "A Coca-Cola que Fez Buffett Bilionário", "body": "Buffett comprou US$ 1,3bi em Coca-Cola em 1988. Hoje recebe US$ 700mi/ano em dividendos — mais que pagou.", "highlight": "EUA: 25+ anos\nBrasil: 5-10 anos\nCoca-Cola: 60+ anos\nHistórico = modelo resiliente", "emoji": "🎯"},
    {"type": "activity", "question": "O que 25+ anos de dividendos prova?", "options": ["Nunca vai falir", "Modelo resiliente em todos os ciclos", "Retorno garantido", "Não precisa reinvestir"], "correct": 1},
    {"type": "true_false", "statement": "No Brasil, aristocratas seguem critério de 25 anos.", "correct": 0, "explanation": "Falso! Mercado brasileiro é mais jovem."},
    {"type": "fill_in_the_blank", "sentence": "Coca-Cola tem mais de ____ anos de dividendos.", "answer": "60", "hint": "Mais que 25 anos", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Aristocrata EUA", "definition": "25+ anos"}, {"term": "Brasil", "definition": "5-10 anos"}, {"term": "Crescente", "definition": "Sinal de lucro"}, {"term": "Yield on cost", "definition": "DY sobre preço original"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.6: Reinvestindo Dividendos
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 6, '15.6 Reinvestindo Dividendos', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "O segredo que multiplica o patrimônio", "body": "Reinvestir dividendos = usar rendimentos para comprar mais ações. Efeito bola de neve — cresce exponencialmente.", "emoji": "💡"},
    {"type": "example", "title": "O Efeito Bola de Neve", "body": "R$ 100k com DY 8%: sem reinvestimento = R$ 466k. Com reinvestimento = R$ 1.175k. Diferença de R$ 709k.", "highlight": "Dividendo → compra mais → gera mais\nExponencial\nMais impactante no início\nFácil: não sacar\nFase de renda: consumir", "emoji": "🎯"},
    {"type": "activity", "question": "Por que mais impactante nos primeiros anos?", "options": ["Menos IR", "Efeito composto tem mais tempo", "Dividendos maiores", "Empresas pagam mais"], "correct": 1},
    {"type": "true_false", "statement": "Reinvestir vs consumir são equivalentes.", "correct": 0, "explanation": "Falso! Diferença pode ser 100%."},
    {"type": "fill_in_the_blank", "sentence": "Usar dividendos para comprar mais = ____ de dividendos.", "answer": "reinvestimento", "hint": "Ciclo que não para", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Reinvestimento", "definition": "Usar para comprar mais"}, {"term": "Bola de neve", "definition": "Cresce exponencialmente"}, {"term": "Acumulação", "definition": "Foco em crescer"}, {"term": "Renda", "definition": "Fase de consumir"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.7: Como Montar uma Carteira
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 7, '15.7 Como Montar uma Carteira de Longo Prazo', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "Da teoria para o portfólio real", "body": "Montar carteira = definir objetivo, prazo, perfil, diversificação e disciplina. Não é escolher as mais badaladas.", "emoji": "💡"},
    {"type": "example", "title": "Carteira Modelo", "body": "R$ 50k: 40% ETFs, 30% ações, 20% FIIs, 10% renda fixa. Revisão semestral. Aportes mensais. Simples e disciplinado.", "highlight": "Defina objetivo\nDiversifique\n5-15 ativos bem analisados\nRevise semestralmente\nDocumente a tese", "emoji": "🎯"},
    {"type": "activity", "question": "Principal erro de longo prazo?", "options": ["Diversificar demais", "Mudar de estratégia durante crises", "Reinvestir dividendos", "Usar DCA"], "correct": 1},
    {"type": "true_false", "statement": "Carteira deve ser revisada diariamente.", "correct": 0, "explanation": "Falso! Semestral é suficiente."},
    {"type": "fill_in_the_blank", "sentence": "Registrar o porquê de cada ativo = ____ de investimento.", "answer": "tese", "hint": "Argumento que justifica", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Revisão semestral", "definition": "Frequência ideal"}, {"term": "Tese", "definition": "Justificativa escrita"}, {"term": "Disciplina", "definition": "Não mudar por oscilação"}, {"term": "Rebalanceamento", "definition": "Ajustar proporções"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.8: Rebalanceamento
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 8, '15.8 Rebalanceamento de Carteira', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "Manter a estratégia ao longo do tempo", "body": "Ativos crescem em velocidades diferentes. Rebalancear = ajustar proporções de volta ao plano original.", "emoji": "💡"},
    {"type": "example", "title": "A Carteira que se Desequilibrou", "body": "Início: 40% ETFs, 40% ações, 20% FIIs. Após 2 anos: ações 60%, ETFs 25%, FIIs 15%. Rebalancear: vender parte, comprar ETFs e FIIs.", "highlight": "Ajustar proporções\nAporte direcionado é mais eficiente\nEvita concentração\nSemestral ou anual\nVende o que subiu, compra o que caiu", "emoji": "🎯"},
    {"type": "activity", "question": "Forma eficiente de rebalancear sem tributação?", "options": ["Vender tudo", "Direcionar novos aportes", "Suspender aportes", "Contratar gestor"], "correct": 1},
    {"type": "true_false", "statement": "Rebalancear mensalmente é recomendado.", "correct": 0, "explanation": "Falso! Excesso de custo."},
    {"type": "fill_in_the_blank", "sentence": "Ativo crescendo demais = ____ de posição.", "answer": "concentração", "hint": "Risco de concentração", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Rebalanceamento", "definition": "Ajuste de proporções"}, {"term": "Aporte", "definition": "Forma eficiente"}, {"term": "Concentração", "definition": "Um ativo domina"}, {"term": "Semestral", "definition": "Frequência adequada"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.9: Quando Vender?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 9, '15.9 Quando Vender?', 25, false, 
{
  "steps": [
    {"type": "explanation", "title": "A decisão mais difícil", "body": "Venda quando os FUNDAMENTOS mudarem, não quando o PREÇO cair. Fundamentos mudam menos que preço.", "emoji": "💡"},
    {"type": "example", "title": "Vender ou Segurar", "body": "VENDA: tese invalidada, fraude, setor disruptado. SEGURE: preço caiu mas fundamentos intactos, resultado pontual ruim, mercado em pânico.", "highlight": "Venda: fundamentos mudaram\nVenda: fraude ou gestão comprometida\nSegure: preço caiu mas empresa sólida\nSegure: resultado pontual", "emoji": "🎯"},
    {"type": "activity", "question": "Fraude contábil grave. Decisão?", "options": ["Segurar", "Aguardartrimestral", "Vender", "Comprar mais"], "correct": 2},
    {"type": "true_false", "statement": "Vender após queda de 20% é sempre correto.", "correct": 0, "explanation": "Falso! Avalie fundamentos."},
    {"type": "fill_in_the_blank", "sentence": "Gatilho de venda = mudança nos ____.", "answer": "fundamentos", "hint": "Lucro, dívida, gestão", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Gatilho correto", "definition": "Mudança estrutural"}, {"term": "Gatilho errado", "definition": "Queda de preço"}, {"term": "Apego", "definition": "Segurar ruim por medo"}, {"term": "Disciplina", "definition": "Racional, não emocional"}]}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.10: Quiz Final do Nível 2
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 10, '15.10 Quiz Final do Nível 2', 50, true, 
{
  "steps": [
    {"type": "activity", "question": "O que é buy and hold?", "options": ["Comprar e vender rapidamente", "Comprar empresas e manter por anos", "Comprar e vender no mesmo dia", "Esperar momento ideal"], "correct": 1},
    {"type": "activity", "question": "Regra dos 72 a 9% ao ano?", "options": ["6 anos", "8 anos", "9 anos", "12 anos"], "correct": 1},
    {"type": "activity", "question": "O que é DCA?", "options": ["Vender na queda", "Concentrar em uma empresa", "Investir valor fixo regularmente", "Diversificar países"], "correct": 2},
    {"type": "activity", "question": "Empresa típica de dividendos?", "options": ["Startups", "Maduras com distribuição", "Em expansão", "Payout zero"], "correct": 2},
    {"type": "activity", "question": "Aristocrata americana?", "options": ["DY 10%+", "25+ anos crescendo", "Market cap US$ 100bi+", "No S&P 500"], "correct": 1},
    {"type": "activity", "question": "Por que reinvestir é poderoso?", "options": ["Menos IR", "Juros compostos", "Aumenta DY", "Obrigatório por lei"], "correct": 1},
    {"type": "activity", "question": "Forma eficiente de rebalancear?", "options": ["Vender tudo", "Suspender aportes", "Direcionar novos aportes", "Contratar robô"], "correct": 2},
    {"type": "activity", "question": "Gatilho de venda correto?", "options": ["Queda de 15%", "Resultado ruim", "Mudança estrutural", "Bear market"], "correct": 2},
    {"type": "activity", "question": "Frase de longo prazo?", "options": ["Compre baixa, venda alta", "Tempo no mercado supera timing", "Diversificação é para quem não sabe", "Dividendos menos importantes"], "correct": 1},
    {"type": "activity", "question": "DCA em bear market?", "options": ["Suspender", "Dobrar aportes", "Continuar normalmente", "Migrar para fixa"], "correct": 2}
  ]
}
) ON CONFLICT DO NOTHING;

-- Lesson 15.11: Conquista
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 15, 'Estratégias de Longo Prazo', 11, '15.11 Conquista: Analista em Formação', 50, true, 
{
  "steps": [
    {"type": "explanation", "title": "Você completou o Nível 2!", "body": "Parabéns! Você agora pensa como um investidor — não apenas como especulador. A diferença é enorme.", "emoji": "🏆"},
    {"type": "example", "title": "O que Você Domina", "body": "Módulos 9-15: Análise fundamentalista, indicadores, relatórios, FIIs, ETFs, BDRs, macro, estratégias de longo prazo.", "highlight": "Análise fundamentalista completa\nIndicadores e valuation\nLeitura de relatórios\nFIIs e mercado imobiliário\nETFs globais\nFatores macroeconômicos\nEstratégias de longo prazo", "emoji": "🎯"},
    {"type": "activity", "question": "Próximo passo adequado?", "options": ["Day trade", "Aplicar fundamentos na seleção real", "Esperar R$ 1 milhão", "Vender ETFs"], "correct": 1},
    {"type": "true_false", "statement": "Nível 2 concluído = abandonar ETFs.", "correct": 0, "explanation": "Falso! Combinação é equilibrada."},
    {"type": "fill_in_the_blank", "sentence": "Nível 3 cobre análise técnica e gestão de ____.", "answer": "risco", "hint": "O que separa consistente de perder", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Nível 2", "definition": "Análise fundamentalista e longo prazo"}, {"term": "Próximo passo", "definition": "Aplicar fundamentos"}, {"term": "Nível 3", "definition": "Análise técnica e risco"}, {"term": "Jornada", "definition": "Sempre tem algo a aprender"}]}
  ]
}
) ON CONFLICT DO NOTHING;
