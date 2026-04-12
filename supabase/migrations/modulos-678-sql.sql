-- Module 6: Mercado Financeiro (section_id=6)
-- Lesson 6.1: Liquidez
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 1, '6.1 Liquidez', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que e Liquidez?",
      "body": "Liquidez e a facilidade de converter um ativo em dinheiro sem perder valor. Um ativo liquido e aquele que voce consegue vender rapidamente pelo preco justo. Acoes de empresas grandes sao muito liquidas. Imoveis sao pouco liquidos.",
      "emoji": "💧"
    },
    {
      "type": "example",
      "title": "Acoes vs Imovel",
      "body": "Se voce tem acoes da Petrobras, vende em segundos pelo preco do mercado. Se tem um apartamento, pode levar meses para vender, e muitas vezes precisa baixar o preco. Por isso, acoes sao liquidas e imoveis nao sao.",
      "highlight": "Liquidez = velocidade de venda!",
      "emoji": "🏠 vs 📈"
    },
    {
      "type": "activity",
      "question": "Qual ativo tem maior liquidez?",
      "options": ["Apartamento", "Acao da Petrobras", "Terreno", "Carro usado"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Imoveis sao considerados ativos de alta liquidez.",
      "correct": false,
      "explanation": "Imoveis levam tempo para vender."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Acao com alto volume de negociacao tem alta ___.",
      "answer": "liquidez",
      "hint": "Palavra de 8 letras",
      "explanation": "Liquidez = facilidade de vender"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Acoes", "right": "Alta liquidez"},
        {"left": "Imoveis", "right": "Baixa liquidez"},
        {"left": "Tesouro", "right": "Alta liquidez"},
        {"left": "Small caps", "right": "Baixa liquidez"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.2: Volume Negociado
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 2, '6.2 Volume Negociado', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Volume Negociado",
      "body": "Volume e o total de acoes negociadas em um periodo. Alto volume = muita negociacao = preco justo. Baixo volume = pouca negociacao = preco pode distorcer. Volume diario mostra a saude do ativo.",
      "emoji": "📊"
    },
    {
      "type": "example",
      "title": "PETR4 vs Empresa X",
      "body": "PETR4 negocia 50 milhoes de acoes por dia. Empresa X negocia 10 mil. Com PETR4, o preco e justo. Com X, uma unica venda de R$ 10 mil pode fazer o preco cair 5%.",
      "highlight": "Volume alto = preco justo!",
      "emoji": "📈"
    },
    {
      "type": "activity",
      "question": "O que alto volume de negociacao indica?",
      "options": ["Preco vai cair", "Preco justo", "Empresa bankrupt", "Nada"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Acoes com baixo volume podem ter precos distorcidos.",
      "correct": true,
      "explanation": "Poucas negociacoes afetam preco."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Volume mede a ___ de negociacoes de um ativo.",
      "answer": "quantidade",
      "hint": "Palavra de 10 letras",
      "explanation": "Quantidade = volume"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Alto volume", "right": "Preco justo"},
        {"left": "Baixo volume", "right": "Preco distorcido"},
        {"left": "Volume zero", "right": "Ativo parado"},
        {"left": "Volume normal", "right": "Mercado saudavel"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.3: Spread
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 3, '6.3 Spread', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que e Spread?",
      "body": "Spread e a diferenca entre o maior preco de compra (bid) e o menor preco de venda (ask). Spread pequeno = mercado eficiente. Spread grande = mercado iliquido ou ineficiente. E como o spread do seu dinheiro.",
      "emoji": "📐"
    },
    {
      "type": "example",
      "title": "PETR4 vs Small Cap",
      "body": "PETR4: bid R$ 35,00, ask R$ 35,10 = spread R$ 0,10 (0,3%). Small cap Y: bid R$ 10,00, ask R$ 11,00 = spread R$ 1,00 (10%). Pequeno spread = liquidity!",
      "highlight": "Spread baixo = mercado bom!",
      "emoji": "💰"
    },
    {
      "type": "activity",
      "question": "O que significa spread de 1% em uma acao?",
      "options": ["Diferenca de 1% entre bid e ask", "Comissao de 1%", "Imposto de 1%", "Lucro de 1%"],
      "correct": 0
    },
    {
      "type": "true_false",
      "statement": "Spread baixo indica mercado liquido.",
      "correct": true,
      "explanation": "Muita oferta e demanda = spread apertado."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Spread e a diferenca entre bid e ___.",
      "answer": "ask",
      "hint": "Palavra em ingles",
      "explanation": "Ask = preco de venda"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Bid", "right": "Preco de compra"},
        {"left": "Ask", "right": "Preco de venda"},
        {"left": "Spread baixo", "right": "Mercado liquido"},
        {"left": "Spread alto", "right": "Mercado iliquido"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.4: Blue Chips x Small Caps
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 4, '6.4 Blue Chips x Small Caps', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Blue Chips vs Small Caps",
      "body": "Blue chips sao empresas grandes e consolidadas (Itau, Petrobras, Vale). Small caps sao empresas menores com maior potencial de crescimento e risco. Blue chips = seguranca. Small caps = crescimento.",
      "emoji": "🦋"
    },
    {
      "type": "example",
      "title": "Exemplos",
      "body": "Blue chip: Itau (ITUB4), anos de lucros estaveis. Small cap: empresa de tecnologia menor, pode subir 100% ou cair 50%. Cada uma cumpre um papel diferente na carteira.",
      "highlight": "Blue chips = seguranca, small caps = crescimento!",
      "emoji": "🏦 vs 🚀"
    },
    {
      "type": "activity",
      "question": "Qual tipo de acao tem maior risco?",
      "options": ["Blue chips", "Small caps", "Tesouro", "CDB"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Small caps tem maior potencial de alta que blue chips.",
      "correct": true,
      "explanation": "Menor size = maior crescimento potencial."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Empresas consolidadas e estaveis sao chamadas blue ___.",
      "answer": "chips",
      "hint": "Termo em ingles",
      "explanation": "Blue chips = empresas solidas"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Blue chips", "right": "Empresas grandes"},
        {"left": "Small caps", "right": "Empresas pequenas"},
        {"left": "Itau", "right": "Blue chip"},
        {"left": "Empresa X", "right": "Small cap"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.5: Bull Market x Bear Market
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 5, '6.5 Bull Market x Bear Market', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Bull vs Bear",
      "body": "Bull market = mercado em alta (otimismo, precos subindo). Bear market = mercado em baixa (pessimismo, precos caindo). Os nomes vem de como cada animal ataca: touro (chifres para cima) vs urso (garras para baixo).",
      "emoji": "🐂 vs 🐻"
    },
    {
      "type": "example",
      "title": "Ciclos",
      "body": "2020 pandemia: bear market (queda forte). 2020-2021 pos-vacina: bull market (alta historica). 2022 bear novamente. 2023-2024 bull. O mercado Cicla!",
      "highlight": "Mercado e ciclico!",
      "emoji": "🔄"
    },
    {
      "type": "activity",
      "question": "Bull market significa mercado em...?",
      "options": ["Queda", "Alta", "Lateral", "Parado"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "O mercado alterna entre fases de bull e bear.",
      "correct": true,
      "explanation": "Ciclos sao normais."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Mercado em queda se chama mercado ___.",
      "answer": "bear",
      "hint": "Animal que ruge",
      "explanation": "Bear = urso = baixa"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Bull", "right": "Alta"},
        {"left": "Bear", "right": "Baixa"},
        {"left": "Touro", "right": "Sobe"},
        {"left": "Urso", "right": "Desce"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.6: Rally e Correcao
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 6, '6.6 Rally e Correcao', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Rally e Correcao",
      "body": "Rally = sequencia de altas continuas (otimismo). Correcao = queda de 10%+ para ajustar preco. Correcao e normal e saudavel. Rally temporarios. Correcao oportunidade.",
      "emoji": "🚀"
    },
    {
      "type": "example",
      "title": "Correcao de 2022",
      "body": "Ibovespa subiu muito em 2020-2021. Em 2022, teve correcao de ~20% para ajustar. Quem vendeu em panico perdeu. Quem comprou na correcao lucrou depois.",
      "highlight": "Correcao = oportunidade!",
      "emoji": "📉 → 📈"
    },
    {
      "type": "activity",
      "question": "Correcao tecnica e uma queda de aproximadamente...?",
      "options": ["5%", "10%", "20%", "50%"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Correcoes sao normais e saudaveis no mercado.",
      "correct": true,
      "explanation": "Mercado precisa correcao para ajustar precos."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Sequencia de altas Continuadas se chama ___.",
      "answer": "rally",
      "hint": "Palavra em ingles",
      "explanation": "Rally = alta continua"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Rally", "right": "Altas sequenciais"},
        {"left": "Correcao", "right": "Queda de 10%+"},
        {"left": "Panico", "right": "Vender em correcao"},
        {"left": "Oportunidade", "right": "Comprar na correcao"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.7: Circuit Breaker
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 7, '6.7 Circuit Breaker', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "O que e Circuit Breaker?",
      "body": "Circuit breaker e um mecanismo que pausa a negociacao quando o mercado cai muito rapidamente. Na B3, se o Ibovespa cair 10%, negociacoes pausam por 30 min. Se 15%, pausa de 1h. Protege contra panico.",
      "emoji": "⚡"
    },
    {
      "type": "example",
      "title": "Exemplo: 2020",
      "body": "Em marco 2020 (pandemia), Ibovespa caiu +10% em poucos minutos. Circuit breaker ativou. Negociacao pausou. Investidores tiveram tempo para pensar. Apos pausa, mercado reequilibrou.",
      "highlight": "Parada automatica = protecao!",
      "emoji": "🛑"
    },
    {
      "type": "activity",
      "question": "Circuit breaker ativa quando o mercado...?",
      "options": ["Sobe muito", "Cai muito rapido", "Para", "Nada"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Circuit breaker existe para evitar panico em vendas.",
      "correct": true,
      "explanation": "Pausa = tempo para reflexao."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Circuit breaker e acionado em casos de ___ extrema.",
      "answer": "queda",
      "hint": "Oposto de alta",
      "explanation": "Queda = volatilidade negativa"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "10% queda", "right": "Pausa 30 min"},
        {"left": "15% queda", "right": "Pausa 1 hora"},
        {"left": "B3", "right": "Usa circuit breaker"},
        {"left": "NYSE", "right": "Tambem tem circuit breaker"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.8: Dividend Yield - Uma Previa
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 8, '6.8 Dividend Yield - Uma Previa', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Dividend Yield",
      "body": "Dividend yield (DY) e o rendimento do dividendo dividido pelo preco da acao. Se acao custa R$ 100 e paga R$ 8 de dividendo, yield e 8%. E uma forma de ganhar com acoes, alem da alta.",
      "emoji": "💵"
    },
    {
      "type": "example",
      "title": "ITUB4",
      "body": "Itau (ITUB4) custa ~R$ 35. Paga ~R$ 1 por acao/ano em dividendos. Yield ~2,8%. Nao e alto, mas e renda de acoes. Em FIIs, yields sao maiores.",
      "highlight": "DY = retorno em dinheiro!",
      "emoji": "🏦"
    },
    {
      "type": "activity",
      "question": "Se acao custa R$ 100 e paga R$ 5 em dividendos, qual o yield?",
      "options": ["5%", "10%", "15%", "20%"],
      "correct": 0
    },
    {
      "type": "true_false",
      "statement": "Dividend yield e calculado dividindo o dividendo pelo preco da acao.",
      "correct": true,
      "explanation": "DY = dividendo / preco"
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "DY significa dividend ___.",
      "answer": "yield",
      "hint": "Termo em ingles para rendimento",
      "explanation": "Yield = rendimento"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "DY", "right": "Rendimento de dividendos"},
        {"left": "P/L", "right": "Preco sobre lucro"},
        {"left": "VPA", "right": "Valor patrimonial por acao"},
        {"left": "Dividendo", "right": "Lucro distribuido"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.9: Market Cap
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 9, '6.9 Market Cap', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Market Cap (Valor de Mercado)",
      "body": "Market cap (capitalizacao de mercado) = preco da acao x numero de acoes. Se empresa tem 1 bilhao de acoes a R$ 10, market cap = R$ 10 bilhoes. Indicador do tamanho da empresa.",
      "emoji": "💰"
    },
    {
      "type": "example",
      "title": "PETR4 vs small cap",
      "body": "Petrobras: market cap ~R$ 300 bilhoes (gigante). Small cap Y: market cap ~R$ 500 milhoes (pequena). Market cap ajuda a classificar o tamanho.",
      "highlight": "Market cap = tamanho da empresa!",
      "emoji": "🏢"
    },
    {
      "type": "activity",
      "question": "Market cap e calculado como...?",
      "options": ["Lucro x preco", "Preco x numero de acoes", "Receita x preco", "Divida x preco"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Market cap indica o valor total da empresa na bolsa.",
      "correct": true,
      "explanation": "Cap = capitalizacao total."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Market cap e a capitalizacao de ___ da empresa.",
      "answer": "mercado",
      "hint": "Palavra de 7 letras",
      "explanation": "Mercado = bolsa"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "> 10 bi", "right": "Large cap"},
        {"left": "2-10 bi", "right": "Mid cap"},
        {"left": "< 2 bi", "right": "Small cap"},
        {"left": "Preco x acoes", "right": "Market cap"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.10: Flashcard de Termos
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 10, '6.10 Flashcard de Termos', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Revisao de Termos",
      "body": "Vamos revisar os principais termos do mercado financeiro: liquidez, volume, spread, blue chip, small cap, bull, bear, rally, correcao, circuit breaker, dividend yield, market cap.",
      "emoji": "📚"
    },
    {
      "type": "example",
      "title": "Flashcards",
      "body": "Liquidez = facilidade de vender. Volume = quantidade negociada. Spread = diferenca bid/ask. Blue chip = empresa grande. Small cap = empresa pequena. Bull = alta. Bear = baixa.",
      "highlight": "Revise estes termos sempre!",
      "emoji": "🗂️"
    },
    {
      "type": "activity",
      "question": "Qual termo representa empresa grande e consolidada?",
      "options": ["Small cap", "Blue chip", "Bull", "Bear"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Bull market significa otimismo e altas.",
      "correct": true,
      "explanation": "Bull = touro = sobe."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Sequencia de altas se chama ___.",
      "answer": "rally",
      "hint": "Palavra em ingles",
      "explanation": "Rally = alta continua"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Liquidez", "right": "Facilidade de vender"},
        {"left": "Volume", "right": "Quantidade negociada"},
        {"left": "Spread", "right": "Diferenca bid/ask"},
        {"left": "Market cap", "right": "Valor total"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 6.11: Quiz do Modulo
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 6, 'Mercado Financeiro', 11, '6.11 Quiz do Modulo', 50, true, $$
{
  "questions": [
    {
      "question": "O que e liquidez em investimentos?",
      "options": ["Facilidade de converter em dinheiro", "Retorno garantido", "Imposto pago", "Risco zero"],
      "correct": 0
    },
    {
      "question": "Alto volume de negociacao indica:",
      "options": ["Preco instavel", "Preco justo", "Empresa falida", "Risco baixo"],
      "correct": 1
    },
    {
      "question": "Spread e a diferenca entre:",
      "options": ["Bid e ask", "Preco e valor", "Compra e venda", "Lucro e prejuiso"],
      "correct": 0
    },
    {
      "question": "Blue chips sao:",
      "options": ["Empresas pequenas", "Empresas consolidadas", "Startups", "FIIs"],
      "correct": 1
    },
    {
      "question": "Bull market significa:",
      "options": ["Mercado em queda", "Mercado em alta", "Mercado parado", "Mercado lateral"],
      "correct": 1
    },
    {
      "question": "Correcao tecnica e uma queda de aproximadamente:",
      "options": ["5%", "10%", "20%", "50%"],
      "correct": 1
    },
    {
      "question": "Circuit breaker ativa quando:",
      "options": ["Mercado sobe muito", "Mercado cai muito rapido", "Negociaçao normal", "Volume aumenta"],
      "correct": 1
    },
    {
      "question": "Dividend yield e calculado como:",
      "options": ["Dividendo / preco", "Preco / dividendo", "Lucro / preco", "Receita / dividendo"],
      "correct": 0
    },
    {
      "question": "Market cap e:",
      "options": ["Lucro anual", "Receita total", "Preco x acoes", "Divida total"],
      "correct": 2
    },
    {
      "question": "Spread alto indica:",
      "options": ["Mercado liquido", "Mercado iliquido", "Sem risco", "Alta demanda"],
      "correct": 1
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Module 7: Indices de Mercado (section_id=7)
-- Lesson 7.1: O que e um Indice?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 1, '7.1 O que e um Indice?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Entendendo Indices",
      "body": "Indice e uma carteira teorica de acoes que representa um segmento do mercado. Funciona como um termometro: se o indice sobe, o mercado sobe no geral. Serve para medir o desempenho e comparar investimentos.",
      "emoji": "🌡️"
    },
    {
      "type": "example",
      "title": "Exemplo: Ibovespa",
      "body": "Ibovespa tem as ~80 maiores empresas do Brasil. Se ele sobe 1%, significa que, na media, essas empresas subiram. E uma referencia para o mercado brasileiro.",
      "highlight": "Indice = termometro do mercado!",
      "emoji": "📊"
    },
    {
      "type": "activity",
      "question": "Para que serve um indice de mercado?",
      "options": ["Para prever o futuro", "Como referencia de desempenho", "Para pagar dividendos", "Para calcular imposto"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Indice e uma carteira teorica de acoes.",
      "correct": true,
      "explanation": "Nao existe fisicamente, e uma referencia."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Indice funciona como um ___ do mercado.",
      "answer": "termometro",
      "hint": "Mede temperatura",
      "explanation": "Termometro = referencia"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Indice", "right": "Carteira teorica"},
        {"left": "Carteira", "right": "Seus ativos reais"},
        {"left": "Desempenho", "right": "Comparacao com indice"},
        {"left": "Benchmark", "right": "Referencia"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.2: Ibovespa - O Principal do Brasil
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 2, '7.2 Ibovespa - O Principal do Brasil', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Ibovespa",
      "body": "Ibovespa (IBOV) e o principal indice brasileiro. Replica as ~80 maiores empresas da B3 em liquidez. Criado em 1968, e o termometro mais usado do mercado brasileiro.",
      "emoji": "🇧🇷"
    },
    {
      "type": "example",
      "title": "Composicao",
      "body": "IBOV tem: Itau, Petrobras, Vale, Ambev, B3, WEG... Juntas, representam ~80% do volume. E o reflexo do mercado brasileiro. Para investir, use BOVA11 (ETF).",
      "highlight": "IBOV = mercado brasileiro!",
      "emoji": "📈"
    },
    {
      "type": "activity",
      "question": "Quantas empresas o Ibovespa contempla aproximadamente?",
      "options": ["20", "80", "200", "500"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Ibovespa e o principal indice da bolsa brasileira.",
      "correct": true,
      "explanation": "IBOV = principal referencia."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "IBOV e o indice principal da ___ brasileira.",
      "answer": "bolsa",
      "hint": "Mercado de acoes (B3)",
      "explanation": "Bolsa = B3"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "IBOV", "right": "Indice brasileiro"},
        {"left": "BOVA11", "right": "ETF do IBOV"},
        {"left": "B3", "right": "Bolsa brasileira"},
        {"left": "80 empresas", "right": "Composicao IBOV"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.3: Como o Ibovespa e Calculado?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 3, '7.3 Como o Ibovespa e Calculado?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Calculo do Ibovespa",
      "body": "IBOV e calculado pela soma dos precos x quantidade de acoes, dividido por um divisor. Empresas com mais negociacao tem maior peso. O divisor e ajustado por splits e dividendos.",
      "emoji": "🧮"
    },
    {
      "type": "example",
      "title": "Calculo Simplificado",
      "body": "PETR4: 100 acoes x R$ 35 = R$ 3.500. ITUB4: 200 acoes x R$ 35 = R$ 7.000. Soma total: R$ 10.500. Divide pelo divisor: resultado = pontos. Simples!",
      "highlight": "Preco x quantidade = base!",
      "emoji": "📐"
    },
    {
      "type": "activity",
      "question": "O que determina o peso de cada acao no IBOV?",
      "options": ["Tamanho da empresa", "Lucro", "Volume de negociacao", "Preco da acao"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "Empresas com mais negociacao tem maior peso no IBOV.",
      "correct": true,
      "explanation": "Liquidez = peso."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O IBOV e calculado com base no preco x ___ das acoes.",
      "answer": "quantidade",
      "hint": "Quantas acoes",
      "explanation": "Quantidade = numero de acoes"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Peso", "right": "Por negociacao"},
        {"left": "Divisor", "right": "Ajusta calculo"},
        {"left": "Pontos", "right": "Resultado do indice"},
        {"left": "Atualizacao", "right": "A cada 4 segundos"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.4: IFIX - Indice dos FIIs
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 4, '7.4 IFIX - Indice dos FIIs', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "IFIX",
      "body": "IFIX e o indice de FIIs (Fundos Imobiliarios). Replica os principais FIIs negociados. Criado pela B3. Permite investir em FIIs via ETF: FIAF11.",
      "emoji": "🏢"
    },
    {
      "type": "example",
      "title": "Composicao",
      "body": "IFIX tem: XPGT11 (shopping), KNIP11 (logistica), HGLG11 (galpoes). Esses FIIs representam a maioria do mercado. Se IFIX sobe, FIIs vao bem.",
      "highlight": "IFIX = FIIs!",
      "emoji": "🏬"
    },
    {
      "type": "activity",
      "question": "Qual indice representa os Fundos Imobiliarios?",
      "options": ["IBOV", "IFIX", "S&P 500", "NASDAQ"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "IFIX replica os principais FIIs da bolsa.",
      "correct": true,
      "explanation": "Indice de FIIs."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Para investir em FIIs via ETF, use o indice ___.",
      "answer": "IFIX",
      "hint": "Sigla do indice de FIIs",
      "explanation": "IFIX = indice de FIIs"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "IFIX", "right": "Indice de FIIs"},
        {"left": "FIAF11", "right": "ETF de FIIs"},
        {"left": "FII", "right": "Fundo imobliario"},
        {"left": "Shopping", "right": "Tipo de FII"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.5: S&P 500
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 5, '7.5 S&P 500', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "S&P 500",
      "body": "S&P 500 e o principal indice americano. Replica as 500 maiores empresas dos EUA (por market cap). E o mais acompanhado do mundo. Referencia global de mercado.",
      "emoji": "🇺🇸"
    },
    {
      "type": "example",
      "title": "Empresas do S&P",
      "body": "S&P tem: Apple, Microsoft, Amazon, Google, Meta, NVIDIA, Tesla... As maiores empresas do mundo. Para investir, use IVVB11 (ETF brasileiro) ou direto na NYSE.",
      "highlight": "S&P 500 = as maiores do mundo!",
      "emoji": "🌎"
    },
    {
      "type": "activity",
      "question": "Quantas empresas o S&P 500 contempla?",
      "options": ["100", "500", "1000", "5000"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "S&P 500 e o principal indice mundial.",
      "correct": true,
      "explanation": "Referencia global."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "S&P 500 e composto pelas ___ maiores empresas dos EUA.",
      "answer": "500",
      "hint": "Numero",
      "explanation": "500 empresas"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "S&P 500", "right": "Indice americano"},
        {"left": "IVVB11", "right": "ETF do S&P no Brasil"},
        {"left": "Apple", "right": "Maior do S&P"},
        {"left": "Market cap", "right": "Criterio de selecao"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.6: NASDAQ
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 6, '7.6 NASDAQ', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "NASDAQ",
      "body": "NASDAQ e o indice de tecnologia dos EUA. Replica as maiores empresas de tecnologia: Apple, Microsoft, Google, Amazon, Meta, NVIDIA. E o indice mais inovador.",
      "emoji": "💻"
    },
    {
      "type": "example",
      "title": "Tech Giants",
      "body": "NASDAQ tem: Apple, Microsoft, Google, Amazon, NVIDIA, Tesla (tambem tech). Estas empresas lideram inovacao. Quem quer exposicao a tech, acompanha NASDAQ.",
      "highlight": "NASDAQ = tecnologia!",
      "emoji": "🚀"
    },
    {
      "type": "activity",
      "question": "Qual tipo de empresas predomina no NASDAQ?",
      "options": ["Bancos", "Industria", "Tecnologia", "Energia"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "NASDAQ e o indice de tecnologia.",
      "correct": true,
      "explanation": "Domina empresas tech."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "NASDAQ e famoso por ser o indice de ___.",
      "answer": "tecnologia",
      "hint": "Setor de tecnologia",
      "explanation": "Tech = tecnologia"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "NASDAQ", "right": "Indice tech"},
        {"left": "Apple", "right": "Maior do NASDAQ"},
        {"left": "NVIDIA", "right": "Empresa de chips"},
        {"left": "QQQ", "right": "ETF do NASDAQ"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.7: Dow Jones
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 7, '7.7 Dow Jones', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Dow Jones",
      "body": "Dow Jones (DJI) e o indice mais antigo (desde 1885). Tem 30 empresas blue chips americanas. E um indice de precos (nao market cap). Menor que S&P 500 em cobertura.",
      "emoji": "📰"
    },
    {
      "type": "example",
      "title": "Composicao",
      "body": "Dow tem: Apple, Microsoft, Boeing, Caterpillar, Coca-Cola... 30 empresas tradicionais. E mais historico que representativo. Poucas empresas.",
      "highlight": "Dow = indice historico!",
      "emoji": "🏭"
    },
    {
      "type": "activity",
      "question": "Quantas empresas o Dow Jones contempla?",
      "options": ["10", "30", "100", "500"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Dow Jones e o indice mais antigo do mundo.",
      "correct": true,
      "explanation": "Criado em 1885."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Dow Jones tem ___ empresas.",
      "answer": "30",
      "hint": "Numero de 2 digitos",
      "explanation": "30 companies"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Dow Jones", "right": "30 empresas"},
        {"left": "S&P 500", "right": "500 empresas"},
        {"left": "1885", "right": "Ano de criaçao"},
        {"left": "Blue chips", "right": "Tipo do Dow"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.8: Como Usar os Indices como Referencia
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 8, '7.8 Como Usar os Indices como Referencia', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Usando Indices",
      "body": "Use indices para comparar: se seu portfolio rende 15% e IBOV rende 10%, voce venceu o mercado. Nao busque batter indice sempre. Use como referencia de risco.",
      "emoji": "🎯"
    },
    {
      "type": "example",
      "title": "Comparacao",
      "body": "Em 2023, IBOV rendeu 15%. Seu portfolio rendeu 18%. Voce venceu o mercado em 3%. Bom resultado! Use indices para calibrar expectativas.",
      "highlight": "Indice = Referencia!",
      "emoji": "📊"
    },
    {
      "type": "activity",
      "question": "Qual o proposito basico de um indice?",
      "options": ["Investir diretamente", "Comparar desempenho", "Calcular imposto", "Predizer futuro"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Comparar seu retorno com o indice ajuda a avaliar desempenho.",
      "correct": true,
      "explanation": "Benchmark = referencia."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Comparar com indice se chama ___.",
      "answer": "benchmarking",
      "hint": "Termo em ingles",
      "explanation": "Benchmark = referencia"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Benchmark", "right": "Referencia"},
        {"left": "Vencer indice", "right": "Alpha"},
        {"left": "Perder indice", "right": "Beta"},
        {"left": "Risco", "right": "Volatilidade"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.9: Benchmarking da Sua Carteira
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 9, '7.9 Benchmarking da Sua Carteira', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Benchmarking",
      "body": "Para fazer benchmark, escolha um indice que combina com sua estrategia. Acoes brasileiras = IBOV. FIIs = IFIX. Acoes EUA = S&P 500. Compare retornos ajustados por risco.",
      "emoji": "⚖️"
    },
    {
      "type": "example",
      "title": "Escolha de Benchmark",
      "body": "Se sua carteira tem 70% acoes brasileiras + 30% FIIs, compare: 70% IBOV + 30% IFIX = benchmark misto. Calcule retorno esperado vs realizado.",
      "highlight": "Escolha o benchmark certo!",
      "emoji": "📈"
    },
    {
      "type": "activity",
      "question": "Qual indice usar para benchmark de FIIs?",
      "options": ["IBOV", "IFIX", "S&P 500", "Dow Jones"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Carteira diversificada precisa de multiplos benchmarks.",
      "correct": true,
      "explanation": "Cada ativo tem seu benchmark."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Para benchmark de acoes EUA, use ___.",
      "answer": "S&P 500",
      "hint": "Indice americano",
      "explanation": "S&P 500 = reference EUA"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Acoes BR", "right": "IBOV"},
        {"left": "FIIs", "right": "IFIX"},
        {"left": "Acoes EUA", "right": "S&P 500"},
        {"left": "Tech", "right": "NASDAQ"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 7.10: Quiz do Modulo
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 7, 'Indices de Mercado', 10, '7.10 Quiz do Modulo', 50, true, $$
{
  "questions": [
    {
      "question": "O que e um indice de mercado?",
      "options": ["Uma unica acao", "Carteira teorica", "Um fundo", "Um banco"],
      "correct": 1
    },
    {
      "question": "Qual e o principal indice brasileiro?",
      "options": ["S&P 500", "IBOV", "NASDAQ", "Dow"],
      "correct": 1
    },
    {
      "question": "Quantas empresas tem o S&P 500?",
      "options": ["100", "500", "1000", "30"],
      "correct": 1
    },
    {
      "question": "IFIX representa quais ativos?",
      "options": ["Acoes", "FIIs", "Crypto", "Tesouro"],
      "correct": 1
    },
    {
      "question": "NASDAQ e focado em qual setor?",
      "options": ["Bancos", "Industria", "Tecnologia", "Energia"],
      "correct": 2
    },
    {
      "question": "Quantas empresas tem o Dow Jones?",
      "options": ["30", "50", "500", "100"],
      "correct": 0
    },
    {
      "question": "O que e benchmarking?",
      "options": ["Investir no indice", "Comparar desempenho", "Criar indice", "Calcular imposto"],
      "correct": 1
    },
    {
      "question": "Para comparar FIIs, use qual indice?",
      "options": ["IBOV", "IFIX", "S&P 500", "NASDAQ"],
      "correct": 1
    },
    {
      "question": "S&P 500 e o principal indice de qual pais?",
      "options": ["Brasil", "EUA", "China", "Japao"],
      "correct": 1
    },
    {
      "question": "IBOV representa as maiores empresas de qual bolsa?",
      "options": ["NYSE", "B3", "London", "Tokyo"],
      "correct": 1
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Module 8: Renda Fixa vs Variavel (section_id=8)
-- Lesson 8.1: O que e Renda Fixa?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 1, '8.1 O que e Renda Fixa?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Renda Fixa",
      "body": "Renda fixa e investimento com retorno pre-determinado. Voce sabe quanto vai receber no final. Exemplos: Tesouro Direto, CDB, LCI, LCA, debentures. Risco menor, retorno menor.",
      "emoji": "🔒"
    },
    {
      "type": "example",
      "title": "Tesouro Selic",
      "body": "Voce compra Tesouro Selic hoje. A taxa e ~10% ao ano. Se investir R$ 10.000, em 1 ano tem ~R$ 11.000. O retorno esta pre-determinado: voce sabe quanto vai receber.",
      "highlight": "Retorno pre-determinado!",
      "emoji": "💵"
    },
    {
      "type": "activity",
      "question": "Qual e a caracteristica principal da renda fixa?",
      "options": ["Retorno variavel", "Retorno pre-determinado", "Alto risco", "Sem imposto"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Renda fixa tem retorno pre-determinado.",
      "correct": true,
      "explanation": "Voce sabe o retorno ao investir."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "TesouroDireto e um exemplo de renda ___.",
      "answer": "fixa",
      "hint": "Oposto de variavel",
      "explanation": "Renda fixa = retorno fixo"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Tesouro", "right": "Renda fixa"},
        {"left": "CDB", "right": "Renda fixa"},
        {"left": "LCI", "right": "Renda fixa"},
        {"left": "Retorno", "right": "Pre-determinado"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.2: O que e Renda Variavel?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 2, '8.2 O que e Renda Variavel?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Renda Variavel",
      "body": "Renda variavel e investimento sem retorno pre-determinado. O preco sobe ou cai conforme mercado. Exemplos: acoes, FIIs, ETFs, cryptos. Risco maior, potencial de retorno maior.",
      "emoji": "📈"
    },
    {
      "type": "example",
      "title": "Acoes",
      "body": "Voce compra acao por R$ 100. Um ano depois, pode valer R$ 150 (alta 50%) ou R$ 80 (queda 20%). O retorno nao e pre-determinado: varia conforme a empresa e o mercado.",
      "highlight": "Retorno varia com mercado!",
      "emoji": "🎢"
    },
    {
      "type": "activity",
      "question": "Qual e o risco da renda variavel?",
      "options": ["Nao tem risco", "Pode perder dinheiro", "Retorno garantido", "Sem oscilacao"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Renda variavel nao tem retorno pre-determinado.",
      "correct": true,
      "explanation": "Retorno varia com mercado."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Acoes sao um exemplo de renda ___.",
      "answer": "variavel",
      "hint": "Oposto de fixa",
      "explanation": "Renda variavel = retorno incerto"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Acoes", "right": "Renda variavel"},
        {"left": "FIIs", "right": "Renda variavel"},
        {"left": "ETFs", "right": "Renda variavel"},
        {"left": "Risco", "right": "Maior que fixa"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.3: Selic e CDI - Por que Importam?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 3, '8.3 Selic e CDI - Por que Importam?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Selic e CDI",
      "body": "Selic e a taxa basica de juros do Brasil (definida pelo Banco Central). CDI e a taxa que bancos usam entre si. A maioria dos investimentos de renda fixa usa essas taxas como referencia.",
      "emoji": "🏦"
    },
    {
      "type": "example",
      "title": "Tesouro Selic",
      "body": "Selic esta em 10,5% ao ano. Tesouro Selic paga Selic + 0% = ~10,5%. CDB pos usa CDI (~10,5%). Se Selic sobe, seu investimento sobe junto.",
      "highlight": "Selic = referencia do Brasil!",
      "emoji": "📊"
    },
    {
      "type": "activity",
      "question": "O que e a Selic?",
      "options": ["Taxa de cambio", "Taxa basica de juros", "Taxa de inflacao", "Taxa de desemprego"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "A maioria dos investimentos de renda fixa usa Selic ou CDI como referencia.",
      "correct": true,
      "explanation": "Sao as taxas-base."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "CDI e a taxa que os ___ usam entre si.",
      "answer": "bancos",
      "hint": "Instituicoes financeiras",
      "explanation": "Taxa interbancaria"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Selic", "right": "Taxa basica"},
        {"left": "CDI", "right": "Taxa interbancaria"},
        {"left": "BC", "right": "Define Selic"},
        {"left": "10%", "right": "Exemplo de taxa"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.4: Comparativo de Rentabilidade Historica
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 4, '8.4 Comparativo de Rentabilidade Historica', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Rentabilidade Historica",
      "body": "Historicamente: Tesouro Selic rendeu ~10% ao ano (media). Acoes (IBOV) renderam ~12-15% ao ano no longo prazo. Acoes tem mais retorno, mas mais volatilidade.",
      "emoji": "📊"
    },
    {
      "type": "example",
      "title": "Comparativo 10 anos",
      "body": "De 2013-2023: Selic media ~10%/ano. IBOV media ~12%/ano (com alta volatilidade). Em alguns anos, IBOV superou muito; em outros, caiu. Cada um tem seu momento.",
      "highlight": "Acoes rendem mais no longo prazo!",
      "emoji": "⏳"
    },
    {
      "type": "activity",
      "question": "Qual investimento teve maior media historica de retorno no Brasil?",
      "options": ["Tesouro Selic", "Acoes (IBOV)", "CDB", "LCI"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Acoes tem maior potencial de retorno, mas tambem maior volatilidade.",
      "correct": true,
      "explanation": "Trade-off: risco vs retorno."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "No ___ prazo, acoes tendem a superar a renda fixa.",
      "answer": "longo",
      "hint": "Oposto de curto",
      "explanation": "Longo prazo = 5-10+ anos"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Selic ~10%", "right": "Media historica"},
        {"left": "IBOV ~12%", "right": "Media historica"},
        {"left": "Volatilidade", "right": "Maior em acoes"},
        {"left": "Risco", "right": "Maior em variavel"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.5: Quando Cada um Faz Sentido?
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 5, '8.5 Quando Cada um Faz Sentido?', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Quando Usar Cada Um",
      "body": "Renda fixa: curto prazo, emergencia, objetivos proximos. Renda variavel: longo prazo, construir patrimonio, aposentadoria. A combinacao dos dois e ideal para maioria.",
      "emoji": "⚖️"
    },
    {
      "type": "example",
      "title": "Exemplo: Planejador",
      "body": "Joao: 30 anos, Tesouro de 50k/ano. Reserva emergencia: R$ 20k em Tesouro (liquido). Aposentadoria: R$ 200k em acoes/FIIs (longo). Cada dinheiro tem seu proposito.",
      "highlight": "Cada objetivo = investimento diferente!",
      "emoji": "🎯"
    },
    {
      "type": "activity",
      "question": "Para reserva de emergencia, qual melhor opcao?",
      "options": ["Acoes", "Criptomoedas", "Tesouro Selic", "Small caps"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "Curto prazo usa renda fixa, longo prazo pode usar variavel.",
      "correct": true,
      "explanation": "Horizonte = escolha de investimento."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Para objetivos de ___ prazo, renda variavel faz mais sentido.",
      "answer": "longo",
      "hint": "Oposto de curto",
      "explanation": "Longo prazo = tempo para recuperaçao"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Curto prazo", "right": "Renda fixa"},
        {"left": "Longo prazo", "right": "Renda variavel"},
        {"left": "Emergencia", "right": "Fixa"},
        {"left": "Aposentadoria", "right": "Variavel"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.6: Pode ter os Dois? (Sim!)
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 6, '8.6 Pode ter os Dois? (Sim!)', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Pode Ter os Dois",
      "body": "Sim! A maioria dos investidores deve ter os dois. Renda fixa para seguranca e objetivos courts. Renda variavel para crescimento. A proporcao varia por perfil e idade.",
      "emoji": "✅"
    },
    {
      "type": "example",
      "title": "Carteira Hibrida",
      "body": "Joao, 30 anos: 70% acoes (crescimento) + 20% FIIs (renda) + 10% Tesouro (seguranca). Maria, 50 anos: 40% acoes + 40% FIIs + 20% Tesouro. Cada um com sua proporcao.",
      "highlight": "Mistura = equilibrio!",
      "emoji": "🎨"
    },
    {
      "type": "activity",
      "question": "E recomendado ter tanto renda fixa quanto variavel?",
      "options": ["Nao, so fixa", "Nao, so variavel", "Sim, combinacao", "Depende do banco"],
      "correct": 2
    },
    {
      "type": "true_false",
      "statement": "Carteira diversificada inclui ambos os tipos de renda.",
      "correct": true,
      "explanation": "Diversificacao = equilibrio."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "A combinacao de fixa e variavel se chama carteira ___.",
      "answer": "hibrida",
      "hint": "Palavra de 7 letras",
      "explanation": "Hibrida = mista"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Seguranca", "right": "Renda fixa"},
        {"left": "Crescimento", "right": "Renda variavel"},
        {"left": "Proporcao", "right": "Por perfil e idade"},
        {"left": "Equilibrio", "right": "Mistura ideal"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.7: A Armadilha de So Ficar na Renda Fixa
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 7, '8.7 A Armadilha de So Ficar na Renda Fixa', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Armadilha da Renda Fixa",
      "body": "Ficar so em renda fixa tem riscos: retorno menor que inflacao (perda real), imposto mais alto (ate 22,5%), oportunidades perdidas de crescimento. No longo prazo, pode nao Alcançar objetivos.",
      "emoji": "⚠️"
    },
    {
      "type": "example",
      "title": "Exemplo: Perda Real",
      "body": "Voce investe R$ 100k em Tesouro (10% ao ano = R$ 10k). Mas Inflacao = 12%. Seu retorno real = -2%. Voce perdeu dinheiro em termos reais. Parece que INVESTE, mas nao cresce.",
      "highlight": "Atencao a inflacao!",
      "emoji": "📉"
    },
    {
      "type": "activity",
      "question": "Qual e o risco de ficar so em renda fixa?",
      "options": ["Perder tudo", "Ter retorno menor que inflacao", "Nao ter imposto", "Ganhar muito"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Renda fixa pode render menos que a inflacao.",
      "correct": true,
      "explanation": "Perda real = perigo."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Retorno menor queinflacao significa perda ___.",
      "answer": "real",
      "hint": "Oposto de nominal",
      "explanation": "Perda real = poder de compra"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Renda fixa", "right": "Pode perder para inflacao"},
        {"left": "Imposto", "right": "Ate 22,5%"},
        {"left": "Inflacao", "right": "Inimigo invisivel"},
        {"left": "Crescimento", "right": "Fica comprometido"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.8: A Armadilha de So Ficar na Renda Variavel
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 8, '8.8 A Armadilha de So Ficar na Renda Variavel', 25, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Armadilha da Renda Variavel",
      "body": "Ficar so em renda variavel tem riscos: volatilidade causa panico e vendas erradas, sem seguranca para emergencias, drawdowns podem passar de 50%. Sem equilibrio, voce pode quebrar emocionalmente.",
      "emoji": "⚠️"
    },
    {
      "type": "example",
      "title": "Exemplo: Panico",
      "body": "Em 2022, acoes caram 20%. Joao vendeu tudo em panico. Perdeu 20%. Em 2023, mercado subiu 15%. Joao ficou de fora. Sem renda fixa = sem estabilidade emocional.",
      "highlight": "Sem equilibrio = panico!",
      "emoji": "😱"
    },
    {
      "type": "activity",
      "question": "Qual e o risco de ficar so em renda variavel?",
      "options": ["Nao pagar imposto", "Volatilidade e panico", "Retorno garantido", "Sem risco"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Alta volatilidade pode levar a vendas por panico.",
      "correct": true,
      "explanation": "Fator emocional = inimigo."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "Vender em panico durante quedas se叫做 ___ emocional.",
      "answer": "panico",
      "hint": "Medo de perder",
      "explanation": "Panico = reaçao ao medo"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "Volatilidade", "right": "Oscilacao"},
        {"left": "Drawdown", "right": "Queda maxima"},
        {"left": "Venda", "right": "Por panico"},
        {"left": "Seguranca", "right": "Falta em variavel"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.9: Quiz Final do Nivel 1
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 9, '8.9 Quiz Final do Nivel 1', 50, true, $$
{
  "questions": [
    {
      "question": "Renda fixa tem retorno:",
      "options": ["Variavel", "Pre-determinado", "Aleatorio", "Indefinido"],
      "correct": 1
    },
    {
      "question": "Renda variavel inclui:",
      "options": ["Tesouro", "CDB", "Acoes", "LCI"],
      "correct": 2
    },
    {
      "question": "Qual e a taxa basica de juros do Brasil?",
      "options": ["CDI", "Selic", "IPCA", "TR"],
      "correct": 1
    },
    {
      "question": "Historicamente, qual teve maior retorno?",
      "options": ["Tesouro Selic", "Acoes", "CDB", "LCI"],
      "correct": 1
    },
    {
      "question": "Para reserva de emergencia, melhor usar:",
      "options": ["Acoes", "Renda fixa", "Criptomoedas", "Small caps"],
      "correct": 1
    },
    {
      "question": "Risco de so usar renda fixa:",
      "options": ["Alta volatilidade", "Perda real", "Mais seguranca", "Sempre ganha"],
      "correct": 1
    },
    {
      "question": "Risco de so usar renda variavel:",
      "options": ["Retorno garantido", "Panico em quedas", "Sem imposto", "Baixo risco"],
      "correct": 1
    },
    {
      "question": "CDI e a taxa entre:",
      "options": ["Governo e cidadao", "Bancos", "Empresa e funcionario", "Investidor e bolsa"],
      "correct": 1
    },
    {
      "question": "Carteira hibrida combina:",
      "options": ["Apenas fixa", "Apenas variavel", "Fixa e variavel", "Nenhuma"],
      "correct": 2
    },
    {
      "question": "Para longo prazo, ideal:",
      "options": ["Apenas fixa", "Apenas variavel", "Mix proporcional", "Dinheiro em casa"],
      "correct": 2
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;

-- Lesson 8.10: Conquista: Investidor Iniciante
INSERT INTO public.lessons (id, section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(gen_random_uuid(), 8, 'Renda Fixa vs Variavel', 10, '8.10 Conquista: Investidor Iniciante', 100, false, $$
{
  "steps": [
    {
      "type": "explanation",
      "title": "Parabens!",
      "body": "Voce completou o Nivel 1 do Finlingo! Agora entende: tipos de investimento, risco e retorno, como investir, mercado financeiro, indices, e a diferenca entre renda fixa e variavel. Voce esta pronto para comecar!",
      "emoji": "🎉"
    },
    {
      "type": "example",
      "title": "Proximos Passos",
      "body": "Agora e hora de aplicar! 1) Abra conta em corretora. 2) Monte sua reserva de emergencia (renda fixa). 3) Comece a investir em FIIs ou ETFs. 4) Continue aprendendo no Nivel 2.",
      "highlight": "Voce esta pronto para investir!",
      "emoji": "🚀"
    },
    {
      "type": "activity",
      "question": "Qual e o proximo passo apos completar o nivel 1?",
      "options": ["Parar de estudar", "Abrir conta e investir", "Esperar mais", "Guardar dinheiro em casa"],
      "correct": 1
    },
    {
      "type": "true_false",
      "statement": "Voce esta preparado para comecar a investir.",
      "correct": true,
      "explanation": "Conhecimento = poder."
    },
    {
      "type": "fill_in_the_blank",
      "sentence": "O primeiro investimento deve ser para reserva ___.",
      "answer": "emergencia",
      "hint": "Para imprevistos",
      "explanation": "Reserva de emergencia = prioridade"
    },
    {
      "type": "match_pairs",
      "pairs": [
        {"left": "FinLingo", "right": "Nivel 1 completo"},
        {"left": "Corretora", "right": "Proximo passo"},
        {"left": "Reserva", "right": "Primeiro objetivo"},
        {"left": "Nivel 2", "right": "Proximo nivel"}
      ]
    }
  ]
}
$$)
ON CONFLICT DO NOTHING;