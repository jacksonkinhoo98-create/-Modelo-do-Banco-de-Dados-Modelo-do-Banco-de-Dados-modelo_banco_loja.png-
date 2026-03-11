-- Criando o banco de dados
CREATE DATABASE loja_online;

-- Usando o banco
USE loja_online;

-- Tabela de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de produtos
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Em processamento',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabela de itens do pedido
CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserindo alguns dados de exemplo
INSERT INTO clientes (nome, email, telefone, endereco)
VALUES
('João Silva', 'joao@email.com', '11999999999', 'São Paulo'),
('Maria Souza', 'maria@email.com', '11888888888', 'Rio de Janeiro');

INSERT INTO produtos (nome_produto, descricao, preco, estoque)
VALUES
('Notebook', 'Notebook i5 8GB RAM', 3500.00, 10),
('Mouse Gamer', 'Mouse RGB 7200dpi', 150.00, 50),
('Teclado Mecânico', 'Teclado com switch blue', 300.00, 20);

INSERT INTO pedidos (id_cliente, status)
VALUES
(1, 'Enviado'),
(2, 'Em processamento');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES
(1, 1, 1, 3500.00),
(1, 2, 1, 150.00),
(2, 3, 1, 300.00);
