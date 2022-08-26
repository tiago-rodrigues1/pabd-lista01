-- i
INSERT INTO produtos (nome, valor) VALUES 
('Refrigerante Lata', 5),
('Água Mineral', 2),
('Suco Natural', 3),
('Suco Natural (com leite)', 3.5),
('Doce de Leite', 2.5),
('Mousse de Maracujá', 3),
('Serenata do Amor', 0.75);

-- ii
INSERT INTO ingredientes (nome, valor) VALUES
('Salsicha', 0.30),
('Carne Moída', 0.25),
('Frango Desfiado', 0.40),
('Filé Trinchado', 0.75),
('Queijo Ralado', 0.15),
('Queijo Derretido (Prato)', 0.20),
('Cream Cheese', 0.45),
('Vinagrete', 0.20),
('Ervilha e Milho Verde', 0.15);

-- iii
INSERT INTO tipo_pagamentos (tipo) VALUES
('Débito'),
('Crédito'),
('Dinheiro');

-- iv
INSERT INTO estados (descricao) VALUES
('Pedido Realizado'),
('Prato em Execução'),
('Pronto');