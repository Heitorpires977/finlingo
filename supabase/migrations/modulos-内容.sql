-- Módulo 1 e 2 - Lições do FinLingo
-- Execute no SQL Editor do Supabase

-- Limpa lições existentes (opcional)
-- DELETE FROM public.lessons;

-- ============================================
-- MÓDULO 1: Historia do Mercado Financeiro
-- ============================================

-- Seção 1: Historia do Mercado Financeiro
INSERT INTO public.lessons (section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(1, 'Módulo 1', 1, '1.1 A História do Mercado Financeiro', 10, false, '[
  {"type": "explanation", "title": "Tudo começou num café ☕", "body": "Em 1602, a Companhia das Índias Orientais precisava de grana pra financiar suas viagens. A solução foi genial: vender pedaços da empresa pra várias pessoas. Quem comprasse virava sócio e dividia o lucro. Isso foi a primeira ação da história.", "emoji": "💡"},
  {"type": "example", "title": "A Lanchonete dos Amigos", "body": "Imagina que tu e mais 9 amigos juntam dinheiro pra abrir uma lanchonete. Cada um vira sócios com 10% do negócio. Se lucrar, todo mundo ganha. Se der prejuízo, todo mundo sofre junto.", "highlight": "1602 → Primeira ação da história (Holanda)\n1792 → Bolsa de NY fundada\n2008 → Bovespa + BM&F viram BM&FBovespa\n2017 → Fusão com Cetip cria a B3", "emoji": "🎯"},
  {"type": "activity", "question": "Em qual país surgiu a primeira bolsa de valores do mundo?", "options": ["Inglaterra", "Estados Unidos", "Holanda", "Brasil"], "correct": 2},
  {"type": "true_false", "statement": "A bolsa de valores foi criada no século XX com o surgimento da internet.", "correct": false, "explanation": "Falso! A bolsa existe desde 1602, muito antes da internet."},
  {"type": "match_pairs", "pairs": [
    {"term": "Ação", "definition": "Pedaço de uma empresa à venda"},
    {"term": "Sócio", "definition": "Quem possui parte de um negócio"},
    {"term": "Companhia das Índias", "definition": "Primeira empresa a vender ações"},
    {"term": "1602", "definition": "Ano do nascimento do mercado de capitais"}
  ]}
]'),

(1, 'Módulo 1', 2, '1.2 Para que Serve a Bolsa?', 10, false, '[
  {"type": "explanation", "title": "A bolsa é uma ponte 🌉", "body": "A bolsa conecta dois lados que precisam um do outro. De um lado, empresas que precisam de dinheiro pra crescer. Do outro, investidores que têm dinheiro e querem fazê-lo render.", "emoji": "💡"},
  {"type": "example", "title": "O iFood do Dinheiro", "body": "Pensa no iFood: restaurante quer vender, cliente quer comer — o app conecta os dois. A bolsa faz o mesmo, só que com dinheiro e participação em empresas.", "highlight": "Empresa capta dinheiro sem pagar juros\nInvestidor entra como sócio e pode lucrar\nTodos ganham quando o negócio vai bem", "emoji": "🎯"},
  {"type": "activity", "question": "Qual é a função principal da bolsa de valores?", "options": ["Guardar dinheiro com segurança", "Emprestar dinheiro com juros", "Conectar empresas que precisam de capital com investidores", "Controlar a inflação do país"], "correct": 2},
  {"type": "true_false", "statement": "Quando uma empresa vende ações na bolsa, ela está pedindo dinheiro emprestado e terá que devolver com juros.", "correct": false, "explanation": "Falso! A empresa não devolve o dinheiro. Ela vende uma parte de si mesma."},
  {"type": "match_pairs", "pairs": [
    {"term": "Empresa", "definition": "Precisa de capital pra crescer"},
    {"term": "Investidor", "definition": "Tem capital e quer rendimento"},
    {"term": "Bolsa", "definition": "Ambiente que conecta os dois lados"},
    {"term": "Ação", "definition": "O ingresso de entrada na sociedade"}
  ]}
]'),

(1, 'Módulo 1', 3, '1.3 Quem Participa da Bolsa?', 10, false, '[
  {"type": "explanation", "title": "O cast completo do mercado 👥", "body": "A bolsa não é só pra rico. Tem vários personagens: empresas, investidores, corretoras, B3 e CVM.", "emoji": "💡"},
  {"type": "example", "title": "O Show ao Vivo do Mercado", "body": "Pensa num show: tem o artista (empresa), o público (investidor), o ingresso (ação), a casa de shows (bolsa) e a bilheteria (corretora).", "highlight": "Empresas → vendem ações\nInvestidores → compram ações\nCorretoras → intermediam\nB3 → ambiente oficial\nCVM → regulador", "emoji": "🎯"},
  {"type": "activity", "question": "Qual órgão regula e fiscaliza o mercado de capitais no Brasil?", "options": ["Banco Central", "Receita Federal", "Tesouro Nacional", "CVM"], "correct": 3},
  {"type": "true_false", "statement": "Para comprar ações, o investidor precisa contatar diretamente a empresa.", "correct": false, "explanation": "Falso! O investidor opera por meio de uma corretora."},
  {"type": "match_pairs", "pairs": [
    {"term": "CVM", "definition": "Órgão regulador do mercado"},
    {"term": "Corretora", "definition": "Intermediária entre investidor e bolsa"},
    {"term": "B3", "definition": "Ambiente oficial de negociação"},
    {"term": "Investidor", "definition": "Comprador de participação em empresas"}
  ]}
]'),

(1, 'Módulo 1', 4, '1.4 O que Acontece quando Você Compra uma Ação?', 10, false, '[
  {"type": "explanation", "title": "Você virouócio — de verdade 🤯", "body": "Comprar uma ação é comprar um pedaço real de uma empresa. Se a empresa lucra → você lucra. Se vai mal → seu patrimônio cai junto.", "emoji": "💡"},
  {"type": "example", "title": "A Pizza Que Pode se Multiplicar 🍕", "body": "Você compra 10 ações a R$ 12,00. Total: R$ 120. Daqui a 1 ano, a ação vai pra R$ 15,00. Seu patrimônio vira R$ 150 — lucro de 25%.", "highlight": "Você vira sócio no momento da compra\nLucro pode vir de valorização\nLucro pode vir de dividendos\nO risco de queda também é seu", "emoji": "🎯"},
  {"type": "activity", "question": "O que representa possuir uma ação de uma empresa?", "options": ["Um empréstimo feito à empresa", "Uma fração da propriedade da empresa", "Uma promessa de lucro garantido", "Um contrato de prestação de serviços"], "correct": 1},
  {"type": "true_false", "statement": "Ao comprar ações, o investidor tem garantia de lucro.", "correct": false, "explanation": "Falso! Não há garantia de lucro nem obrigatoriedade de dividendos."},
  {"type": "match_pairs", "pairs": [
    {"term": "Dividendo", "definition": "Parte do lucro distribuída aoacionista"},
    {"term": "Valorização", "definition": "Aumento no preço da ação"},
    {"term": "Risco", "definition": "Possibilidade de perda"},
    {"term": "Acionista", "definition": "Proprietário de ações"}
  ]}
]'),

(1, 'Módulo 1', 5, '1.5 A Bolsa no Brasil — B3', 10, false, '[
  {"type": "explanation", "title": "A nossa casa — B3 🇧🇷", "body": "A B3 (Brasil, Bolsa, Balcão) é a única bolsa de valores oficial do Brasil. Fica em São Paulo.", "emoji": "💡"},
  {"type": "example", "title": "O Shopping que se Listou 🤯", "body": "Em 2017, a BM&FBovespa se uniu à Cetip e passaram a se chamar B3. A B3 é uma empresa privada listada na própria bolsa.", "highlight": "Única bolsa oficial do Brasil\nSede em São Paulo\nListada com ticker B3SA3\nSupervisionada pela CVM", "emoji": "🎯"},
  {"type": "activity", "question": "Qual fusão deu origem à B3?", "options": ["Bradesco + Itaú", "CVM + Banco Central", "BM&FBovespa + Cetip", "Tesouro Nacional + Bovespa"], "correct": 2},
  {"type": "true_false", "statement": "A B3 é uma empresa estatal, controlada pelo governo.", "correct": false, "explanation": "Falso! A B3 é uma empresa privada, listada com ticker B3SA3."},
  {"type": "match_pairs", "pairs": [
    {"term": "B3", "definition": "Única bolsa oficial do Brasil"},
    {"term": "Bovespa", "definition": "Antecessora da B3"},
    {"term": "CVM", "definition": "Órgão regulador"},
    {"term": "B3SA3", "definition": "Ticker da própria B3"}
  ]}
]'),

(1, 'Módulo 1', 6, '1.6 Bolsas no Mundo (NYSE, NASDAQ...)', 10, false, '[
  {"type": "explanation", "title": "O mercado não tem fronteira 🌍", "body": "O mundo tem várias bolsas enormes. As duas maiores ficam nos EUA e movimentam mais da metade de todo o dinheiro negociado.", "emoji": "💡"},
  {"type": "example", "title": "Do Mercadão pro Walmart Global 🛒", "body": "A NYSE é o Walmart global — outro nível de tamanho. Você pode comprar Apple, Amazon e Google pelo Brasil via BDRs.", "highlight": "NYSE → maior bolsa do mundo\nNASDAQ → foco em tecnologia\nLondon Stock Exchange → principal da Europa\nTokyo Stock Exchange → maior da Ásia\nB3 → nossa representante", "emoji": "🎯"},
  {"type": "activity", "question": "Qual bolsa americana é mais conhecida por concentrar empresas de tecnologia?", "options": ["NYSE", "B3", "NASDAQ", "London Stock Exchange"], "correct": 2},
  {"type": "true_false", "statement": "Investidores brasileiros não conseguem ter acesso a ações de empresas estrangeiras.", "correct": false, "explanation": "Falso! É possível via BDRs ou corretoras internacionais."},
  {"type": "match_pairs", "pairs": [
    {"term": "NYSE", "definition": "Maior bolsa do mundo"},
    {"term": "NASDAQ", "definition": "Bolsa americana focada em tecnologia"},
    {"term": "B3", "definition": "Bolsa oficial do Brasil"},
    {"term": "BDR", "definition": "Forma de investir em empresas estrangeiras"}
  ]}
]'),

(1, 'Módulo 1', 7, '1.7 Como a Bolsa Funciona no Dia a Dia', 10, false, '[
  {"type": "explanation", "title": "Por baixo dos panos ⚙️", "body": "Quando você manda uma ordem de compra, ela vai pro sistema eletrônico que busca alguém querendo vender. Quando batem, a negociação acontece em milissegundos.", "emoji": "💡"},
  {"type": "example", "title": "O Matchmaking do Mercado 🎮", "body": "Você digita: comprar 5 ações de PETR4 a R$ 38,00. O sistema encontra quem quer vender por R$ 38,00. Executado. Você virou acionista.", "highlight": "Ordens se encontram eletronicamente\nO preço é definido pela oferta e demanda\nLiquidação em D+2\nCorretora e B3 garantem segurança", "emoji": "🎯"},
  {"type": "activity", "question": "O que define o preço de uma ação?", "options": ["O governo estipula", "A empresa decide", "O Banco Central regula", "A oferta e demanda"], "correct": 3},
  {"type": "true_false", "statement": "A transferência do dinheiro e da ação acontece instantaneamente.", "correct": false, "explanation": "Falso! A liquidação ocorre em D+2."},
  {"type": "match_pairs", "pairs": [
    {"term": "Ordem de compra", "definition": "Instrução para adquirir um ativo"},
    {"term": "Liquidação", "definition": "Transferência efetiva do dinheiro e ativo"},
    {"term": "D+2", "definition": "Prazo padrão para liquidação"},
    {"term": "Oferta e demanda", "definition": "Mecanismo que define o preço"}
  ]}
]'),

(1, 'Módulo 1', 8, '1.8 O que é o Pregão?', 10, false, '[
  {"type": "explanation", "title": "Abre o jogo 🔔", "body": "Pregão é o período oficial em que a bolsa está aberta pra negociações. Antigamente era um salão cheio de operadores. Hoje é tudo eletrônico.", "emoji": "💡"},
  {"type": "example", "title": "O Restaurante com Horário Fixo 🍽️", "body": "Durante o pregão (10h às 17h), os preços oscilam em tempo real. Fechou, congelam até amanhã.", "highlight": "Pregão = período oficial\nPreços oscilam em tempo real\nFora do pregão, ordens ficam em espera", "emoji": "🎯"},
  {"type": "activity", "question": "O que acontece com ordens fora do horário do pregão?", "options": ["São canceladas", "São executadas imediatamente", "Vão pra outra bolsa", "Ficam agendadas para próxima abertura"], "correct": 3},
  {"type": "true_false", "statement": "Ainda existem operadores gritando ordens no salão da bolsa.", "correct": false, "explanation": "Falso! O pregão hoje é 100% eletrônico."},
  {"type": "match_pairs", "pairs": [
    {"term": "Pregão", "definition": "Período oficial de negociações"},
    {"term": "Leilão de abertura", "definition": "Inicia o pregão com equilíbrio de ordens"},
    {"term": "Leilão de fechamento", "definition": "Define o preço de fechamento"},
    {"term": "Ordem agendada", "definition": "Enviada fora do horário"}
  ]}
]'),

(1, 'Módulo 1', 9, '1.9 Horários de Funcionamento', 10, false, '[
  {"type": "explanation", "title": "A bolsa tem horário — respeite ⏰", "body": "Não é 24/7. Tem mais janelas do que parece. A B3 tem fases distintas durante o dia.", "emoji": "💡"},
  {"type": "example", "title": "O Cardápio do Dia 🍳", "body": "Pré-abertura (09h45): ordens entram, sem execução. Pregão regular (10h00–17h00): negociações abertas. After market (17h30–18h00): com restrições.", "highlight": "Pré-abertura → 09h45 a 10h00\nPregão regular → 10h00 a 17h00\nAfter market → 17h30 a 18h00", "emoji": "🎯"},
  {"type": "activity", "question": "Qual o horário de início do pregão regular da B3?", "options": ["09h00", "09h45", "10h30", "10h00"], "correct": 3},
  {"type": "true_false", "statement": "O after market tem as mesmas regras do pregão regular.", "correct": false, "explanation": "Falso! After market tem restrições de variação de preço."},
  {"type": "match_pairs", "pairs": [
    {"term": "Pré-abertura", "definition": "Fase de entrada de ordens sem execução"},
    {"term": "Pregão regular", "definition": "Janela principal — 10h às 17h"},
    {"term": "After market", "definition": "Sessão estendida com regras restritas"},
    {"term": "Feriado nacional", "definition": "Causa suspensão total do pregão"}
  ]}
]'),

(1, 'Módulo 1', 10, '1.10 Quiz do Módulo 1', 15, true, '[
  {"type": "activity", "question": "Em que ano surgiu a primeira ação da história?", "options": ["1792", "1850", "1602", "1920"], "correct": 2},
  {"type": "activity", "question": "Qual a principais funções da bolsa de valores?", "options": ["Guardar dinheiro", "Conectar empresas e investidores", "Controlar a inflação", "Emitir moeda"], "correct": 1},
  {"type": "activity", "question": "Quem fiscaliza o mercado de capitais no Brasil?", "options": ["Banco Central", "CVM", "B3", "Receita Federal"], "correct": 1},
  {"type": "activity", "question": "O que representa possuir uma ação?", "options": ["Fração de propriedade", "Empréstimo à empresa", "Garantia de dividendos", "Contrato de serviço"], "correct": 0},
  {"type": "activity", "question": "Qual fusão originou a B3?", "options": ["Bovespa + CVM", "BM&FBovespa + Cetip", "Bradesco + Bovespa", "Cetip + CVM"], "correct": 1},
  {"type": "activity", "question": "Qual bolsa americana concentra tecnologia?", "options": ["NYSE", "NASDAQ", "B3", "London"], "correct": 1},
  {"type": "activity", "question": "O que define o preço de uma aç��o?", "options": ["O governo", "A própria empresa", "Oferta e demanda", "O Banco Central"], "correct": 2},
  {"type": "activity", "question": "Quanto tempo leva a liquidação após a compra?", "options": ["D+1", "D+2", "D+3", "Instantâneo"], "correct": 1},
  {"type": "activity", "question": "Horário de início do pregão regular?", "options": ["09h00", "09h45", "10h00", "10h30"], "correct": 2},
  {"type": "activity", "question": "A B3 é uma empresa:", "options": ["Estatal federal", "Controlada pelo BC", "Privada, listada", "Internacional"], "correct": 2}
]');

-- ============================================
-- MÓDULO 2: Ações
-- ============================================

-- Seção 2: Ações
INSERT INTO public.lessons (section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(2, 'Módulo 2', 1, '2.1 Definição de Ação', 10, false, '[
  {"type": "explanation", "title": "O menor pedaço de uma empresa 🧩", "body": "Uma ação é a menor fração do capital de uma empresa. Quando uma empresa se divide em milhões de pedacinhos e vender esses pedaços, cada pedacinho é uma ação.", "emoji": "💡"},
  {"type": "example", "title": "A Empresa Fatiada 🍰", "body": "Imagina que a empresa vale R$ 1 bilhão e foi dividida em 1 bilhão de ações. Cada ação vale R$ 1,00. Você compra 100 ações? Você possui R$ 100 da empresa.", "highlight": "Ação = menor fração do capital\nCada ação representa uma fatia real\nO valor total = valor de mercado\nQualquer pessoa pode comprar", "emoji": "🎯"},
  {"type": "activity", "question": "O que é uma ação no mercado financeiro?", "options": ["Um empréstimo", "Um título de renda fixa", "A menor fração do capital", "Um contrato"], "correct": 2},
  {"type": "true_false", "statement": "Ao comprar ações, o investidor se torna credor da empresa.", "correct": false, "explanation": "Falso! O investidor vira sócio, não credor."},
  {"type": "match_pairs", "pairs": [
    {"term": "Ação", "definition": "Menor fração do capital"},
    {"term": "Acionista", "definition": "Proprietário de ações"},
    {"term": "Capital social", "definition": "Valor total dividido entre ações"},
    {"term": "Fração", "definition": "Parte proporcional da empresa"}
  ]}
]'),

(2, 'Módulo 2', 2, '2.2 Por que Empresas Abrem Capital?', 10, false, '[
  {"type": "explanation", "title": "Crescer custa caro 💸", "body": "Toda empresa chega num ponto em que quer crescer mais rápido. Aí tem duas opções: pegar empréstimo no banco e pagar juros, ou abrir capital na bolsa e captar sem dever.", "emoji": "💡"},
  {"type": "example", "title": "O Sonho Grande da Nubank 🟣", "body": "A Nubank queria dominar a América Latina. Precisava de bilhões. A solução foi abrir capital na NYSE e captar dólares pra crescer — sem dever a banco.", "highlight": "Capta sem pagar juros\nAumenta visibilidade\nPermite crescimento rápido\nDá liquidez aos fundadores", "emoji": "🎯"},
  {"type": "activity", "question": "Vantagem de captar via bolsa?", "options": ["Dinheiro cai mais rápido", "Governo subsidia", "Não paga juros — vende participação", "Bancos obrigados a emprestar"], "correct": 2},
  {"type": "true_false", "statement": "Empresa precisa devolver o dinheiro captado após prazo.", "correct": false, "explanation": "Falso! Não há devolução. É participação permanente."},
  {"type": "match_pairs", "pairs": [
    {"term": "Abertura de capital", "definition": "Vender ações ao público"},
    {"term": "Captação", "definition": "Obter recursos via emissão de ações"},
    {"term": "Stock options", "definition": "Opção de compra de ações a funcionários"},
    {"term": "Liquidez", "definition": "Facilidade de converter em dinheiro"}
  ]}
]'),

(2, 'Módulo 2', 3, '2.3 O que é IPO?', 10, false, '[
  {"type": "explanation", "title": "A estreia da empresa na bolsa 🎬", "body": "IPO vem de Initial Public Offering. É o momento em que uma empresa abre seu capital pela primeira vez. É tipo o lançamento de um álbum.", "emoji": "💡"},
  {"type": "example", "title": "O Lançamento do Ano 🚀", "body": "Antes do IPO, a empresa pertence a poucos. No IPO, oferece parte das ações ao público. Depois, as ações são negociadas livremente na bolsa.", "highlight": "IPO = primeira venda de ações\nPrecio inicial definido por bancos\nApós IPO, preço flutua no mercado", "emoji": "🎯"},
  {"type": "activity", "question": "O que significa IPO?", "options": ["Índice de Preço", "Initial Public Offering", "Investimento", "Imposto"], "correct": 1},
  {"type": "true_false", "statement": "No IPO, só investidores institucionais podem comprar.", "correct": false, "explanation": "Falso! Qualquer pessoa física pode participar."},
  {"type": "match_pairs", "pairs": [
    {"term": "IPO", "definition": "Primeira oferta de ações"},
    {"term": "Banco coordenador", "definition": "Instituição que organiza o IPO"},
    {"term": "Prospecto", "definition": "Documento cominfo da oferta"},
    {"term": "Bookbuilding", "definition": "Coleta de intenções antes do IPO"}
  ]}
]'),

(2, 'Módulo 2', 4, '2.4 Ação ON x PN', 10, false, '[
  {"type": "explanation", "title": "Nem toda ação é igual 🃏", "body": "Existem dois tipos: Ordinária (ON) e Preferencial (PN). ON dá voto, PN dá preferência no dividendo. Ticker termina em 3 = ON, em 4 = PN.", "emoji": "💡"},
  {"type": "example", "title": "Sócio Votante vs Sócio Rentista 🗳️", "body": "Você tem ação ON — pode votar nas decisões. Seu amigo tem ação PN — não vota, mas recebe dividendos primeiro. Nenhuma é melhor — depende do objetivo.", "highlight": "ON (3) → direito a voto\nPN (4) → prioridade em dividendos\nUNIT (11) → pacote ON + PN\nInvestidores preferem PN", "emoji": "🎯"},
  {"type": "activity", "question": "Qual ação dá direito a voto?", "options": ["Preferencial (PN)", "Unit", "Ordinária (ON)", "De Tesouraria"], "correct": 2},
  {"type": "true_false", "statement": "Ticker em 4 é ação ordinária com voto.", "correct": false, "explanation": "Falso! Terminado em 4 é preferencial (PN)."},
  {"type": "match_pairs", "pairs": [
    {"term": "ON", "definition": "Ação ordinária com voto"},
    {"term": "PN", "definition": "Ação preferencial"},
    {"term": "Terminação 3", "definition": "Indica ação ordinária"},
    {"term": "Terminação 11", "definition": "Indica ação Unit"}
  ]}
]'),

(2, 'Módulo 2', 5, '2.5 O que é um Ticker?', 10, false, '[
  {"type": "explanation", "title": "O apelido da ação na bolsa 🏷️", "body": "Ticker é o código de identificação. É como o @ de uma rede social — único e curto. No Brasil, tickers têm 4 letras + 1 número.", "emoji": "💡"},
  {"type": "example", "title": "Decodificando o Ticker 🔍", "body": "PETR4: PETR identifica a Petrobras, 4 diz que é preferencial. VALE3: VALE é a empresa, 3 indica ordinária. BOVA11: BOVA identifica o ETF.", "highlight": "4 letras → identificam a empresa\n3 → ação ordinária\n4 → ação preferencial\n11 → ETF", "emoji": "🎯"},
  {"type": "activity", "question": "O que o número no ticker indica?", "options": ["Número de ações", "Preço inicial", "Tipo de ação", "Setor da empresa"], "correct": 2},
  {"type": "true_false", "statement": "ROXO34 indica ações da Nubank negociadas na B3.", "correct": false, "explanation": "Falso! 34 indica BDR — certificado de ação estrangeira."},
  {"type": "match_pairs", "pairs": [
    {"term": "PETR4", "definition": "Preferencial da Petrobras"},
    {"term": "BOVA11", "definition": "ETF do Ibovespa"},
    {"term": "ROXO34", "definition": "BDR da Nubank"},
    {"term": "WEGE3", "definition": "Ordinária da WEG"}
  ]}
]'),

(2, 'Módulo 2', 6, '2.6 O que Significa ser Sócio?', 10, false, '[
  {"type": "explanation", "title": "Você está no mesmo barco 🚢", "body": "Ser sócio via ações significa participar dos resultados — pra cima e pra baixo. Quando a empresa cresce, sua ação vale mais. Quando vai mal, seu patrimônio encolhe.", "emoji": "💡"},
  {"type": "example", "title": "Ser Sócio da Coca-Cola por R$ 50 🥤", "body": "Warren Buffett comprou ações da Coca-Cola em 1988 e recebe dividendos bilionários todo ano — sendo sócio. Você pode fazer o mesmo em escala menor.", "highlight": "Direito a dividendos\nDireito a voto (se ON)\nParticipação na valorização\nRisco proporcional", "emoji": "🎯"},
  {"type": "activity", "question": "Quais os benefícios de ser acionista?", "options": ["Salário mensal e bônus", "Dividendos e valorização", "Desconto nos produtos", "Garantia de emprego"], "correct": 1},
  {"type": "true_false", "statement": "Para ser acionista, é obrigatório trabalhar na empresa.", "correct": false, "explanation": "Falso! Qualquer pessoa que compra ações se torna acionista."},
  {"type": "match_pairs", "pairs": [
    {"term": "Dividendo", "definition": "Distribuição de lucro aoacionista"},
    {"term": "Valorização", "definition": "Aumento do preço da ação"},
    {"term": "Assembleia", "definition": "Reunião de acionistas com voto"},
    {"term": "Desvalorização", "definition": "Queda no preço da ação"}
  ]}
]'),

(2, 'Módulo 2', 7, '2.7 Como o Preço é Formado?', 10, false, '[
  {"type": "explanation", "title": "É tudo sobre oferta e demanda 📊", "body": "O preço não é definido pela empresa nem pelo governo. É o mercado que decide a cada segundo. Muita gente quer comprar, preço sobe. Muita gente quer vender, preço cai.", "emoji": "💡"},
  {"type": "example", "title": "O Leilão Acontece 24h 🔨", "body": "Pensa num leilão de sneakers raros. Se 100 querem e só tem 10, o preço explode. Se 2 querem e tem 50, o dono aceita qualquer oferta. A bolsa funciona assim.", "highlight": "Muita demanda + pouca oferta = sobe 📈\nPouca demanda + muita oferta = cai 📉\nO preço reflete a percepção do valor", "emoji": "🎯"},
  {"type": "activity", "question": "O que acontece com muito mais compradores?", "options": ["Preço cai", "Preço estável", "Preço sobe", "Bolsa suspende"], "correct": 2},
  {"type": "true_false", "statement": "O preço é fixado pela empresa e atualizado mensalmente.", "correct": false, "explanation": "Falso! É determinado livremente pelo mercado."},
  {"type": "match_pairs", "pairs": [
    {"term": "Oferta", "definition": "Ações disponíveis para venda"},
    {"term": "Demanda", "definition": "Compradores interessados"},
    {"term": "Preço de mercado", "definition": "Resultado de oferta e demanda"},
    {"term": "Volatilidade", "definition": "Intensidade das variações"}
  ]}
]'),

(2, 'Módulo 2', 8, '2.8 O que Faz o Preço Subir ou Cair?', 10, false, '[
  {"type": "explanation", "title": "O mercado reage a tudo 📡", "body": "O preço reage a qualquer coisa. Resultado acima do esperado? Sobe. Presidente renuncia? Cai. Juros sobem no mundo? Cai. Empresa ganha contrato? Sube.", "emoji": "💡"},
  {"type": "example", "title": "A Notícia que Vale Bilhões 📰", "body": "Em 2021, quando o governo sinalizou intervenção nos preços da Petrobras, a ação despencou 20% em um dia — billions evaporados.", "highlight": "Sobe: lucro cresce, novo contrato\nCai: prejuízo, escândalo, juros sobem\nMacro importa: economia global afeta todas", "emoji": "🎯"},
  {"type": "activity", "question": "Evento que causa QUEDA?", "options": ["Lucro acima do esperado", "Novo contrato bilionário", "Divulgação de fraude", "Queda de juros"], "correct": 2},
  {"type": "true_false", "statement": "A taxa de juros não influencia o preço das ações.", "correct": false, "explanation": "Falso! Juros altos afetam todo o mercado."},
  {"type": "match_pairs", "pairs": [
    {"term": "Resultado trimestral", "definition": "Desempenho financeiro da empresa"},
    {"term": "Selic", "definition": "Taxa básica que influencia o mercado"},
    {"term": "Guidance", "definition": "Projeção da empresa sobre futuros"},
    {"term": "Circuit breaker", "definition": "Interrupção em queda extrema"}
  ]}
]'),

(2, 'Módulo 2', 9, '2.9 Exemplos Reais', 10, false, '[
  {"type": "explanation", "title": "A bolsa não sobe em linha reta 📈📉", "body": "Toda ação oscila — isso é normal. Empresas boas têm ações que sobem no longo prazo, mesmo com quedas pelo caminho.", "emoji": "💡"},
  {"type": "example", "title": "Casos Reais do Mercado 🇧🇷", "body": "WEG: quem comprou em 2010 viu a ação multiplicar mais de 20 vezes. Americanas: em 2023 veio à tona fraude bilionária. Ação caiu 90% em dias.", "highlight": "WEG = crescimento consistente\nAmericanas = fraude = queda extrema\nPetrobras = interferência = volatilidade\nNubank = crescimento = valorização", "emoji": "🎯"},
  {"type": "activity", "question": "Caso Americanas é exemplo de qual risco?", "options": ["Risco de mercado", "Risco cambial", "Risco da empresa (fraude)", "Risco de liquidez"], "correct": 2},
  {"type": "true_false", "statement": "Empresa com lucros crescentes tende a valorizar no longo prazo.", "correct": true, "explanation": "Verdadeiro! Preço tende a acompanhar fundamentos."},
  {"type": "match_pairs", "pairs": [
    {"term": "WEGE3", "definition": "Valorização de longo prazo"},
    {"term": "AMER3", "definition": "Queda por fraude"},
    {"term": "Holdar", "definition": "Manter a ação por longo prazo"},
    {"term": "Diversificação", "definition": "Distribuir capital em vários ativos"}
  ]}
]'),

(2, 'Módulo 2', 10, '2.10 Quiz do Módulo 2', 15, true, '[
  {"type": "activity", "question": "O que é uma ação?", "options": ["Um empréstimo", "A menor fração do capital", "Um título de renda fixa", "Um contrato"], "correct": 1},
  {"type": "activity", "question": "Por que empresas abrem capital?", "options": ["Pagar menos impostos", "Capta sem pagar juros", "Reduzir funcionários", "Aumentar preços"], "correct": 1},
  {"type": "activity", "question": "O que significa IPO?", "options": ["Índice de Preço", "Initial Public Offering", "Investimento", "Imposto"], "correct": 1},
  {"type": "activity", "question": "Qual ação confere direito a voto?", "options": ["Preferencial", "Unit", "Ordinária", "BDR"], "correct": 2},
  {"type": "activity", "question": "Sufixo 11 no ticker indica?", "options": ["Ação de empresa estatal", "BDR", "ETF ou Fundo", "Ação preferencial"], "correct": 2},
  {"type": "activity", "question": "Principal benefício de ser acionista?", "options": ["Salário mensal", "Dividendos e valorização", "Desconto", "Garantia de emprego"], "correct": 1},
  {"type": "activity", "question": "O que determina o preço?", "options": ["Empresa define", "Governo regula", "Oferta e demanda", "BC estipula"], "correct": 2},
  {"type": "activity", "question": "Evento que causa ALTA?", "options": ["Fraude contábil", "Resultado acima do esperado", "Aumento de juros", "Renúncia do CEO"], "correct": 1},
  {"type": "activity", "question": "WEG na última década é exemplo de:", "options": ["Queda por má gestão", "Volatilidade", "Valorização consistente", "Fraude descoberta"], "correct": 2},
  {"type": "activity", "question": "O que é o ticker de uma ação?", "options": ["Relatório trimestral", "Código de identificação", "Valor do dividendo", "Percentual de lucro"], "correct": 1}
]');

-- ============================================
-- FIM DAS LIÇÕES
-- ============================================

SELECT 'Lições inseridas com sucesso!' as mensagem;