-- Lições iniciais do FinLingo
-- Execute no SQL Editor do Supabase

-- Seção 1: Basics de Finanças
INSERT INTO public.lessons (section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(1, ' Básicos', 1, ' O que são investimentos?', 10, false, '[
  {
    "type": "info",
    "content": "Investimento é colocar seu dinheiro para trabalhar e render mais dinheiro!"
  },
  {
    "type": "quiz",
    "question": "O que é investimento?",
    "options": [
      {"text": "Gastar dinheiro em coisas que quer", "correct": false},
      {"text": "Fazer o dinheiro render mais", "correct": true},
      {"text": "Guardar dinheiro em casa", "correct": false},
      {"text": "Pagar contas", "correct": false}
    ]
  },
  {
    "type": "info",
    "content": "Investir é diferente de guardar - investir faz seu dinheiro grow!"
  }
]'),
(1, ' Básicos', 2, ' Por que investir?', 10, false, '[
  {
    "type": "info",
    "content": "Porque guardando dinheiro você perde valor com a inflação!"
  },
  {
    "type": "quiz",
    "question": "Por que NÃO guardar dinheiro embaixo do colchão?",
    "options": [
      {"text": "É perigoso", "correct": false},
      {"text": "Perde valor com inflación", "correct": true},
      {"text": "É ilegal", "correct": false},
      {"text": "Não dá pra dormir", "correct": false}
    ]
  }
]'),
(1, ' Básicos', 3, ' Tipos de investimento', 15, false, '[
  {
    "type": "info",
    "content": "Existem vários tipos: renda fixa, variável, imóveis, etc."
  },
  {
    "type": "quiz",
    "question": "Qual é ejemplo de renda fixa?",
    "options": [
      {"text": "Ações", "correct": false},
      {"text": "CDB", "correct": true},
      {"text": "Criptomoedas", "correct": false},
      {"text": "Startups", "correct": false}
    ]
  }
]');

-- Seção 2: Ações
INSERT INTO public.lessons (section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(2, ' Ações', 1, ' O que é uma ação?', 10, false, '[
  {
    "type": "info",
    "content": "Ação é um pedacinho de uma empresa que você pode comprar!"
  },
  {
    "type": "quiz",
    "question": "O que é uma ação?",
    "options": [
      {"text": "Dívida com banco", "correct": false},
      {"text": "Parte de uma empresa", "correct": true},
      {"text": "Tipo de investimento fixo", "correct": false},
      {"text": "Empréstimo", "correct": false}
    ]
  }
]'),
(2, ' Ações', 2, ' Como comprar ações?', 10, false, '[
  {
    "type": "info",
    "content": "Você precisa de uma corretora para comprar ações na bolsa."
  },
  {
    "type": "quiz",
    "question": "Onde se compra ações?",
    "options": [
      {"text": "No banco comum", "correct": false},
      {"text": "Na bolsa de valores", "correct": true},
      {"text": "No supermercado", "correct": false},
      {"text": "Em bitcoin", "correct": false}
    ]
  }
]');

-- Seção 3: Riscos
INSERT INTO public.lessons (section_id, section_title, lesson_number, title, xp_reward, is_quiz, activity_data) VALUES
(3, ' Riscos', 1, ' O que é risco?', 10, false, '[
  {
    "type": "info",
    "content": "Risco é a chance de perder dinheiro! Mas também pode ser chance de ganar!"
  },
  {
    "type": "quiz",
    "question": "Alto risco significa:",
    "options": [
      {"text": "Vai ganhar pouco", "correct": false},
      {"text": "Pode ganhar muito OU perder muito", "correct": true},
      {"text": "Não vai perder nada", "correct": false},
      {"text": "É garantido", "correct": false}
    ]
  }
]'),
(3, ' Riscos', 2, ' Diversificação', 15, false, '[
  {
    "type": "info",
    "content": "Não coloque todos os ovos na mesma cesta! Diversifique!"
  },
  {
    "type": "quiz",
    "question": "Por que diversificar?",
    "options": [
      {"text": "Para perder mais", "correct": false},
      {"text": "Para reduzir risco", "correct": true},
      {"text": "Para pagar menos taxas", "correct": false},
      {"text": "É obrigatório", "correct": false}
    ]
  }
]');