-- Module 3: Tipos de Investimentos (section_id=3)
-- Lesson 3.1: Ações
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 1, '3.1 Ações', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que são Ações?",
      "body": "Ações são partes de uma empresa que você compra na bolsa de valores. Quando você compra uma ação, você se torna sócio da empresa e tem direito a uma parte dos lucros (dividendos) e vote em assembleias. O preço das ações sobe e cai todos os dias conforme a empresa vai bem ou mal.",
      "emoji": "📈"
    },
    {
      "type": "example",
      "title": "Exemplo: Ambev (ABEV3)",
      "body": "A Ambev é uma das maiores empresas do Brasil. Se você comprasse 100 ações da ABEV3 a R$ 15 cada, investiria R$ 1.500. Se a ação subisse para R$ 18, você teria R$ 1.800. Mas se a empresa tiver problemas, o preço pode cair para R$ 12 e você teria perda.",
      "highlight": "O preço das ações varia todo dia!",
      "emoji": "🍺"
    },
    {
      "type": "activity",
      "question": "Qual característica define as ações como investimento de renda variável?",
      "options": ["Retorno fixo garantido todo mês", "Retorno que muda conforme o mercado", "Não tem risco nenhum", "Pague apenas uma vez"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Quando você compra ações, você se torna sócio da empresa.",
      "correct": true,
      "explanation": "Comprar ação faz você se tornar acionista/sócio da empresa."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O investidor de ações é chamado de ___ da empresa.",
      "answer": "sócio",
      "hint": "Pessoa que participa dos lucros e riscos",
      "explanation": "Acionista = sócio da empresa"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Ação", "right": "Parte de empresa"},
        {"left": "Bolsa", "right": "Mercado de negociação"},
        {"left": "Dividendo", "right": "Lucro distribuído"},
        {"left": "Cotação", "right": "Preço da ação"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 3.2: FIIs
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 2, '3.2 FIIs', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que são FIIs?",
      "body": "FII (Fundo de Investimento Imobiliário) é um fundo que aplica dinheiro de vários investidores em imóveis comerciais (shoppings, escritórios, logística). Você compra cotas do fundo e recebe aluguel mensal, isento de IR para pessoa física.",
      "emoji": "🏢"
    },
    {
      "type": "example",
      "title": "Exemplo: Shopping Center",
      "body": "Um shopping investe R$ 100 milhões em lojas e recebe R$ 10 milhões por ano de aluguel. O fundo distribui R$ 0,83 por mês por cota. Se você tem 100 cotas, recebe R$ 83 todo mês. O valor das cotas também pode subir.",
      "highlight": "Receba aluguel sem precisar comprar um imóvel!",
      "emoji": "🛒"
    },
    {
      "type": "activity",
      "question": "Qual é a principal vantagem dos FIIs para o investidor pessoa física?",
      "options": ["Não paga imposto de renda", "Tem garantia do governo", "Nunca cai de valor", "Retorna 100% ao ano"],
      "correct": 0
    },
    {
      "type": "true_false",
      "statement": "FIIs investem em imóveis comerciais como shoppings e escritórios.",
      "correct": true,
      "explanation": "FIIs investem em imóveis comerciais, não residenciais."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Os FIIs precisam distribuir pelo menos ___% do lucro todo mês.",
      "answer": "95",
      "hint": "Número entre 90 e 100",
      "explanation": "A regra exige distribuição mínima de 95% do lucro semestral"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "FII", "right": "Fundo imobiliário"},
        {"left": "Cota", "right": "Parte do fundo"},
        {"left": "Yield", "right": "Retorno mensal"},
        {"left": "PVP", "right": "Preço por valor patrimonial"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 3.3: ETFs
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 3, '3.3 ETFs', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que são ETFs?",
      "body": "ETF (Exchange Traded Fund) é um fundo de índice que replica um índice da bolsa. Se você compra um ETF do Ibovespa, você investe em todas as empresas do índice ao mesmo tempo. É como comprar um pedaço inteiro da economia brasileira com uma só ordem.",
      "emoji": "🗂️"
    },
    {
      "type": "example",
      "title": "Exemplo: BOVA11",
      "body": "BOVA11 é o ETF mais popular do Brasil. Ele replica o Ibovespa, com as principais 80+ empresas. Se você compra 1 ação do BOVA11 por R$ 100, está investindo em Petrobras, Vale, Ambev, Itaú e dezenas de outras empresas. É diversificação instantânea!",
      "highlight": "Um único ativo = todas as maiores empresas!",
      "emoji": "🇧🇷"
    },
    {
      "type": "activity",
      "question": "Qual é a principal característica da estratégia passiva de um ETF de índice?",
      "options": ["Tentar superar o mercado", "Replicar o índice automaticamente", "Escolher apenas as melhores ações", "Trocar de ativo todo dia"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "ETFs replicam índices da bolsa, não precisam de gestor ativo.",
      "correct": true,
      "explanation": "ETFs usam replicação física ou sintética do índice."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O ETF mais famoso dos EUA replica o índice ___.",
      "answer": "S&P 500",
      "hint": "Índice das 500 maiores empresas americanas",
      "explanation": "S&P 500 é o principal índice americano"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "BOVA11", "right": "ETF do Ibovespa"},
        {"left": "SMAL11", "right": "ETF small caps"},
        {"left": "IVVB11", "right": "ETF do S&P 500"},
        {"left": "Índice", "right": "Carteira teórica"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 3.4: BDRs
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 4, '3.4 BDRs', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que são BDRs?",
      "body": "BDR (Brazilian Depositary Receipt) é um recibo que representa ações de empresas estrangeiras negociadas no Brasil. Você pode comprar Apple, Google, Microsoft aqui, na B3, sem precisar abrir conta no exterior. É como ter a ação estrangeira na sua corretora brasileira.",
      "emoji": "🌎"
    },
    {
      "type": "example",
      "title": "Exemplo: Apple (AAPL34)",
      "body": "AAPL34 é o BDR da Apple no Brasil. Cada BDR representa 1 ação da Apple nos EUA. Se a Apple sobe 2% em NY, o BDR sobe 2% aqui. Você tem acesso ao mercado americano sem complexidade cambial.",
      "highlight": "Empresa americana, corretora brasileira!",
      "emoji": "🍎"
    },
    {
      "type": "activity",
      "question": "O que o BDR representa no mercado brasileiro?",
      "options": ["Uma ação brasileira", "Uma debênture", "Uma ação estrangeira", "Um fundo brasileiro"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "BDRs permitem investir em empresas estrangeiras diretamente na B3.",
      "correct": true,
      "explanation": "BDRs são recibos de ações estrangeiras na bolsa brasileira."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O código AAPL34 tem o número ___ no final.",
      "answer": "34",
      "hint": "Número de 2 dígitos",
      "explanation": "O número diferencia os BDRs"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "BDR", "right": "Recibo de ação estrangeira"},
        {"left": "AAPL34", "right": "BDR da Apple"},
        {"left": "MSFT34", "right": "BDR da Microsoft"},
        {"left": "Depositary", "right": "Depósito bancário"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 3.5: Opções
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 5, '3.5 Opções', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que são Opções?",
      "body": "Opções são contratos que dão o direito (não a obrigação) de comprar ou vender uma ação por um preço específico até uma data futura. Existem opções de compra (call) e venda (put). É um instrumento avançado usado para proteção ou especulação.",
      "emoji": "🎯"
    },
    {
      "type": "example",
      "title": "Exemplo: Ticket de Loteria",
      "body": "Imagine um ticket que dá direito de comprar ação X por R$ 10 até dezembro. Se a ação subir para R$ 15, você compra por R$ 10 e lucra R$ 5. Se cair para R$ 5, você não precisa comprar. O ticket custa alguns centavos.",
      "highlight": "Direito, não obrigação!",
      "emoji": "🎟️"
    },
    {
      "type": "activity",
      "question": "Qual tipo de opção dá o direito de comprar uma ação?",
      "options": ["Put", "Call", "Strike", "Prêmio"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Nas opções, quem compra tem obrigação de exercer.",
      "correct": false,
      "explanation": "Tem o direito, não obrigação."
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Call", "right": "Opção de compra"},
        {"left": "Put", "right": "Opção de venda"},
        {"left": "Strike", "right": "Preço de exercício"},
        {"left": "Prêmio", "right": "Valor da opção"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 3.6: Criptomoedas
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 6, '3.6 Criptomoedas', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que são Criptomoedas?",
      "body": "Criptomoedas são moedas digitais descentralizadas que usam criptografia para segurança. Não são controladas por bancos ou governos. Bitcoin foi a primeira, criada em 2009. Ethereum veio depois com contratos inteligentes. São ativos de alta volatilidade.",
      "emoji": "₿"
    },
    {
      "type": "example",
      "title": "História do Bitcoin",
      "body": "Em 2009, Bitcoin valia centavos. Em 2017, chegou a R$ 70 mil. Em 2021, R$ 300 mil. Em 2022, caiu muito. É o ativo mais volátil do mercado. Poucos compreenderam seu potencial no início.",
      "highlight": "Ativo mais inovador e volátil!",
      "emoji": "📊"
    },
    {
      "type": "activity",
      "question": "Qual é a principal característica das criptomoedas em termos de volatilidade?",
      "options": ["Preço estável", "Oscilações muito altas", "Sempre sobem", "Não oscila nada"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Criptomoedas são descentralizadas e não dependem de bancos.",
      "correct": true,
      "explanation": "São peer-to-peer, sem intermediários tradicionais."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O Bitcoin foi criado no ano de ___.",
      "answer": "2009",
      "hint": "Número de 4 dígitos (fim dos anos 2000)",
      "explanation": "Criado em 2009"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Bitcoin", "right": "Moeda digital original"},
        {"left": "Ethereum", "right": "Contratos inteligentes"},
        {"left": "Descentralizado", "right": "Sem banco central"},
        {"left": "Carteira", "right": "Wallet crypto"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 3.7: Comparando
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 7, '3.7 Comparando', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Comparando os Tipos",
      "body": "Cada investimento serve a um propósito diferente: ações para crescimento longo, FIIs para renda mensal, ETFs para diversificação fácil, opções para proteção/especulação, criptomoedas para diversificação de risco. Não existe um melhor, existem combinações.",
      "emoji": "⚖️"
    },
    {
      "type": "example",
      "title": "Carteira Diversificada",
      "body": "Uma carteira equilibrada: 50% em ETFs (BOVA11) para mercado brasileiro, 20% em FIIs para renda, 15% em BDRs para global, 10% em Tesouro Selic para segurança, 5% em cryptos para risco. Cada ativo tem seu papel.",
      "highlight": "Mistura = estabilidade + crescimento!",
      "emoji": "🎨"
    },
    {
      "type": "activity",
      "question": "Qual tipo de investimento é melhor para quem busca renda mensal passiva?",
      "options": ["Ações de crescimento", "FIIs", "ETFs de índice", "Opções"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Uma carteira diversificada reduz riscos comparados a aplicar em um único ativo.",
      "correct": true,
      "explanation": "Diversificação reduz risco específico."
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Ações", "right": "Crescimento"},
        {"left": "FIIs", "right": "Renda mensal"},
        {"left": "ETFs", "right": "Diversificação"},
        {"left": "Tesouro", "right": "Segurança"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 3.8: Qual Combina
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 8, '3.8 Qual Combina', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Qual Investimento Combina Com Você?",
      "body": "Seu perfil define a combinação ideal: conservador prefere renda fixa, moderado quer equilíbrio, agressivo busca crescimento. Sua idade também importa: mais jovem = mais risco, mais velho = mais segurança. Não existe resposta certa, existe combinação pessoal.",
      "emoji": "🧩"
    },
    {
      "type": "example",
      "title": "Três Perfis",
      "body": "Conservador: 80% Tesouro + 20% FIIs. Moderado: 50% variáveis + 30% FIIs + 20% renda fixa. Agressivo: 70% variáveis + 20% cryptos + 10% renda fixa. Idade 25 pode assumir mais risco que 60.",
      "highlight": "Perfil + idade = combinação!",
      "emoji": "👤"
    },
    {
      "type": "activity",
      "question": "Qual investimento é mais indicado para um jovem de 25 anos com perfil moderado?",
      "options": ["Apenas Tesouro Selic", "ETFs + FIIs", "Apenas criptomoedas", "Apenas FIIs"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Quanto mais jovem o investidor, mais risco ele pode assumir.",
      "correct": true,
      "explanation": "Mais tempo para recuperar perdas."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O conjunto de investimentos de uma pessoa se chama ___.",
      "answer": "carteira",
      "hint": "Palavra em 7 letras",
      "explanation": "Carteira de investimentos"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Conservador", "right": "Prioriza segurança"},
        {"left": "Moderado", "right": "Equilíbrio"},
        {"left": "Agressivo", "right": "Prioriza crescimento"},
        {"left": "Perfil", "right": "Tipo de investidor"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 3.9: Quiz
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 3, 'Tipos de Investimentos', 9, '3.9 Quiz', 50, true, $$
{
  "questions": [
    {
      "question": "O que você adquire ao comprar uma ação?",
      "options": ["Empréstimo para a empresa", "Parte da empresa (sócio)", "Direito de receber aluguel", "Garantia do governo"],
      "correct": 1
    },
    {
      "question": "Qual é a distribuição mínima obrigatória dos FIIs?",
      "options": ["95% do lucro semestral", "100% do lucro mensal", "50% do lucro anual", "Nenhuma"],
      "correct": 0
    },
    {
      "question": "O que é um ETF?",
      "options": ["Fundo ativo gerenciado", "Fundo que replica índices", "Fundo multimercado", "Fundo de ações"],
      "correct": 1
    },
    {
      "question": "BDR representa ações de empresas...",
      "options": ["Brasileiras", "Estrangeiras", "Joint venture", "Governo"],
      "correct": 1
    },
    {
      "question": "Opção Call dá o direito de:",
      "options": ["Vender", "Comprar", "Alugar", "Doar"],
      "correct": 1
    },
    {
      "question": "Qual foi o ano de criação do Bitcoin?",
      "options": ["2008", "2009", "2010", "2011"],
      "correct": 1
    },
    {
      "question": "Qual investimento é melhor para renda mensal?",
      "options": ["Ações de crescimento", "FIIs", "Opções", "ETFs"],
      "correct": 1
    },
    {
      "question": "Um investidor de 25 anos pode ter perfil mais:",
      "options": ["Conservador", "Moderado", "Agressivo", "Nenhum"],
      "correct": 2
    },
    {
      "question": "O que é diversificação?",
      "options": ["Colocar tudo em um ativo", "Distribuir entre vários ativos", "Apenas renda fixa", "Não investir"],
      "correct": 1
    },
    {
      "question": "BOVA11 é um:",
      "options": ["FII", "ETF", "Ação", "Opção"],
      "correct": 1
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Module 4: Risco e Retorno (section_id=4)
-- Lesson 4.1: O que é Risco?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 1, '4.1 O que é Risco?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Entendendo Risco",
      "body": "Risco é a possibilidade de perder dinheiro ou não ganhar o esperado. Em investimentos, risco não é ruim - é o preço do retorno. Quanto mais retorno você quer, mais risco precisa aceitar. É uma troca (trade-off). Risco alto = retorno potencial alto.",
      "emoji": "⚠️"
    },
    {
      "type": "example",
      "title": "Exemplo: Guarda-Chuva",
      "body": "Se previsão diz 70% de chuva, você leva guarda-chuva. Se chover 30%, você molha. Se chover muito, molha muito. O risco de molhar existe sempre, mas você se prepara. Em investimentos, você se prepara aceitando risco.",
      "highlight": "Risco existe, mas com preparo você reduz impactos!",
      "emoji": "☔"
    },
    {
      "type": "activity",
      "question": "O que é risco em investimentos?",
      "options": ["Certeza de perda", "Possibilidade de não ganhar esperado", "Não tomar risco", "Garantia de lucro"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Em investimentos, risco e retorno são diretamente proporcionais.",
      "correct": true,
      "explanation": "Maior risco = maior potencial de retorno."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Quanto maior o risco, maior o ___ potencial.",
      "answer": "retorno",
      "hint": "O oposto de risco",
      "explanation": "Risk-return tradeoff"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Risco", "right": "Possibilidade de perda"},
        {"left": "Retorno", "right": "Ganho do investimento"},
        {"left": "Trade-off", "right": "Troca entre risco e retorno"},
        {"left": "Volatilidade", "right": "Variação de preço"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.2: Tipos de Risco
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 2, '4.2 Tipos de Risco', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Tipos de Risco",
      "body": "Existem vários tipos: risco de mercado (preço cai), risco de liquidez (não consegue vender), risco de crédito (devedor não paga), risco sistêmico (economia cai), risco cambial (moeda muda). Conhecer os tipos ajuda a criar proteção.",
      "emoji": "📋"
    },
    {
      "type": "example",
      "title": "Três Riscos em Ação",
      "body": "Risco de mercado: ação cai 20%. Risco de liquidez: ninguém quer comprar sua ação. Risco sistêmico: crise geral, todas ações caem. Cada um precisa de estratégia diferente.",
      "highlight": "Conhecer o tipo ajuda a proteger!",
      "emoji": "🎯"
    },
    {
      "type": "activity",
      "question": "Qual risco acontece quando você quer vender e ninguém compra?",
      "options": ["Risco de mercado", "Risco de liquidez", "Risco de crédito", "Risco cambial"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Risco sistêmico afeta todo o mercado, não apenas uma empresa.",
      "correct": true,
      "explanation": "Crise econômica afeta todos."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Risco que afeta todo o sistema financeiro se chama risco ___.",
      "answer": "sistêmico",
      "hint": "Palavra com 8 letras",
      "explanation": "Sistêmico = do sistema todo"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Mercado", "right": "Preço cai"},
        {"left": "Liquidez", "right": "Não vende"},
        {"left": "Crédito", "right": "Não paga"},
        {"left": "Sistêmico", "right": "Crise geral"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.3: O que é Retorno?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 3, '4.3 O que é Retorno?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Entendendo Retorno",
      "body": "Retorno é o ganho do investimento. Existem dois tipos: nominal (sem ajustar) e real (descontando inflação). Se você ganha 10% mas inflação é 7%, seu retorno real é apenas 3%. O que importa é o retorno real.",
      "emoji": "💰"
    },
    {
      "type": "example",
      "title": "Cálculo de Retorno",
      "body": "Você investe R$ 10.000. Um ano depois tem R$ 13.000. Ganhou R$ 3.000 = 30% nominal. Mas inflação foi 27%. Seu retorno real é apenas 3%. Parece muito, mas no fundo foi pouco.",
      "highlight": "Sempre veja o retorno real!",
      "emoji": "🧮"
    },
    {
      "type": "activity",
      "question": "Se você ganha 10% e inflação está em 7%, qual é o retorno real?",
      "options": ["17%", "10%", "3%", "7%"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "O retorno real é o retorno nominal menos a inflação.",
      "correct": true,
      "explanation": "Fórmula: retorno real = retorno nominal - inflação"
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O retorno que considera a inflação é chamado retorno ___.",
      "answer": "real",
      "hint": "Oposto de nominal",
      "explanation": "Retorno real = descontando inflação"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Nominal", "right": "Sem ajuste"},
        {"left": "Real", "right": "Descontando inflação"},
        {"left": "Inflação", "right": "Aumento de preços"},
        {"left": "Ganho", "right": "Lucro"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.4: Risco x Retorno
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 4, '4.4 Risco x Retorno', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "A Relação Risco x Retorno",
      "body": "Existe uma pirâmide de investimentos: base segura com poco retorno (renda fixa), meio com risco moderado (FIIs, ações blue chip), topo com alto risco e alto retorno (small caps, cryptos). Não existe alto retorno sem risco.",
      "emoji": "🔺"
    },
    {
      "type": "example",
      "title": "Pirâmide",
      "body": "Tesouro Selic: seguro, rende menos. Ações: risco moderado, rende mais. Small caps: risco alto, rende mais ainda. Não tem como ter retorno de ações com risco de Tesouro.",
      "highlight": "Alto retorno exige alto risco!",
      "emoji": "📊"
    },
    {
      "type": "activity",
      "question": "Por que retorno alto exige risco alto?",
      "options": ["Para compensar o risco assumido", "Não é verdade", "Porque sim", "Não sei"],
      "correct": 0
    },
    {
      "type": "true_false",
      "statement": "É possível ter retorno de ações com risco de Tesouro Selic.",
      "correct": false,
      "explanation": "Trade-off: retorno maior = risco maior"
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Quando alguém promete retorno alto sem risco, desconfie pode ser ___.",
      "answer": "golpe",
      "hint": "Crime financeiro também chamado",
      "explanation": "Sem risco = sem retorno alto legítimo"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Base pirâmide", "right": "Renda fixa"},
        {"left": "Meio", "right": "Ações blue chip"},
        {"left": "Topo", "right": "High risk/high return"},
        {"left": "Trade-off", "right": "Troca necessária"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.5: Tempo Reduz Risco
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 5, '4.5 Tempo Reduz Risco', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Tempo Reduz Risco",
      "body": "Em investimentos de risco, o tempo é seu amigo. No curto prazo, o mercado sobe e desce muito. No longo prazo, as oscilações se suavizam e o retorno tende a ser positivo. É por isso que idade importa: mais tempo = mais capacidade de risco.",
      "emoji": "⏰"
    },
    {
      "type": "example",
      "title": "Exemplo: Ibovespa",
      "body": "Em 1 ano, Ibovespa pode variar -20% a +30%. Em 5 anos, varia menos. Em 10+ anos, quase sempre sobe. Quem ficou 20 anos desde 2000, viu alta expressiva apesar de crises.",
      "highlight": "Tempo no mercado ajuda mais que timing!",
      "emoji": "📈"
    },
    {
      "type": "activity",
      "question": "Por que o longo prazo reduz o risco de ações?",
      "options": ["Mercado só sobe", "Oscilações se suavizam", "Governo garante", "Não reduz"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Tempo no mercado é mais importante que timing de mercado.",
      "correct": true,
      "explanation": "Estudos mostram que tempo supera timing."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "A estratégia de comprar regularmente se chama ___ de investimento.",
      "answer": "DCA",
      "hint": "Sigla em inglês (Dollar Cost Averaging)",
      "explanation": "DCA = investimento programado"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Curto prazo", "right": "Alta volatilidade"},
        {"left": "Longo prazo", "right": "Menor volatilidade"},
        {"left": "Buy and hold", "right": "Comprar e segurar"},
        {"left": "Timing", "right": "Tentar acertar momento"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.6: Volatilidade
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 6, '4.6 Volatilidade', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que é Volatilidade?",
      "body": "Volatilidade mede quanto o preço sobe e desce. Alta volatilidade = oscilações grandes (cryptos podem variar 20% em um dia). Baixa volatilidade = variações pequenas (Tesouro não varia quase nada). É uma medida de risco.",
      "emoji": "🎢"
    },
    {
      "type": "example",
      "title": "Bitcoin vs Selic",
      "body": "Bitcoin pode variar 30% em uma semana. Tesouro Selic varia 0.1% ao mês. Um investidor conservador não aguenta a oscilação do Bitcoin. Alta volatilidade pode causar pânico e vendas no pior momento.",
      "highlight": "Escolha volatilidade que você aguenta!",
      "emoji": "😰"
    },
    {
      "type": "activity",
      "question": "Por que volatilidade alta pode ser perigosa para investidores iniciantes?",
      "options": ["Não é perigosa", "Pode causar pânico e vendas erradas", "Sempre sobe", "Governo intervém"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Volatilidade alta significa risco alto.",
      "correct": true,
      "explanation": "Maior variação = maior incerteza"
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "A volatilidade mede o quanto o preço oscila para cima e para baixo, é o ___ padrão.",
      "answer": "desvio",
      "hint": "Palavra de 5 letras",
      "explanation": "Desvio padrão = standard deviation"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Alta", "right": "Oscilações grandes"},
        {"left": "Baixa", "right": "Oscilações pequenas"},
        {"left": "Desvio padrão", "right": "Medida de volatilidade"},
        {"left": "Risco", "right": "Incerteza"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.7: Ativos por Nível
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 7, '4.7 Ativos por Nível', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Pirâmide de Ativos",
      "body": "Os investimentos se organizam em níveis de risco: base = renda fixa garantida (Tesouro Direto), meio = FIIs e ações de empresas sólidas, topo = small caps, cryptos e opções. A maioria deveria estar na base ou meio.",
      "emoji": "🔻"
    },
    {
      "type": "example",
      "title": "Pirâmide Completa",
      "body": "Nível 1 (base): Tesouro Selic, CDB. Nível 2: FIIs, ações blue chip (Itaú, Petrobras). Nível 3: small caps, ETFs setoriais. Nível 4 (topo): cryptos, opções. Cada nível cima = mais risco.",
      "highlight": "Comece da base!",
      "emoji": "🏗️"
    },
    {
      "type": "activity",
      "question": "Qual é o ativo mais seguro da pirâmide de investimentos?",
      "options": ["Ações", "FIIs", "Tesouro Selic", "Criptomoedas"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "A maioria dos investidores deveria focar na base da pirâmide.",
      "correct": true,
      "explanation": "Base = mais segurança, menos risco."
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Base", "right": "Renda fixa"},
        {"left": "Meio", "right": "Blue chips, FIIs"},
        {"left": "Topo", "right": "High risk"},
        {"left": "Proporção", "right": "Maior na base"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.8: Perda Máxima
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 8, '4.8 Perda Máxima', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Drawdown (Perda Máxima)",
      "body": "Drawdown é a maior queda do seu investimento desde o pico. Se você teve R$ 10.000, caiu para R$ 7.000, depois subiu para R$ 12.000, seu drawdown foi 30%. É importante saber quanto você pode perder antes de investir.",
      "emoji": "📉"
    },
    {
      "type": "example",
      "title": "Cálculo de drawdown",
      "body": "Você investe R$ 10.000. Ação cai para R$ 8.000 (queda 20%). Você espera e sobe para R$ 11.000. O drawdown máximo foi 20%. Em crises, drawdowns podem passar de 50%.",
      "highlight": "Prepare-se para drawdowns grandes!",
      "emoji": "🧮"
    },
    {
      "type": "activity",
      "question": "Se você tinha R$ 10.000 e caiu para R$ 8.000, qual foi o drawdown?",
      "options": ["10%", "20%", "25%", "50%"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Em uma crise de mercado, drawdowns podem passar de 50%.",
      "correct": true,
      "explanation": "Crises históricas passaram de 50%."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "A maior queda desde o pico se chama ___.",
      "answer": "drawdown",
      "hint": "Termo em inglês",
      "explanation": "Drawdown = perda máxima"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Drawdown", "right": "Perda máxima"},
        {"left": "Pico", "right": "Valor máximo"},
        {"left": "Atual", "right": "Valor presente"},
        {"left": "Recuperação", "right": "Voltar ao pico"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.9: Diversificação
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 9, '4.9 Diversificação', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que é Diversificação?",
      "body": "Diversificação é distribuir investimento entre vários ativos para reduzir risco. Se um cai, outros podem subir e compensar. Não elimina risco, mas reduz risco específico de cada ativo. É o única ferramenta gratuita no mercado.",
      "emoji": "🎲"
    },
    {
      "type": "example",
      "title": "Carteira Diversificada",
      "body": "Você tem R$ 10.000. Investe R$ 5.000 em ETFs, R$ 3.000 em FIIs, R$ 2.000 em Tesouro. Se ações caem mas FIIs estável, sua perda é menor do que se tivesse só ações.",
      "highlight": "Não coloque todos os ovos na mesma cesta!",
      "emoji": "🥚"
    },
    {
      "type": "activity",
      "question": "Qual tipo de risco a diversificação ajuda a reduzir?",
      "options": ["Risco sistêmico", "Risco específico", "Risco de liquidez", "Risco cambial"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "A diversificação reduz risco específico, não risco sistêmico.",
      "correct": true,
      "explanation": "Risco específico = de uma empresa/setor."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Investir valores fixos mensais se chama estratégia ___.",
      "answer": "DCA",
      "hint": "Sigla em inglês (Dollar Cost Averaging)",
      "explanation": "DCA = investimento programado"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "DCA", "right": "Investimento mensal"},
        {"left": "Correlação", "right": "Relação entre ativos"},
        {"left": "Específico", "right": "De uma empresa"},
        {"left": "Sistêmico", "right": "Do mercado todo"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.10: Quiz
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 10, '4.10 Quiz', 50, true, $$
{
  "questions": [
    {
      "question": "O que é risco em investimentos?",
      "options": ["Certeza de ganhar", "Possibilidade de perder", "Impossibilidade de perder", "Garantia do banco"],
      "correct": 1
    },
    {
      "question": "Qual risco acontece quando ninguém quer comprar seu ativo?",
      "options": ["Risco de mercado", "Risco de liquidez", "Risco de crédito", "Risco cambial"],
      "correct": 1
    },
    {
      "question": "Retorno real = retorno nominal - ?",
      "options": ["Impostos", "Inflação", "Taxa de administração", "Corretagem"],
      "correct": 1
    },
    {
      "question": "Qual é a relação básica entre risco e retorno?",
      "options": ["Inversa", "Direta", "Não tem relação", "Aleatória"],
      "correct": 1
    },
    {
      "question": "Por que o tempo reduz risco?",
      "options": ["Mercado só sobe", "Oscilações se suavizam", "Governo garante", "É mito"],
      "correct": 1
    },
    {
      "question": "O que é volatilidade?",
      "options": ["Volume de trade", "Oscilação de preço", "Velocidade de transferência", "Lucro"],
      "correct": 1
    },
    {
      "question": "Qual ativo está na base da pirâmide de risco?",
      "options": ["Ações", "Criptomoedas", "Tesouro Selic", "Small caps"],
      "correct": 2
    },
    {
      "question": "Drawdown é:",
      "options": ["Ganho máximo", "Perda máxima desde pico", "Lucro do dia", "Inflação acumulada"],
      "correct": 1
    },
    {
      "question": "Diversificação reduz qual tipo de risco?",
      "options": ["Sistêmico", "Específico", "Nenhum", "Todos"],
      "correct": 1
    },
    {
      "question": "DCA significa:",
      "options": ["Direct Crypto Access", "Dollar Cost Averaging", "Digital Cash Advance", "Diversified Crypto Assets"],
      "correct": 1
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 4.11: Desafio
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 4, 'Risco e Retorno', 11, '4.11 Desafio', 50, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Desafio: Classificação de Ativos",
      "body": "Agora você vai classificar 5 ativos em níveis de risco da pirâmide. Classifique cada um: Tesouro Selic (Nível 1), FII (Nível 2), Ação blue chip (Nível 2), Small cap (Nível 3), Bitcoin (Nível 4).",
      "emoji": "🏆"
    },
    {
      "type": "example",
      "title": "Classificação",
      "body": "Exemplo: Bitcoin = Nível 4 (alto risco). Petite análise de cada ativo da sua lista e defina onde ficam na pirâmide. Isso ajuda a construir sua carteira.",
      "highlight": "Pratique a classificação!",
      "emoji": "📝"
    },
    {
      "type": "activity",
      "question": "Classifique o Bitcoin em qual nível de risco?",
      "options": ["Nível 1 (base)", "Nível 2 (meio)", "Nível 3", "Nível 4 (topo)"],
      "correct": 3
    },
    {
      "type": "true_false",
      "statement": "Uma carteira equilibrada deve ter ativos de diferentes níveis.",
      "correct": true,
      "explanation": "Mistura = diversificação + risco controlado"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Tesouro Selic", "right": "Nível 1"},
        {"left": "FII", "right": "Nível 2"},
        {"left": "Small cap", "right": "Nível 3"},
        {"left": "Bitcoin", "right": "Nível 4"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Module 5: Corretoras e Bolsa (section_id=5)
-- Lesson 5.1: O que é uma Corretora?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 1, '5.1 O que é uma Corretora?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que é uma Corretora?",
      "body": "Corretora é uma empresa autorizada pela CVM para intermediar investimentos na bolsa. Você não pode comprar direto na B3 - precisa de uma corretora. Ela executa suas ordens, custodia seus ativos e cobra taxas.",
      "emoji": "🏦"
    },
    {
      "type": "example",
      "title": "Por que não comprar direto?",
      "body": "Seria como tentar entrar em um show sem ingresso. Você precisa de alguém autorizado (a corretora) para fazer a transação. Além disso, a corretora garante a segurança e regulation da B3.",
      "highlight": "A corretora é sua porta de entrada para a bolsa!",
      "emoji": "🎟️"
    },
    {
      "type": "activity",
      "question": "Qual perfil de investidor é mais indicado para investir diretamente em ações?",
      "options": ["Iniciante completo", "Intermediário", "Avançado", "Nenhum"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "É obrigatório ter uma corretora para investir na bolsa.",
      "correct": true,
      "explanation": "Corretora é intermediária obrigatória."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "A corretora precisa ser autorizada pela ___.",
      "answer": "CVM",
      "hint": "Sigla de reguladora",
      "explanation": "CVM = Comissão de Valores Mobiliários"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Corretora", "right": "Intermediária"},
        {"left": "B3", "right": "Bolsa brasileira"},
        {"left": "CVM", "right": "Reguladora"},
        {"left": "Custódia", "right": "Guarda de ativos"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.2: Como Escolher
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 2, '5.2 Como Escolher', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Critérios de Escolha",
      "body": "Na escolha, considere: taxa de corretagem (quanto cobra por ordem), taxa de custódia, mínimo de investimento, qualidade do home broker, atendimento e segurança. Compare sempre antes de abrir conta.",
      "emoji": "🔍"
    },
    {
      "type": "example",
      "title": "Comparativo de Corretoras",
      "body": "Corretora A: R$ 10 por ordem, sem custódia. Corretora B: gratuita para iniciantes, R$ 20 para avançados. Corretora C: R$ 8, mas cobram custódia. Pesquise bem!",
      "highlight": "Compare as taxas!",
      "emoji": "📊"
    },
    {
      "type": "activity",
      "question": "O que verificar antes de escolher uma corretora?",
      "options": ["Cor", "Taxas e reputação", "Nome", "Localização"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "É importante verificar a reputação da corretora em sites como Reclame Aqui.",
      "correct": true,
      "explanation": "Reputação indica qualidade de serviço."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Site de reclamações famoso no Brasil se chama ___ Aqui.",
      "answer": "Reclame",
      "hint": "Palavra de 7 letras",
      "explanation": "Reclame Aqui = principal site de reviews"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Taxa Ordem", "right": "Por operação"},
        {"left": "Custódia", "right": "Por guardar ativo"},
        {"left": "Home broker", "right": "Plataforma online"},
        {"left": "Regulada", "right": "Pela CVM"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.3: Abrir Conta
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 3, '5.3 Abrir Conta', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Passo a Passo",
      "body": "Abrir conta em corretora é simples: 1) Escolher corretora, 2) Acessar site/app, 3) Preencher dados, 4) Enviar documentos (RG, CPF, comprovante), 5) Assinar contrato digital, 6) Validar identidade. Tudo feito online.",
      "emoji": "📱"
    },
    {
      "type": "example",
      "title": "Exemplo: Rico",
      "body": "Baixe o app Rico. Clique em 'Abra sua conta'. Preencha CPF, nome, email. Tire foto do RG e selfie. Assine digital. Em minutos tem conta ativa. Depois, transfira dinheiro via TED.",
      "highlight": "Tudo 100% digital!",
      "emoji": "✅"
    },
    {
      "type": "activity",
      "question": "Como a maioria das corretoras permite abrir conta hoje?",
      "options": ["Presencial only", "Digital", "Carta", "Fax"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Para começar a investir, você precisa transferir dinheiro via TED.",
      "correct": true,
      "explanation": "TED = transferência entre bancos"
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Transferência entre bancos diferentes se chama ___.",
      "answer": "TED",
      "hint": "Sigla (Transferência Especial)",
      "explanation": "TED = transferência de dinheiro"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "CPF", "right": "Documento obrigatório"},
        {"left": "RG", "right": "Identidade"},
        {"left": "Selfie", "right": "Foto para validação"},
        {"left": "Conta", "right": "Acesso para investir"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.4: Home Broker
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 4, '5.4 Home Broker', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que é Home Broker?",
      "body": "Home broker é a plataforma da corretora onde você vê ticker, envia ordens de compras e vendas, acompanha sua carteira. É sua ferramenta principal para investir na bolsa.",
      "emoji": "💻"
    },
    {
      "type": "example",
      "title": "Recursos do Home Broker",
      "body": "No home broker você vê: lista de ativos, gráfico de preços, livro de ofertas, sua carteira, ordens ativas, histórico de trades. Tudo online, 24 horas por dia.",
      "highlight": "Sua central de investimentos!",
      "emoji": "📺"
    },
    {
      "type": "activity",
      "question": "O que você faz no home broker?",
      "options": ["Apenas ver preços", "Comprar e vender", "Não faz nada", "Apenas transferir"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "O home broker permite enviar ordens de compra e venda.",
      "correct": true,
      "explanation": "Plataforma de trading online."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "A plataforma de negociações se chama ___ broker.",
      "answer": "home",
      "hint": "Palavra em inglês",
      "explanation": "Home broker = plataforma de casa"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Gráfico", "right": "Visualização de preço"},
        {"left": "Livro ofertas", "right": "Pedidos de compra/venda"},
        {"left": "Carteira", "right": "Seus ativos"},
        {"left": "Ordem", "right": "Pedido de operação"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.5: Ordem de Compra
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 5, '5.5 Ordem de Compra', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Processo de Ordem",
      "body": "Quando você mande ordem de compra: 1) Escolha ativo, 2) Defina quantidade e preço, 3) Confirme. A ordem vai para o livro de ofertas. Quando alguém aceitar, negócio feito. Depois, D+2 dias úteis, ativo cai na sua conta.",
      "emoji": "🛒"
    },
    {
      "type": "example",
      "title": "Exemplo: WEGE3",
      "body": "Você quer comprar WEGE3. Vai no home broker, escolhe WEGE3, põe 100 ações por R$ 40. Sua ordem fica no livro. Quando alguém vender a R$ 40, a compra acontece. Em D+2, as ações são suas.",
      "highlight": "Ordem no livro = esperando execução!",
      "emoji": "⏳"
    },
    {
      "type": "activity",
      "question": "Em quantos dias úteis a compra aparece na sua conta?",
      "options": ["D+0", "D+1", "D+2", "D+5"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "A ordem fica no livro de ofertas até ser executada ou cancelada.",
      "correct": true,
      "explanation": "Pode ficar dias, se preço não bater."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O preço que você oferece na ordem se chama preço ___.",
      "answer": "ask",
      "hint": "Palavra em inglês (pergunta)",
      "explanation": "Ask = preço de venda"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Livro", "right": "Ofertas no mercado"},
        {"left": "Execução", "right": "Ordem concretizada"},
        {"left": "D+2", "right": "Liquidação"},
        {"left": "Compra", "right": "Adquirir ação"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.6: Tipos de Ordem
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 6, '5.6 Tipos de Ordem', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Tipos de Ordem",
      "body": "Existem vários tipos: mercado (compra ao preço atual), limitada (só no preço que você definindo), stop loss (vende se cair até certo preço), stop gain (vende se subir até certo preço). Cada uma serve um propósito.",
      "emoji": "📝"
    },
    {
      "type": "example",
      "title": "Três Ordens",
      "body": "Mercado: compre agora no melhor preço. Limitada: só compre se cair para R$ 10. Stop loss: se ação cair para R$ 9, vende automaticamente para limitar perda.",
      "highlight": "Escolha o tipo certo para seu objetivo!",
      "emoji": "🎯"
    },
    {
      "type": "activity",
      "question": "Qual tipo de ordem garante execuçãomas não garante preço?",
      "options": ["Limitada", "Mercado", "Stop loss", "Stop gain"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Stop loss serve para limitar perdas automaticamente.",
      "correct": true,
      "explanation": "Vende se atingir preço de proteção."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Ordem que venda automaticamente para limitar perda se chama stop ___.",
      "answer": "loss",
      "hint": "Palavra em inglês (perda)",
      "explanation": "Stop loss = parar perda"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Mercado", "right": "Preço atual"},
        {"left": "Limitada", "right": "Preço definido"},
        {"left": "Stop loss", "right": "Proteger contra queda"},
        {"left": "Stop gain", "right": "Garantir lucro"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.7: Lote e Fração
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 7, '5.7 Lote e Fração', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Lote e Frações",
      "body": "Na bolsa, ações são vendidas em lotes de 100 (múltiplos de 100). Mas desde 2019, você pode comprar frações (1, 2, 5...). Lote = múltiplo de 100. Fração = quantidade menor que 100.",
      "emoji": "🔢"
    },
    {
      "type": "example",
      "title": "Exemplo: BBAS3",
      "body": "BBAS3 custa R$ 50. Lote = 100 ações = R$ 5.000. Frações: você pode comprar 1 ação por R$ 50. Muito mais acessível para iniciantes!",
      "highlight": "Fração = acessível!",
      "emoji": "💵"
    },
    {
      "type": "activity",
      "question": "Se você compra 5 ações, que tipo de ordem é?",
      "options": ["Lote", "Fração", "Inteiro", "Múltiplo"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Frações permitem comprar menos de 100 ações.",
      "correct": true,
      "explanation": "Desde 2019, acessível."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O lote padrão na B3 é de ___ ações.",
      "answer": "100",
      "hint": "Número",
      "explanation": "Lote padrão = 100"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Lote", "right": "100 ações"},
        {"left": "Fração", "right": "Menos de 100"},
        {"left": "Integral", "right": "Múltiplo de 100"},
        {"left": "Retail", "right": "Investidor pessoa"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.8: Custos
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 8, '5.8 Custos', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Custos de Investir",
      "body": "Investir na bolsa tem custos: corretagem (por ordem), ISS (imposto municipal), taxa de custódia (para algumas corretoras), emolumentos (taxa B3). Algumas têm taxas zero para iniciantes.",
      "emoji": "💸"
    },
    {
      "type": "example",
      "title": "Cálculo de Custos",
      "body": "Você compra R$ 1.000 em ações. Corretagem: R$ 10. ISS (5% da corretagem): R$ 0,50. Emolumentos: R$ 0,15. Total: R$ 10,65. Em percentual: ~1%. Em R$ 10.000: ~0,15%.",
      "highlight": "Calcule custos antes de investir!",
      "emoji": "🧮"
    },
    {
      "type": "activity",
      "question": "Se você investe R$ 1.000 e paga R$ 10 em taxas, qual o custo percentual?",
      "options": ["0,5%", "1%", "5%", "10%"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Todas as corretoras cobram as mesmas taxas.",
      "correct": false,
      "explanation": "Cada uma tem sua tabela."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O ISS é o imposto ___.",
      "answer": "municipal",
      "hint": "Tipo de governo",
      "explanation": "ISS = imposto sobre serviços (municipal)"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Corretagem", "right": "Por ordem"},
        {"left": "Custódia", "right": "Por guarda"},
        {"left": "ISS", "right": "Imposto municipal"},
        {"left": "Emolumento", "right": "Taxa B3"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.9: Simulação
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 9, '5.9 Simulação', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Simulação Completa",
      "body": "Agora vamos simular: você tem R$ 10.000, quer investir em BOVA11. 1) Analise gráfico e preço. 2) Escolha tipo (limitada). 3) Defina preço e quantidade. 4) Calcule custos. 5) Mande ordem. 6) Acompanhe.",
      "emoji": "🎮"
    },
    {
      "type": "example",
      "title": "Exemplo: BOVA11",
      "body": "BOVA11 está R$ 100. Você quer R$ 10.000. Compra 100 cotas = R$ 10.000. Corretagem R$ 10. Total R$ 10.010. Ordem limitada a R$ 100. Depois, acompanhe no home broker.",
      "highlight": "Pratique antes de real!",
      "emoji": "💻"
    },
    {
      "type": "activity",
      "question": "Quantas cotas de BOVA11 dariacomprar com R$ 400?",
      "options": ["3", "4", "5", "6"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Ordem limitada garante que você compra apenas no preço definido.",
      "correct": true,
      "explanation": "Se preço não atinge, não compra."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Ordem que só executa no preço definido se chama ordem ___.",
      "answer": "limitada",
      "hint": "Palavra de 8 letras",
      "explanation": "Ordem limitada = price limit"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Análise", "right": "Ver gráfico"},
        {"left": "Planejamento", "right": "Definir quantidade"},
        {"left": "Execução", "right": "Mandar ordem"},
        {"left": "Acompanhamento", "right": "Monitorar"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.10: Quiz
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 10, '5.10 Quiz', 50, true, $$
{
  "questions": [
    {
      "question": "O que é necessário para investir na bolsa?",
      "options": ["Conta no banco", "Conta em corretora", "Conta no governo", "Nada"],
      "correct": 1
    },
    {
      "question": "O que verificar ao escolher uma corretora?",
      "options": ["Cor do logo", "Taxas e reputação", "Nome do founder", "Ano de fundação"],
      "correct": 1
    },
    {
      "question": "Como abrir conta na corretora hoje?",
      "options": ["Presencial only", "100% digital", "Carta registrada", "Apenas por telefone"],
      "correct": 1
    },
    {
      "question": "Onde você envia ordens de compra?",
      "options": ["Email", "Home broker", "SMS", "Fax"],
      "correct": 1
    },
    {
      "question": "Quantos dias úteis para ação ficar na sua contaapós compra?",
      "options": ["D+0", "D+1", "D+2", "D+7"],
      "correct": 2
    },
    {
      "question": "Qual ordem garante execução mas não preço?",
      "options": ["Limitada", "Mercado", "Stop loss", "Stop gain"],
      "correct": 1
    },
    {
      "question": "Fração significa comprar menos de quantas ações?",
      "options": ["10", "50", "100", "1000"],
      "correct": 2
    },
    {
      "question": "Qual é um custo ao investir em ações?",
      "options": ["Assinatura", "Corretagem", "Anuidade", "Matrícula"],
      "correct": 1
    },
    {
      "question": "Ordem limitada executa apenas em qual preço?",
      "options": ["Qualquer um", "Definido por você", "Menor preço", "Maior preço"],
      "correct": 1
    },
    {
      "question": "O que significa D+2?",
      "options": ["Depois de 2 dias", "Liquidação", "Debênture", "Desconto"],
      "correct": 1
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 5.11: Desafio
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 5, 'Corretoras e Bolsa', 11, '5.11 Desafio', 50, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Desafio: Simulação Final",
      "body": "Agora o desafio: você tem R$ 30.000. Precisa separar R$ 25.000 para investir e deixar R$ 5.000 na reserva para emergência. Escolha ativos diversificados, calcule custos e simule pelo home broker.",
      "emoji": "🎓"
    },
    {
      "type": "example",
      "title": "Cenário",
      "body": "Reserva: R$ 5.000 (Tesouro Selic). Para investir: R$ 25.000. Sugestão: R$ 15.000 BOVA11 (ETF), R$ 6.000 FIIs, R$ 4.000 BDRs. Use ordens limitadas para controlar preço.",
      "highlight": "Simule na prática!",
      "emoji": "💡"
    },
    {
      "type": "activity",
      "question": "Com R$ 30.000, qual valor máximo parainvestir considerando reserva de emergência?",
      "options": ["R$ 10.000", "R$ 20.000", "R$ 25.000", "R$ 30.000"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "Sempre mantenha uma reserva financeira antes de investir em renda variável.",
      "correct": true,
      "explanation": "Reserva = segurança"
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Dinheiro separado para emergências se chama ___ de emergência.",
      "answer": "reserva",
      "hint": "Palavra de 7 letras",
      "explanation": "Reserva de emergência"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Reserva", "right": "Emergencial"},
        {"left": "Investimento", "right": "Renda variável"},
        {"left": "Tesouro", "right": "Segurança"},
        {"left": "Ações", "right": "Crescimento"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;