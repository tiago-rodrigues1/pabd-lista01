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

INSERT INTO cachorro_quentes (pedidos_numero) VALUES 
(2);

INSERT INTO cachorro_quente_ingrediente (cachorro_quente_id, ingrediente_cod) VALUES
(2, 4),
(2, 3),
(2, 5),
(2, 8);

INSERT INTO pedido_produto (pedido_numero, produto_cod, quantidade) VALUES
(2, 4, 1),
(2, 6, 1);

-- vii
UPDATE pedidos 
SET estado_id = 3 
WHERE cliente_id = 1;

UPDATE pedidos
SET estado_id = 2
WHERE cliente_id = 2;

-- viii
INSERT INTO clientes (nome, nascimento) VALUES 
('Fausto Silva', '1950-05-02');

INSERT INTO pedidos (cliente_id, estado_id, data_hora) VALUES
(3, 1, '2022-08-26 19:20:00');

INSERT INTO cachorro_quentes (pedidos_numero) VALUES
(3),
(3);

INSERT INTO cachorro_quente_ingrediente (cachorro_quente_id, ingrediente_cod) VALUES
/*1º cachorro_quente*/
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
/*2º cachorro_quente*/
(5, 2),
(5, 4),
(5, 6),
(5, 8),
(5, 9);

INSERT INTO pedido_produto (pedido_numero, produto_cod, quantidade) VALUES
(3, 3, 2),
(3, 5 ,1);

-- ix
UPDATE pedidos
SET estado_id = 3
WHERE cliente_id = 2;

UPDATE pedidos
SET estado_id = 2
WHERE cliente_id = 3;

-- x
SELECT cliente_id, nome, SUM(subtotal)
FROM (
	SELECT cliente_id, SUM(valor * quantidade) as subtotal FROM
	pedidos INNER JOIN pedido_produto ON pedidos.numero = pedido_produto.pedido_numero
	INNER JOIN produtos ON produtos.cod = produto_cod 
	GROUP BY cliente_id
	UNION
	SELECT cliente_id, SUM(valor) as subtotal FROM
	pedidos INNER JOIN cachorro_quentes ON cachorro_quentes.pedidos_numero = pedidos.numero
	INNER JOIN cachorro_quente_ingrediente ON cachorro_quentes.id = cachorro_quente_id
	INNER JOIN ingredientes ON ingredientes.cod = ingrediente_cod
	GROUP BY cliente_id
) as cliente_conta
INNER JOIN clientes ON clientes.id = cliente_id
WHERE clientes.id = 1
GROUP BY cliente_id

UNION

SELECT cliente_id, nome, SUM(subtotal) as valor_total
FROM (
	SELECT cliente_id, SUM(valor * quantidade) as subtotal FROM
	pedidos INNER JOIN pedido_produto ON pedidos.numero = pedido_produto.pedido_numero
	INNER JOIN produtos ON produtos.cod = produto_cod 
	GROUP BY cliente_id
	UNION
	SELECT cliente_id, SUM(valor) as subtotal FROM
	pedidos INNER JOIN cachorro_quentes ON cachorro_quentes.pedidos_numero = pedidos.numero
	INNER JOIN cachorro_quente_ingrediente ON cachorro_quentes.id = cachorro_quente_id
	INNER JOIN ingredientes ON ingredientes.cod = ingrediente_cod
	GROUP BY cliente_id
) as cliente_conta
INNER JOIN clientes ON clientes.id = cliente_id
WHERE clientes.id = 2
GROUP BY cliente_id;

UPDATE pedidos
SET tipo_pagamento_id = 3
WHERE cliente_id = 1;

UPDATE pedidos
SET tipo_pagamento_id = 2
WHERE cliente_id = 2;

-- xi
SELECT cliente_id, nome, SUM(subtotal) as valor_total
FROM (
	SELECT cliente_id, SUM(valor * quantidade) as subtotal FROM
	pedidos INNER JOIN pedido_produto ON pedidos.numero = pedido_produto.pedido_numero
	INNER JOIN produtos ON produtos.cod = produto_cod 
	GROUP BY cliente_id
	UNION
	SELECT cliente_id, SUM(valor) as subtotal FROM
	pedidos INNER JOIN cachorro_quentes ON cachorro_quentes.pedidos_numero = pedidos.numero
	INNER JOIN cachorro_quente_ingrediente ON cachorro_quentes.id = cachorro_quente_id
	INNER JOIN ingredientes ON ingredientes.cod = ingrediente_cod
	GROUP BY cliente_id
) as cliente_conta
INNER JOIN clientes ON clientes.id = cliente_id
WHERE clientes.id = 3
GROUP BY cliente_id;

UPDATE pedidos
SET tipo_pagamento_id = 2
WHERE cliente_id = 3;
