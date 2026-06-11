CREATE DATABASE IF NOT EXISTS loja_online;
USE loja_online;

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    status VARCHAR(30),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE ItensPedido (
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

INSERT INTO Clientes (nome, email, endereco) VALUES
('Ana Silva', 'ana@email.com', 'Rua das Flores, 100'),
('Bruno Costa', 'bruno@email.com', 'Av. Brasil, 250'),
('Carla Souza', 'carla@email.com', 'Rua Verde, 45');

INSERT INTO Produtos (nome, preco, estoque) VALUES
('Notebook', 3500.00, 10),
('Mouse', 80.00, 50),
('Teclado', 150.00, 30),
('Monitor', 900.00, 15);

INSERT INTO Pedidos (cliente_id, data_pedido, status) VALUES
(1, '2025-01-10', 'Entregue'),    -- pedido 1, da Ana
(2, '2025-01-12', 'Processando'), -- pedido 2, do Bruno
(1, '2025-01-15', 'Enviado');     -- pedido 3, da Ana de novo

-- Itens de cada pedido (aqui o muitos-para-muitos ganha vida)
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),   -- pedido 1: 1 Notebook
(1, 2, 2, 80.00),     -- pedido 1: 2 Mouses
(2, 3, 1, 150.00),    -- pedido 2: 1 Teclado
(2, 4, 1, 900.00),    -- pedido 2: 1 Monitor
(3, 2, 1, 80.00);     -- pedido 3: 1 Mouse

-- Mostra todos os pedidos da cliente Ana (id 1), com produtos e quantidades
SELECT
    Pedidos.id AS numero_pedido,
    Pedidos.data_pedido,
    Produtos.nome AS produto,
    ItensPedido.quantidade,
    ItensPedido.preco_unitario
FROM Pedidos
INNER JOIN ItensPedido ON Pedidos.id = ItensPedido.pedido_id
INNER JOIN Produtos ON ItensPedido.produto_id = Produtos.id
WHERE Pedidos.cliente_id = 1;