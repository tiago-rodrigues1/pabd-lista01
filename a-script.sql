CREATE DATABASE dogaodb;

USE dogaodb;

CREATE TABLE clientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nascimento DATE NOT NULL
);

CREATE TABLE estados (
	id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_pagamentos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE pedidos (
	numero INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    estado_id INT NOT NULL,
    tipo_pagamento_id INT,
    data_hora DATETIME NOT NULL,
    
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (estado_id) REFERENCES estados(id),
    FOREIGN KEY (tipo_pagamento_id) REFERENCES tipo_pagamentos(id)
);

CREATE TABLE ingredientes (
	cod INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor FLOAT NOT NULL
);

CREATE TABLE cachorro_quentes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_numero INT NOT NULL,
    
    FOREIGN KEY (pedido_numero) REFERENCES pedidos(numero)
);

CREATE TABLE cachorro_quente_ingrediente (
	id INT AUTO_INCREMENT PRIMARY KEY,
    cachorro_quente_id INT NOT NULL,
    ingrediente_cod INT UNSIGNED NOT NULL,
    
    FOREIGN KEY (cachorro_quente_id) REFERENCES cachorro_quentes(id),
    FOREIGN KEY (ingrediente_cod) REFERENCES ingredientes(cod)
);

CREATE TABLE produtos (
	cod INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    valor FLOAT NOT NULL
);

CREATE TABLE pedido_produto (
	id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_numero INT NOT NULL,
    produto_cod INT NOT NULL,
    quantidade INT NOT NULL,
    
    FOREIGN KEY (pedido_numero) REFERENCES pedidos(numero),
    FOREIGN KEY (produto_cod) REFERENCES produtos(cod)
);
