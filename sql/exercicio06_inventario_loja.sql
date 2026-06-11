CREATE DATABASE IF NOT EXISTS inventario_loja;
USE inventario_loja;

CREATE TABLE Fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco_compra DECIMAL(10,2),
    preco_venda DECIMAL(10,2),
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(id)
);

CREATE TABLE TransacoesEstoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    tipo_transacao ENUM('entrada', 'saida'),
    quantidade INT,
    data_transacao DATE,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

INSERT INTO Fornecedores (nome, contato, telefone) VALUES
('TechSupply', 'João', '11999990000'),
('InfoParts', 'Maria', '11888880000');

INSERT INTO Produtos (nome, descricao, preco_compra, preco_venda, fornecedor_id) VALUES
('Notebook', 'Notebook 15 polegadas', 40.00, 80.00, 2),
('Teclado', 'Teclado mecânico', 90.00, 150.00, 2);

INSERT INTO  TransacoesEstoque (produto_id, tipo_transacao, quantidade, data_transacao) VALUES
(1, 'entrada', 10, '2025-01-05'),
(1, 'saida', 3, '2025-01-10'),
(2, 'entrada', 50, '2025-01-05'),
(2, 'saida', 12, '2025-01-11'),
(3, 'entrada', 30, '2025-01-06'),
(3, 'saida', 5, '2025-01-12');

SELECT
    Produtos.nome,
    COALESCE(SUM(
        CASE
            WHEN TransacoesEstoque.tipo_transacao = 'entrada' THEN TransacoesEstoque.quantidade
            WHEN TransacoesEstoque.tipo_transacao = 'saida'   THEN -TransacoesEstoque.quantidade
        END
    ), 0) AS estoque_atual
FROM Produtos
LEFT JOIN TransacoesEstoque ON Produtos.id = TransacoesEstoque.produto_id
GROUP BY Produtos.id, Produtos.nome;