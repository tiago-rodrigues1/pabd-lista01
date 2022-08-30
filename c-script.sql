USE dogaodb;

-- i
SELECT tipo_pagamento_id, tipo_pagamentos.tipo,COUNT(tipo_pagamento_id) as quant_pagamentos FROM
pedidos INNER JOIN tipo_pagamentos ON tipo_pagamento_id = tipo_pagamentos.id
GROUP BY tipo_pagamento_id;

-- ii
SELECT * FROM clientes
WHERE MONTH(nascimento) BETWEEN 3 AND 5;

-- iii
SELECT numero, nome, SUM(subtotal) as total FROM (
	SELECT numero, cliente_id, SUM(produtos.valor * quantidade) as subtotal FROM
	pedidos INNER JOIN pedido_produto ON pedido_numero = pedidos.numero
	INNER JOIN produtos ON produtos.cod = produto_cod
	GROUP BY numero
	UNION
	SELECT pedidos.numero, cliente_id, SUM(valor) as subtotal FROM 
	pedidos INNER JOIN cachorro_quentes ON pedidos_numero = pedidos.numero
	INNER JOIN cachorro_quente_ingrediente ON cachorro_quentes.id = cachorro_quente_id
	INNER JOIN ingredientes ON ingredientes.cod = ingrediente_cod
	GROUP BY numero
) as contas
INNER JOIN clientes ON clientes.id = cliente_id
GROUP BY cliente_id, numero;

-- iv
SELECT SUM(total) as total_vendas FROM (
	SELECT numero, nome, SUM(subtotal) as total FROM (
		SELECT numero, cliente_id, SUM(produtos.valor * quantidade) as subtotal FROM
		pedidos INNER JOIN pedido_produto ON pedido_numero = pedidos.numero
		INNER JOIN produtos ON produtos.cod = produto_cod
		GROUP BY numero
		UNION
		SELECT pedidos.numero, cliente_id, SUM(valor) as subtotal FROM 
		pedidos INNER JOIN cachorro_quentes ON pedidos_numero = pedidos.numero
		INNER JOIN cachorro_quente_ingrediente ON cachorro_quentes.id = cachorro_quente_id
		INNER JOIN ingredientes ON ingredientes.cod = ingrediente_cod
		GROUP BY numero
	) as contas
	INNER JOIN clientes ON clientes.id = cliente_id
	GROUP BY cliente_id, numero
) as lucro;

