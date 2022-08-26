USE dogaodb;

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

-- v
INSERT INTO clientes (nome, nascimento) VALUES 
('Ana Maria Braga', '1949-04-01');

INSERT INTO pedidos (cliente_id, estado_id, data_hora) VALUES
(1, 2, '2022-08-26 17:50:00');

INSERT INTO cachorro_quentes (pedidos_numero) VALUES
(1),
(1);

INSERT INTO cachorro_quente_ingrediente (cachorro_quente_id, ingrediente_cod) VALUES
/*1º cachorro_quente*/
(1, 1),
(1, 2),
(1, 6),
(1, 8),
/*2º cachorro_quente*/
(2, 3),
(2, 7),
(2, 9);

INSERT INTO pedido_produto (pedido_numero, produto_cod, quantidade) VALUES
(1, 1, 2),
(1, 2, 1);

-- vi
INSERT INTO clientes (nome, nascimento) VALUES 
('Raul Seixas', '1945-06-28');

INSERT INTO pedidos (cliente_id, estado_id, data_hora) VALUES
(2, 1, '2022-08-26 18:10:00');

INSERT INTO cachorro_quentes (pedido_numero) VALUES 
(3);

INSERT INTO cachorro_quente_ingrediente (cachorro_quente_id, ingrediente_cod) VALUES
(5, 4),
(5, 3),
(5, 5),
(5, 8);

INSERT INTO pedido_produto (pedido_numero, produto_cod, quantidade) VALUES
(3, 4, 1),
(3, 6, 1);
