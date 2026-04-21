-- Módulos 12, 13 e 14 - FIIs, ETFs e Macroeconomia
-- Execute este SQL no SQL Editor do Supabase
-- Estrutura: lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data)

-- =====================
-- MÓDULO 12: FIIs (section_id = 12)
-- =====================

-- Lesson 12.1: O que são FIIs?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 1, '12.1 O que são FIIs?', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Dono de imóvel sem ser dono de imóvel", "body": "FII — Fundo de Investimento Imobiliário — é uma estrutura que permite investir no mercado imobiliário com pouco dinheiro. O fundo capta recursos, compra imóveis ou títulos imobiliários, recebe aluguéis e distribui mensalmente.", "emoji": "💡"},
    {"type": "example", "title": "O Problema do Imóvel Físico — Resolvido", "body": "Comprar imóvel exige R$ 300-500k, documentação, IPTU, reforma, inquilino inadimplente. Com FII: investe R$ 100, recebe aluguéis todo mês, pode vender na bolsa em segundos.", "highlight": "Negociado na bolsa como uma ação\nDistribui rendimentos mensalmente\nGestão profissional\nDiversificação automática\nAcessível — cotas a partir de R$ 10", "emoji": "🎯"},
    {"type": "activity", "question": "Qual é a principal vantagem dos FIIs em relação ao investimento direto em imóveis físicos?", "options": ["FIIs garantem valorização maior", "FIIs eliminam risco de vacância", "FIIs permitem investir com baixo capital e alta liquidez", "FIIs são garantidos pelo governo"], "correct": 2},
    {"type": "true_false", "statement": "Para investir em FIIs, o investidor precisa ter no mínimo R$ 50.000.", "correct": 0, "explanation": "Falso! Cotas custam entre R$ 10 e R$ 150."},
    {"type": "fill_in_the_blank", "sentence": "Os FIIs têm tickers que terminam com o número ____.", "answer": "11", "hint": "Mesmo sufixo de ETFs. 🏷️", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "FII", "definition": "Fundo que investe em imóveis"}, {"term": "Cotista", "definition": "Investidor do fundo"}, {"term": "Gestor", "definition": "Administrador profissional"}, {"term": "Rendimento", "definition": "Distribuição mensal"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.2: Rendimentos Mensais
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 2, '12.2 Como Funcionam os Rendimentos Mensais', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O aluguel caindo na conta todo mês", "body": "Por lei, FIIs são obrigados a distribuir pelo menos 95% do lucro semestral. A grande maioria distribui mensalmente.", "emoji": "💡"},
    {"type": "example", "title": "Calculando Sua Renda Mensal", "body": "200 cotas do MXRF11, rendimento R$ 0,12 por cota = R$ 24/mês. Com R$ 10.000 investidos: R$ 120/mês.", "highlight": "95% do lucro distribuído mensalmente\nRendimento proporcional às cotas\nIsento de IR para PF\nData-com e data-pagamento", "emoji": "🎯"},
    {"type": "activity", "question": "Um FII pagou R$ 0,08 por cota. Você tem 500 cotas. Qual foi a renda?", "options": ["R$ 8,00", "R$ 40,00", "R$ 80,00", "R$ 400,00"], "correct": 1},
    {"type": "true_false", "statement": "Rendimentos de FIIs são tributados a 15% de IR.", "correct": 0, "explanation": "Falso! São isentos para PF qualificada."},
    {"type": "fill_in_the_blank", "sentence": "A data limite para possuir cotas e ter direito ao rendimento é a data-____.", "answer": "com", "hint": "Data de corte. 📅", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "95% do lucro", "definition": "Mínimo legal de distribuição"}, {"term": "Data-com", "definition": "Direito ao rendimento"}, {"term": "Data-pagamento", "definition": "Dia que cai na conta"}, {"term": "Isento de IR", "definition": "Para pessoa física"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.3: Tipos de FII
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 3, '12.3 Tipos de FII (Papel, Tijolo, Híbrido)', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Nem todo FII é imóvel físico", "body": "Três categorias: tijolo (imóveis físicos), papel (títulos como CRI e LCI), híbrido (combina os dois).", "emoji": "💡"},
    {"type": "example", "title": "Tijolo, Papel e Híbrido", "body": "Tijolo (HGLG11): galpões logísticos. Papel (MXRF11): CRIs. Híbrido: mix de ambos.", "highlight": "Tijolo → imóveis físicos\nPapel → títulos imobiliários\nHíbrido → mix dos dois\nCada tipo tem risco diferente", "emoji": "🎯"},
    {"type": "activity", "question": "Um FII que investe em shoppings é classificado como:", "options": ["FII de Papel", "FII de Tijolo", "FII Híbrido", "FII de Desenvolvimento"], "correct": 1},
    {"type": "true_false", "statement": "FII de papel possui imóveis físicos.", "correct": 0, "explanation": "Falso! Investe em títulos, não em imóveis."},
    {"type": "fill_in_the_blank", "sentence": "Título lastreado em créditos do setor imobiliário é o ____ de Recebíveis Imobiliários.", "answer": "Certificado", "hint": "Abreviatura: CRI", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Tijolo", "definition": "Imóveis físicos"}, {"term": "Papel", "definition": "Títulos CRI, LCI"}, {"term": "Híbrido", "definition": "Mix de tijolo e papel"}, {"term": "CRI", "definition": "Certificado de Recebíveis Imobiliários"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.4: O que é o IFIX?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 4, '12.4 O que é o IFIX?', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O termômetro dos FIIs", "body": "IFIX é o Índice de Fundos de Investimentos Imobiliários da B3 — mede o desempenho médio dos principais FIIs.", "emoji": "💡"},
    {"type": "example", "title": "IFIX e a Taxa de Juros", "body": "2021: Selic 2%, IFIX subiu. 2022: Selic 13,75%, IFIX despencou. Relação inversa com os juros.", "highlight": "IFIX = principal índice de FIIs\nRelação inversa com a Selic\nSelic alta → pressão no IFIX\nSelic baixa → IFIX se beneficia", "emoji": "🎯"},
    {"type": "activity", "question": "Por que o IFIX tende a cair quando a Selic sobe?", "options": ["FIIs são obrigados a reduzir dividendos", "Renda fixa fica mais atrativa, reduzindo demanda por FIIs", "Imóveis perdem valor", "B3 reduz horário"], "correct": 1},
    {"type": "true_false", "statement": "O IFIX pode ser comprado diretamente como um investimento.", "correct": 0, "explanation": "Falso! Não existe ETF que replique o IFIX."},
    {"type": "match_pairs", "pairs": [{"term": "IFIX", "definition": "Índice de FIIs"}, {"term": "Selic alta", "definition": "Pressiona o IFIX"}, {"term": "Selic baixa", "definition": "Favorece o IFIX"}, {"term": "Benchmark", "definition": "Referência para carteira"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.5: P/VP em FIIs
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 5, '12.5 P/VP em FIIs', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Quanto você paga pelo patrimônio?", "body": "P/VP compara o preço de mercado com o valor patrimonial por cota. Abaixo de 1 = desconto.", "emoji": "💡"},
    {"type": "example", "title": "O Desconto que Pode Ser Oportunidade", "body": "KNRI11: VP R$ 165, cotando R$ 140. P/VP = 0,85x. Você compra R$ 165 por R$ 140.", "highlight": "P/VP = preço ÷ valor patrimonial\nAbaixo de 1 = desconto\nAcima de 1 = prêmio\nAnalise junto com qualidade", "emoji": "🎯"},
    {"type": "activity", "question": "FII tem VP R$ 120, negociado a R$ 96. P/VP?", "options": ["0,6x", "0,8x", "1,0x", "1,2x"], "correct": 1},
    {"type": "true_false", "statement": "P/VP baixo sempre indica compra superior.", "correct": 0, "explanation": "Falso! P/VP baixo pode indicar problemas."},
    {"type": "fill_in_the_blank", "sentence": "Quando o preço está abaixo do patrimônio, o fundo está em ____.", "answer": "desconto", "hint": "Oposto de prêmio", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "P/VP < 1", "definition": "Desconto"}, {"term": "P/VP > 1", "definition": "Prêmio"}, {"term": "VP", "definition": "Valor patrimonial por cota"}, {"term": "Portfólio", "definition": "Conjunto de ativos do fundo"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.6: DY em FIIs
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 6, '12.6 DY em FIIs', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "A métrica central dos FIIs", "body": "DY mostra quanto o fundo distribuiu em 12 meses em relação ao preço atual. 10% = R$ 10 de renda por R$ 100 investidos.", "emoji": "💡"},
    {"type": "example", "title": "DY Real", "body": "HGLG11 pagou R$ 1,10/mês × 12 = R$ 13,20/ano. Cota R$ 155. DY = 8,5% isento de IR.", "highlight": "DY = rendimentos 12 meses ÷ preço\nIsento de IR — vantagem\nCompare com CDI líquido\nDY muito alto pode ser armadilha", "emoji": "🎯"},
    {"type": "activity", "question": "FII paga R$ 0,85/mês, cota R$ 102. DY anual?", "options": ["5%", "8%", "10%", "12%"], "correct": 2},
    {"type": "true_false", "statement": "DY deve ser comparado com CDI bruto.", "correct": 0, "explanation": "Falso! Compare com CDI líquido."},
    {"type": "fill_in_the_blank", "sentence": "Rendimentos de FIIs são ____ de IR para PF.", "answer": "isentos", "hint": "Vantagem fiscal. 🎁", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "DY anual", "definition": "Rendimentos 12 meses ÷ preço"}, {"term": "Isenção", "definition": "Principal vantagem"}, {"term": "CDI líquido", "definition": "Comparação correta"}, {"term": "DY alto", "definition": "Pode indicar problema"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.7: Vacância
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 7, '12.7 Vacância e Inadimplência', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Os dois fantasmas dos FIIs de tijolo", "body": "Vacância = área desocupada. Inadimplência = inquilinos que não pagam. Ambos afetam diretamente os rendimentos.", "emoji": "💡"},
    {"type": "example", "title": "O Impacto Real da Vacância", "body": "XPML11: 98% de ocupação — vacância 2%. Rendimentos sólidos. Outro FII com 35% de vacância: rendimentos despencaram.", "highlight": "Vacância física: % sem inquilino\nVacância financeira: % sem receita\nIdeal: abaixo de 5%\nAcima de 15%: sinal de alerta", "emoji": "🎯"},
    {"type": "activity", "question": "FII de escritórios tem 30% de vacância. O que significa?", "options": ["Rendimentos aumentam", "30% da receita não está sendo gerada", "Fundo é liquidado", "Não afeta rendimentos"], "correct": 1},
    {"type": "true_false", "statement": "Vacância não afeta os rendimentos mensais.", "correct": 0, "explanation": "Falso! Imóvel vazio não gera aluguel."},
    {"type": "match_pairs", "pairs": [{"term": "Vacância física", "definition": "Área sem inquilino"}, {"term": "Vacância financeira", "definition": "Receita não gerada"}, {"term": "Inadimplência", "definition": "Aluguel em atraso"}, {"term": "Ocupação", "definition": "100% - vacância"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.8: Como Escolher um FII
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 8, '12.8 Como Escolher um FII', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O checklist do investidor de FIIs", "body": "Analise: tipo, gestão, portfólio, vacância, P/VP, histórico. DY alto isolado não é suficiente.", "emoji": "💡"},
    {"type": "example", "title": "Os 6 Critérios", "body": "1. Tipo: tijolo ou papel? 2. Gestora: reputação? 3. Portfólio: qualidade? 4. Vacância: abaixo de 5%? 5. P/VP: justificado? 6. Histórico: consistente?", "highlight": "Gestora reconhecida\nPortfólio diversificado\nContrato longo\nImóveis triple A\nHistórico de 3-5 anos", "emoji": "🎯"},
    {"type": "activity", "question": "Qual critério é mais importante para FII de tijolo?", "options": ["Tamanho da gestora", "Data de fundação", "Vacância e qualidade dos imóveis", "Número de cotistas"], "correct": 2},
    {"type": "true_false", "statement": "DY mais alto é suficiente para escolher um FII.", "correct": 0, "explanation": "Falso! Análise completa é necessária."},
    {"type": "fill_in_the_blank", "sentence": "Imóveis de altíssima qualidade são classificados como triple ____.", "answer": "A", "hint": "Padrão máximo. 🏆", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Gestora", "definition": "Administradora do fundo"}, {"term": "Track record", "definition": "Histórico de desempenho"}, {"term": "Contrato atípico", "definition": "Locação de longo prazo"}, {"term": "Triple A", "definition": "Qualidade máxima"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.9: FIIs x Aluguel Direto
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 9, '12.9 FIIs x Aluguel Direto', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O debate eterno", "body": "FIIs têm liquidez, isenção de IR e gestão profissional. Imóvel físico tem tangibilidade. Escolha depende do perfil.", "emoji": "💡"},
    {"type": "example", "title": "Comparativo", "body": "Imóvel R$ 300k: aluguel R$ 1.200/mês (0,4%). Custos: IPTU, condomínio, manutenção. FIIs R$ 300k: DY 8-10% = R$ 2-2.500/mês. Isento de IR. Liquidez imediata.", "highlight": "FIIs: liquidez, isenção, gestão\nImóvel físico: controle direto\nDecisão baseada em perfil e objetivos", "emoji": "🎯"},
    {"type": "activity", "question": "Principal vantagem dos FIIs sobre imóvel físico?", "options": ["Retorno superior sempre", "Maior liquidez, gestão profissional, isen��ão de IR", "Garantia governamental", "Rendimento fixo"], "correct": 1},
    {"type": "true_false", "statement": "Imóvel de R$ 300k com aluguel R$ 1.200/mês tem yield de 4,8% ao ano.", "correct": 1, "explanation": "Verdadeiro!"},
    {"type": "match_pairs", "pairs": [{"term": "Yield", "definition": "Aluguel anual ÷ valor"}, {"term": "Liquidez FII", "definition": "Venda em segundos"}, {"term": "Liquidez imóvel", "definition": "Pode levar meses"}, {"term": "Isenção", "definition": "Sem IR para PF"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 12.10: Quiz do Módulo 12
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 12, 'FIIs', 10, '12.10 Quiz do Módulo', 50, true, $$
{
  "steps": [
    {"type": "activity", "question": "O que é um FII?", "options": ["Fundo de renda fixa", "Fundo que investe em imóveis e distribui rendimentos", "Ação de construtora", "Certificado bancário"], "correct": 1},
    {"type": "activity", "question": "Obrigação legal de distribuição?", "options": ["50% lucro", "75% lucro", "95% lucro semestral", "100% mensal"], "correct": 2},
    {"type": "activity", "question": "FII que investe em CRIs é:", "options": ["Tijolo", "Desenvolvimento", "Papel", "Híbrido"], "correct": 2},
    {"type": "activity", "question": "Selic subindo afeta o IFIX como?", "options": ["Sobe", "Cai", "Não afetado", "Suspenso"], "correct": 1},
    {"type": "activity", "question": "VP R$ 150, cota R$ 120. P/VP?", "options": ["0,6x", "0,8x", "1,0x", "1,2x"], "correct": 1},
    {"type": "activity", "question": "Rendimentos são:", "options": ["15% IR", "20% IR", "Isentos", "Tabela progressiva"], "correct": 2},
    {"type": "activity", "question": "Vacância é:", "options": ["Cotas sem cotistas", "Área sem inquilino", "Período sem rendimento", "Diferença P/VP"], "correct": 1},
    {"type": "activity", "question": "Comparar DY com:", "options": ["CDI bruto", "Selic bruta", "CDI líquido", "IPCA"], "correct": 2},
    {"type": "activity", "question": "Critério menos relevante?", "options": ["Vacância", "Qualidade imóveis", "Número de filiais exterior", "Histórico"], "correct": 2},
    {"type": "activity", "question": "Vantagem principal?", "options": ["Retorno superior", "Garantia governo", "Liquidez, isenção, gestão", "Rendimento fixo"], "correct": 1}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- =====================
-- MÓDULO 13: ETFs (section_id = 13)
-- =====================

-- Lesson 13.1: O que é um ETF?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 1, '13.1 O que é um ETF?', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "A cesta inteligente", "body": "ETF — Exchange Traded Fund — é um fundo negociado em bolsa que replica automaticamente um índice. Você compra uma cota e está exposto a dezenas ou centenas de ativos.", "emoji": "💡"},
    {"type": "example", "title": "John Bogle Mudou o Mundo", "body": "John Bogle criou o primeiro fundo índice nos anos 70. Compre o mercado inteiro, pague taxa mínima. Hoje mais de US$ 10 trilhões estão em ETFs.", "highlight": "Replica índice automaticamente\nTaxa muito baixa (0,05-0,5%/ano)\nDiversificação instantânea\nNegociado como ação\nRetorno = retorno do índice", "emoji": "🎯"},
    {"type": "activity", "question": "Principal vantagem dos ETFs?", "options": ["Sempre superam o índice", "Taxa baixa e replicação consistente", "Garantidos pelo governo", "Dividendos mensais"], "correct": 1},
    {"type": "true_false", "statement": "ETF de Ibovespa tem objetivo de superar o índice.", "correct": 0, "explanation": "Falso! Replicação passiva entrega o índice."},
    {"type": "fill_in_the_blank", "sentence": "Criador do primeiro fundo índice foi ____.", "answer": "John Bogle", "hint": "Fundador da Vanguard. 📚", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "ETF", "definition": "Fundo que replica índice"}, {"term": "Gestão passiva", "definition": "Replicar sem selecionar"}, {"term": "Taxa", "definition": "Custo anual baixo"}, {"term": "Tracking error", "definition": "Diferença ETF x índice"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 13.2: Vantagens dos ETFs
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 2, '13.2 Vantagens dos ETFs', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Por que ETFs ganham o mundo", "body": "ETFs combinam liquidez de ações, diversificação de fundos e custo baixíssimo. Ferramenta mais eficiente para exposição ao mercado.", "emoji": "💡"},
    {"type": "example", "title": "O Custo que Destrói Riqueza", "body": "Fundo ativo: 2%/ano. ETF: 0,1%/ano. Diferença de 1,9%/ano. Em 30 anos com R$ 100k: diferença pode ser mais de R$ 1 milhão.", "highlight": "Diversificação instantânea\nCusto mínimo (0,1-0,5%)\nLiquidez como ação\nTransparência diária\nSimplicidade", "emoji": "🎯"},
    {"type": "activity", "question": "Impacto de diferença de 1,9%/ano em 30 anos?", "options": ["Insignificante", "Pode representar mais de R$ 1 milhão", "Fundo ativo sempre compensa", "Só acima de R$ 1M"], "correct": 1},
    {"type": "true_false", "statement": "Fundos ativos superam o benchmark consistentemente após 10 anos.", "correct": 0, "explanation": "Falso! Estudo SPIVA mostra que maioria não supera."},
    {"type": "fill_in_the_blank", "sentence": "Estudo que compara fundos ativos com benchmark se chama ____.", "answer": "SPIVA", "hint": "S&P Indices Versus Active Funds. 📊", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Custo", "definition": "O que você perde ao longo do tempo"}, {"term": "SPIVA", "definition": "Relatório comparado"}, {"term": "Transparência", "definition": "Composição diária"}, {"term": "Eficiência", "definition": "Baixo custo"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 13.3: Principais ETFs do Brasil
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 3, '13.3 Principais ETFs do Brasil', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O cardápio de ETFs na B3", "body": "BOVA11: Ibovespa. SMAL11: small caps. IVVB11: S&P 500. HASH11: criptomoedas. Cada um tem seu papel.", "emoji": "💡"},
    {"type": "example", "title": "ETFs Mais Usados", "body": "BOVA11: Ibovespa. SMAL11: small caps brasileiras. IVVB11: S&P 500 americano. XFIX11: renda fixa. Combinando: Brasil + EUA em 2 compras.", "highlight": "BOVA11 → Ibovespa\nSMAL11 → Small caps\nIVVB11 → S&P 500\nHASH11 → Cripto", "emoji": "🎯"},
    {"type": "activity", "question": "ETF para small caps brasileiras?", "options": ["BOVA11", "IVVB11", "SMAL11", "HASH11"], "correct": 2},
    {"type": "true_false", "statement": "É possível ter carteira diversificada com 3 ETFs.", "correct": 1, "explanation": "Verdadeiro!"},
    {"type": "fill_in_the_blank", "sentence": "ETF do S&P 500 na B3 é o ____.", "answer": "IVVB11", "hint": "IVV + B + 11. 🇺🇸", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "BOVA11", "definition": "Ibovespa"}, {"term": "SMAL11", "definition": "Small caps"}, {"term": "IVVB11", "definition": "S&P 500"}, {"term": "HASH11", "definition": "Cripto"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 13.4: ETFs Internacionais
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 4, '13.4 ETFs Internacionais', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O mundo inteiro na sua carteira", "body": "ETFs internacionais dão exposição a mercados fora do Brasil: EUA, Europa, Ásia. Diversificar geograficamente reduz risco.", "emoji": "💡"},
    {"type": "example", "title": "Carteira Permanente", "body": "40% BOVA11 (Brasil) + 40% IVVB11 (EUA) + 20% emergentes. Exposição a centenas de empresas de diferentes países.", "highlight": "Diversificação geográfica\nExposição cambial\nMenor risco político\nBrasil + EUA + outros", "emoji": "🎯"},
    {"type": "activity", "question": "Por que adicionar ETFs internacionais?", "options": ["Sempre mais rentáveis", "Correlação baixa protege contra crises locais", "Isentos de IR", "B3 exige 30%"], "correct": 1},
    {"type": "true_false", "statement": "IVVB11 proteje contra desvalorização do real.", "correct": 1, "explanation": "Verdadeiro!"},
    {"type": "match_pairs", "pairs": [{"term": "Geográfica", "definition": "Investir em mercados diferentes"}, {"term": "Cambial", "definition": "Proteção natural"}, {"term": "Correlação", "definition": "Ativos não caem juntos"}, {"term": "Desenvolvidos", "definition": "EUA, Europa"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 13.5: O que são BDRs?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 5, '13.5 O que são BDRs?', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Apple e Tesla direto do home broker", "body": "BDR — Brazilian Depositary Receipt — é certificado que representa ações estrangeiras. Negociado na B3 em reais.", "emoji": "💡"},
    {"type": "example", "title": "AAPL34 na Prática", "body": "Apple (AAPL) a US$ 190. BDR AAPL34: ~US$ 190 × câmbio ÷ proporção. Em reais: R$ 237,50 (dólar R$ 5,00).", "highlight": "BDR = certificado de ação estrangeira\nSufixo 34 = nível 3\nValor = ação original + câmbio\nNão precisa de conta exterior\nDividendos repassados", "emoji": "🎯"},
    {"type": "activity", "question": "Como o câmbio afeta BDR?", "options": ["Não afeta", "Dólar subindo valoriza em reais", "Apenas ação importa", "Corrigido por IPCA"], "correct": 1},
    {"type": "true_false", "statement": "Para investir em BDRs precisa de conta nos EUA.", "correct": 0, "explanation": "Falso! É a vantagem."},
    {"type": "fill_in_the_blank", "sentence": "Banco que compra ações e emite BDRs é o banco ____.", "answer": "depositário", "hint": "Instituição custódia. 🏦", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "BDR", "definition": "Certificado na B3"}, {"term": "Depositário", "definition": "Emite os BDRs"}, {"term": "34", "definition": "Sufixo nível 3"}, {"term": "AAPL34", "definition": "BDR Apple"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 13.6: BDR ou ETF?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 6, '13.6 BDR ou ETF?', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Dois caminhos", "body": "BDRs individuais: mais controle. ETFs: mais diversificação e menor custo. Cada um tem seu uso.", "emoji": "💡"},
    {"type": "example", "title": "Quando Usar Cada Um", "body": "BDR individual: convicção sobre empresa específica. IVVB11: exposição ampla, custo mínimo. Para maioria, IVVB11 é mais adequado.", "highlight": "BDR → controle e customização\nIVVB11 → diversificação e custo\nCusto: ETF é mais barato\nDiversificação: ETF vence", "emoji": "🎯"},
    {"type": "activity", "question": "Para iniciante com exposição americana ampla?", "options": ["20 BDRs individuais", "Conta nos EUA", "IVVB11", "Apenas AAPL34"], "correct": 2},
    {"type": "true_false", "statement": "BDRs são sempre preferíveis ao IVVB11.", "correct": 0, "explanation": "Falso!"},
    {"type": "fill_in_the_blank", "sentence": "Carteira baseada em ETFs é chamada ____.", "answer": "passiva", "hint": "Oposta a ativa. 🎯", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "BDR", "definition": "Para convicção"}, {"term": "ETF", "definition": "Para exposição ampla"}, {"term": "Passiva", "definition": "Baseada em índices"}, {"term": "Ativa", "definition": "Seleção manual"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 13.7: Risco Cambial
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 7, '13.7 Risco Cambial', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O dólar como espada de dois gumes", "body": "Ao investir em ETFs internacionais, você assume risco cambial. Dólar subindo beneficial; dolar caindo perjudica.", "emoji": "💡"},
    {"type": "example", "title": "O Dólar Que Protegeu", "body": "2020: Ibovespa caiu ~45%. Dólar subiu de R$ 4 para R$ 5,70 (+42,5%). Quem tinha IVVB11 teve perda menor em reais por causa do câmbio.", "highlight": "Dólar subindo → valoriza em reais\nDólar caindo → reduz em reais\nRisco como proteção\nHedge: elimina exposição\nHistórico: real deprecia", "emoji": "🎯"},
    {"type": "activity", "question": "S&P 500 sobe 10%, dólar cai 8%. Ganho em reais?", "options": ["18%", "2%", "10%", "0%"], "correct": 1},
    {"type": "true_false", "statement": "Risco cambial é sempre prejudicial.", "correct": 0, "explanation": "Falso! É bidirecional."},
    {"type": "fill_in_the_blank", "sentence": "Estratégia que elimina risco cambial é ____ cambial.", "answer": "hedge", "hint": "Proteção ou cobertura. 🛡️", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Risco", "definition": "Exposição variação"}, {"term": "Hedge", "definition": "Proteção"}, {"term": "Real depreciando", "definition": "Beneficia ativos dolarizados"}, {"term": "Apreciando", "definition": "Reduz rentabilidade"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 13.8: ETF x Ação
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 8, '13.8 Comparativo ETF x Ação Direta', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Qual é melhor? Depende", "body": "ETFs: superior em custo e diversificação. Ações: permitem concentração. Estratégia híbrida core-satellite combina os dois.", "emoji": "💡"},
    {"type": "example", "title": "Core-Satellite", "body": "70-80% em ETFs (core = base). 20-30% em ações de convicção (satellite = alpha). Melhor dos dois mundos.", "highlight": "ETF → custo e diversificação\nAção → personalização\nCore-satellite → combina\nIniciantes: comece pelo core\nAvançados: adicionem satellites", "emoji": "🎯"},
    {"type": "activity", "question": "Na estratégia core-satellite, o que é o 'core'?", "options": ["Ações de convicção", "Reserva de emergência", "ETFs que formam a base", "Criptomoedas"], "correct": 2},
    {"type": "true_false", "statement": "Core-satellite são mutuamente exclusivos.", "correct": 0, "explanation": "Falso! Combina os dois."},
    {"type": "match_pairs", "pairs": [{"term": "Core", "definition": "ETF= base"}, {"term": "Satellite", "definition": "Ações= convicção"}, {"term": "Híbrido", "definition": "Combina"}, {"term": "Edge", "definition": "Vantagem informacional"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 13.9: Quiz do Módulo 13
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 13, 'ETFs', 9, '13.9 Quiz do Módulo', 50, true, $$
{
  "steps": [
    {"type": "activity", "question": "Objetivo ETF passivo?", "options": ["Superar índice", "Entregar índice com baixo custo", "Proteger queda", "Dividendos mensais"], "correct": 1},
    {"type": "activity", "question": "ETF small caps?", "options": ["BOVA11", "IVVB11", "SMAL11", "HASH11"], "correct": 2},
    {"type": "activity", "question": "O que é um BDR?", "options": ["Bônus governo", "Certificado ação estrangeira", "Fundo imobiliário", "ETF emergentes"], "correct": 1},
    {"type": "activity", "question": "Dólar subindo com IVVB11?", "options": ["Cai em reais", "Tem hedge", "Sobe em reais", "Cota suspensa"], "correct": 2},
    {"type": "activity", "question": "Estudo que mostra fundos ativos perdendo?", "options": ["IFIX", "SPIVA", "CVM", "B3"], "correct": 1},
    {"type": "activity", "question": "Satellite na estratégia?", "options": ["ETF base", "Reserva", "Ações convicção", "FIIs"], "correct": 2},
    {"type": "activity", "question": "Exposição americana ampla?", "options": ["30 BDRs", "Conta EUA", "IVVB11", "Apenas AAPL"], "correct": 2},
    {"type": "activity", "question": "Hedge cambial?", "options": ["Investir em moeda forte", "Elimina efeito câmbio", "Taxa conversão", "Seguro govt"], "correct": 1},
    {"type": "activity", "question": "Vantagem mais impactante?", "options": ["Dividendos mensais", "Taxa baixa", "Garantia acima CDI", "Isenção IR"], "correct": 1},
    {"type": "activity", "question": "Sufixo BDR nível 3?", "options": ["3", "11", "34", "4"], "correct": 2}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- =====================
-- MÓDULO 14: Macroeconomia (section_id = 14)
-- =====================

-- Lesson 14.1: Macro x Micro
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 1, '14.1 Macro x Microeconomia', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O oceano e o barco", "body": "Macroeconomia = oceano (juros, câmbio, PIB). Microeconomia = barco (fundamentos da empresa). Um não existe sem o outro.", "emoji": "💡"},
    {"type": "example", "title": "A WEG Que Não Escapou", "body": "WEG tem fundamentos excelentes. Mesmo assim, em 2022 com ambiente macro adverso, ações caíram. Macro puxa tudo.", "highlight": "Macro → afeta todas\nMicro → específico empresa\nMacro ruim → boas empresas caem\nMicro bom → recuperação mais rápida", "emoji": "🎯"},
    {"type": "activity", "question": "Diferença macro e micro?", "options": ["Macro= trimestrais, micro= anuais", "Macro= toda economia, micro= empresa", "Macro= fundos, micro= PF", "Macro= gráficos, micro= balanços"], "correct": 1},
    {"type": "true_false", "statement": "Empresa com bons fundamentos está protegida de queda macro.", "correct": 0, "explanation": "Falso!"},
    {"type": "fill_in_the_blank", "sentence": "Estudo de variáveis macroeconômicas é a ____ economia.", "answer": "macro", "hint": "Do grego 'grande'. 🌍", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Macro", "definition": "Juros, câmbio, PIB"}, {"term": "Micro", "definition": "Fundamentos da empresa"}, {"term": "Adverso", "definition": "Pode derrubar boas empresas"}, {"term": "Sólidos", "definition": "Garantem recuperação"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.2: Selic e Ações
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 2, '14.2 Taxa Selic e Impacto nas Ações', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O botão que move o mercado", "body": "Selic é o principal instrumento monetário. Afeta custo de capital, atratividade da renda fixa e apetite por risco.", "emoji": "💡"},
    {"type": "example", "title": "O Ciclo de Juros", "body": "BC sobe Selic de 2% para 13,75%: renda fixa fica atrativa, investidores saem de ações, empresas endividadas sofrem. Quando corta, o oposto.", "highlight": "Selic subindo → ações caem\nSelic caindo → ações sobem\nEmpresas endividadas sofrem mais\nEmpresas com caixa se beneficiam", "emoji": "🎯"},
    {"type": "activity", "question": "Por que endividadas sofrem mais com Selic alta?", "options": ["Mais impostos", "Custo finansumento aumenta", "B3 restringe", "OBRIGadas a distribuir"], "correct": 1},
    {"type": "true_false", "statement": "Mercado reage só após decisão oficial do Copom.", "correct": 0, "explanation": "Falso! É forward-looking."},
    {"type": "fill_in_the_blank", "sentence": "Mercado que precifica o futuro é ____-looking.", "answer": "forward", "hint": "Voltado para o futuro. 🔭", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Selic subindo", "definition": "Pressiona ações"}, {"term": "Selic caindo", "definition": "Favorece ações"}, {"term": "Forward", "definition": "Precifica expectativas"}, {"term": "Copom", "definition": "Decide a Selic"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.3: Inflação
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 3, '14.3 Inflação e Mercado', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "A inimiga silenciosa", "body": "Inflação corrói poder de compra e força BC a subir juros. Empresas com pricing power se saem melhor.", "emoji": "💡"},
    {"type": "example", "title": "Pricing Power", "body": "Petrobras: repassa preços — pricing power alto. Varejo popular: dificuldade de repassar — pricing power baixo. Ambev: consegue subir preços.", "highlight": "Inflação alta → BC sobe juros → pressiona ações\nPricing power → capacidade de repassar\nDefensivos em cenários ruins\nVulneráveis: varejo popular", "emoji": "🎯"},
    {"type": "activity", "question": "O que é pricing power?", "options": ["Preço máximo regulado", "Capacidade de repassar custos", "Poder de negociar fornecedores", "Proteção automática"], "correct": 1},
    {"type": "true_false", "statement": "Inflação alta é ruim para todas as empresas.", "correct": 0, "explanation": "Falso!"},
    {"type": "fill_in_the_blank", "sentence": "Índice oficial de inflação é o ____.", "answer": "IPCA", "hint": "Índice de Preços ao Consumidor Amplo. 📊", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "IPCA", "definition": "Índice oficial"}, {"term": "Pricing", "definition": "Capacidade repassar"}, {"term": "Meta", "definition": "Alvo do BC"}, {"term": "Estagflação", "definition": "Inflação + crescimento baixo"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.4: Câmbio
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 4, '14.4 Câmbio e Empresas Exportadoras', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Dólar alto — quem ganha e quem perde?", "body": "Exportadoras se beneficiam (recebem mais reais). Importadoras sofrem (custos sobem).", "emoji": "💡"},
    {"type": "example", "title": "A Gangorra do Câmbio", "body": "Dólar de R$ 4 para R$ 6: Vale e Petrobras: receita em reais explode. Aviação: custos disparam. Varejo importador: sofre.", "highlight": "Exportadora → beneficia\nImportadora → sofre\nDívida em dólar → risco\nCaixa em dólar → benefício", "emoji": "🎯"},
    {"type": "activity", "question": "Exportadora de soja se beneficia quando dólar sobe?", "options": ["Prejudicada — produto caro", "Beneficiada —recebe mais reais", "Neutra", "Prejudicada — custos sobem"], "correct": 1},
    {"type": "true_false", "statement": "Companhia aérea se beneficia com dólar alto.", "correct": 0, "explanation": "Falso!"},
    {"type": "fill_in_the_blank", "sentence": "Empresas que vendem para exterior são ____.", "answer": "exportadoras", "hint": "Vendem em moeda forte. 🌍", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Exportadora", "definition": "Beneficia com dólar alto"}, {"term": "Importadora", "definition": "Sofre com dólar alto"}, {"term": "Dívida", "definition": "Risco cambial"}, {"term": "Hedging", "definition": "Proteção"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.5: PIB
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 5, '14.5 PIB e Crescimento Econômico', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "A maré que levanta todos os barcos", "body": "PIB crescendo = economia aquecida = lucros sobem = bolsa sobe. PIB caindo = recessão.", "emoji": "💡"},
    {"type": "example", "title": "PIB Crescendo — Bolsa Sente", "body": "PIB +3%: consumo aumenta, empresas investem, crédito cresce, Ibovespa sobe. Recessão: ciclo inverso.", "highlight": "PIB crescendo → bolsa sobe\nPIB caindo → recessão\nExpectativas movem mercados\nSetores sensíveis: varejo, construção\nSetores defensivos: energia, saneamento", "emoji": "🎯"},
    {"type": "activity", "question": "Setor menos sensível à recessão?", "options": ["Varejo luxo", "Construção civil", "Energia elétrica", "Bancos"], "correct": 2},
    {"type": "true_false", "statement": "Setores defensivos têm demanda estável.", "correct": 1, "explanation": "Verdadeiro!"},
    {"type": "fill_in_the_blank", "sentence": "Expectativas de mercado são publicadas no Relatório ____.", "answer": "Focus", "hint": "Termômetro semanal. 📊", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "PIB", "definition": "Produção total"}, {"term": "Recessão", "definition": "PIB negativo 2 trim"}, {"term": "Defensivo", "definition": "Demanda estável"}, {"term": "Cíclico", "definition": "Sensível ao ciclo"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.6: Política
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 6, '14.6 Cenário Político e Mercado', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "Política move mercado", "body": "Mercado é apolítico mas sensível ao ambiente: previsibilidade, responsabilidade fiscal e respeito à iniciativa privada.", "emoji": "💡"},
    {"type": "example", "title": "Dia que Política Derrubou Bilhões", "body": "Petrobras mudou dividendos por pressão política: ação -15% (-R$ 60bi). Reforma tributária bem aceita: bolsa +3%.", "highlight": "Fiscalidade → mercado gosta\nIntervenção → penaliza\nReformas → positivo\nGastos sem lastro → pressão", "emoji": "🎯"},
    {"type": "activity", "question": "Por que mercado reage a irresponsabilidade fiscal?", "options": ["Reduce dividendos", "Gera inflação, alta juros, câmbio", "CVM suspende", "É partidário"], "correct": 1},
    {"type": "true_false", "statement": "Mercado tem preferência política definida.", "correct": 0, "explanation": "Falso!"},
    {"type": "match_pairs", "pairs": [{"term": "Risco", "definition": "Incerteza política"}, {"term": "Fiscal", "definition": "Equilíbrio contas"}, {"term": "Reforma", "definition": "Mudança estrutural"}, {"term": "Intervenção", "definition": "Mudança forçada"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.7: Resultados Trimestrais
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 7, '14.7 Resultados Trimestrais', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O evento mais importante", "body": "4 vezes por ano empresas divulgam resultados. Mercado reage a beat ou miss. Contexto vale mais que trimestre isolado.", "emoji": "💡"},
    {"type": "example", "title": "Temporada de Resultados", "body": "Beat → ação sobe. Miss → ação cai. Resultado pontual ruim em empresa sólida = oportunidade. Queda estrutural = reavaliar.", "highlight": "Temporadas: fev, mai, ago, nov\nBeat → sobe\nMiss → cai\nResultado pontual ≠ tendência", "emoji": "🎯"},
    {"type": "activity", "question": "Empresa sólida cai 15% por resultado pontual. Leitura adequada?", "options": ["Vender — deterioração", "Pode ser oportunidade", "Aguardar 5 anos", "Migrar para fixa"], "correct": 1},
    {"type": "true_false", "statement": "Resultado não recorrente invalida tese.", "correct": 0, "explanation": "Falso!"},
    {"type": "fill_in_the_blank", "sentence": "Meses de divulgação do 1T são ____ e março.", "answer": "fevereiro", "hint": "Resultado jan-mar. 📅", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "1T", "definition": "Resultado jan-mar"}, {"term": "Não recorrente", "definition": "Fator temporário"}, {"term": "Tese", "definition": "Razões para manter"}, {"term": "Revisão", "definition": "Reavaliar fundamentos"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.8: Notícias
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 8, '14.8 Notícias e Rumores', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "A informação que move bilhões", "body": "Mercado reage em segundos. Não reaja a rumores. Verifique fontes. Fato relevante é a mais confiável.", "emoji": "💡"},
    {"type": "example", "title": "O Rumor que Custou Caro", "body": "Circula que empresa será comprada. Ação +20%. Empresa nega. Ação -25%. Você perdeu por reagir a rumor.", "highlight": "Fato relevante → oficial\nRumor → não aja\nInsider trading → crime\nAlgoritmos reagem a notícias", "emoji": "🎯"},
    {"type": "activity", "question": "Fonte mais confiável?", "options": ["Influenciadores", "Grupos WhatsApp", "Fato relevante CVM", "Comentaristas TV"], "correct": 2},
    {"type": "true_false", "statement": "Insider trading é legal se indireto.", "correct": 0, "explanation": "Falso! É crime."},
    {"type": "fill_in_the_blank", "sentence": "Comunicado oficial sobre fato relevante é ____ relevante.", "answer": "fato", "hint": "Documento oficial. 📢", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Fato", "definition": "Comunicado oficial"}, {"term": "Insider", "definition": "Informação privilegiada"}, {"term": "Rumor", "definition": "Não verificado"}, {"term": "Algoritmo", "definition": "Bots reagem"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.9: Fluxo Estrangeiro
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 9, '14.9 Fluxo Estrangeiro na Bolsa', 25, false, $$
{
  "steps": [
    {"type": "explanation", "title": "O dinheiro que move o Ibovespa", "body": "Estrangeiros = fatia enorme do volume. Entram: Ibovespa sobe, real fortalece. Saem: o oposto.", "emoji": "💡"},
    {"type": "example", "title": "Por que Entram e Saem", "body": "Entram: real barato, commodities sobem, ambiente estável. Saem: aversão a risco global, commodities caem, instabilidade.", "highlight": "Fluxo positivo → Ibovespa sobe\nNegativo → Ibovespa cai\nAversão a risco → saem\nCommodities → beneficiam Brasil", "emoji": "🎯"},
    {"type": "activity", "question": "Por que crise nos EUA pode derrubar Ibovespa?", "options": ["Brasil importa ações", "Aversão a risco sai de emergentes", "CVM sincroniza", "Real indexado"], "correct": 1},
    {"type": "true_false", "statement": "Fluxo estrangeiro tem pouca relevância.", "correct": 0, "explanation": "Falso!40-50% do volume."},
    {"type": "fill_in_the_blank", "sentence": "Capital migrando para emergentes é ____ para emergentes.", "answer": "fluxo", "hint": "Movimento de dinheiro. 💰", "explanation": "Correto!"},
    {"type": "match_pairs", "pairs": [{"term": "Aversão", "definition": "Fuga de risco"}, {"term": "Risk on", "definition": "Apetite por risco"}, {"term": "Risk off", "definition": "Fuga do risco"}, {"term": "Carry", "definition": "Pegar dinheiro barato"}]}
  ]
}
$$) ON CONFLICT DO NOTHING;

-- Lesson 14.10: Quiz do Módulo 14
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 14, 'Macroeconomia', 10, '14.10 Quiz do Módulo', 50, true, $$
{
  "steps": [
    {"type": "activity", "question": "Diferença macro e micro?", "options": ["Macro= gráficos, micro= balanços", "Macro= toda economia, micro= empresa", "Macro= fundos, micro= PF", "Macro= curto, micro= longo"], "correct": 1},
    {"type": "activity", "question": "Selic subindo?", "options": ["Ações sobem", "Ações caem", "Não afetam", "Apenas bancos"], "correct": 1},
    {"type": "activity", "question": "Pricing power?", "options": ["Preço máximo", "Capacidade repassar custos", "Poder fornecedores", "Proteção automática"], "correct": 1},
    {"type": "activity", "question": "Exportadora se beneficia quando?", "options": ["Real fortalece", "Selic sobe", "Dólar sobe", "Inflação cai"], "correct": 2},
    {"type": "activity", "question": "Setor defensivo?", "options": ["Varejo luxo", "Shopping", "Energia elétrica", "Aviação"], "correct": 2},
    {"type": "activity", "question": "Relatório Focus?", "options": ["Trimestral estatais", "Expectativas mercado", "Fluxo estrangeiro", "Volume negociado"], "correct": 1},
    {"type": "activity", "question": "Fonte confiável?", "options": ["Influenciadores", "WhatsApp", "Fato relevante", "Portais notícias"], "correct": 2},
    {"type": "activity", "question": "Crise nos EUA derruba Ibovespa?", "options": ["Importa ações", "Aversão a risco", "CVM suspende", "Real indexado"], "correct": 1},
    {"type": "activity", "question": "Insider trading?", "options": ["Técnica legal", "Crime informação privilegiada", "Day trade", "High frequency"], "correct": 1},
    {"type": "activity", "question": "Estrangeiros compram, efeito?", "options": ["Ibovespa cai, real cai", "Ibovespa sobe, real fortalece", "Apenas câmbio", "Circuit breaker"], "correct": 1}
  ]
}
$$) ON CONFLICT DO NOTHING;