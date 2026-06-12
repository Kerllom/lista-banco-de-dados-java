CREATE DATABASE IF NOT EXISTS restaurante;
USE restaurante;

CREATE TABLE Pratos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2)
);

CREATE TABLE Ingredientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    unidade_medida VARCHAR(20)
);

-- Tabela de junção: resolve o muitos-para-muitos entre Pratos e Ingredientes.
-- Guarda também a quantidade necessária de cada ingrediente no prato.
CREATE TABLE Receitas (
    prato_id INT,
    ingrediente_id INT,
    quantidade_necessaria DECIMAL(10,2),
    PRIMARY KEY (prato_id, ingrediente_id),
    FOREIGN KEY (prato_id) REFERENCES Pratos(id),
    FOREIGN KEY (ingrediente_id) REFERENCES Ingredientes(id)
);

INSERT INTO Pratos (nome, descricao, preco) VALUES
('Macarrao a Bolonhesa', 'Massa com molho de carne', 35.00),
('Salada Caesar', 'Salada com frango e molho caesar', 28.00);

INSERT INTO Ingredientes (nome, unidade_medida) VALUES
('Macarrao', 'gramas'),
('Carne moida', 'gramas'),
('Molho de tomate', 'ml'),
('Alface', 'unidade'),
('Frango', 'gramas'),
('Queijo parmesao', 'gramas');

-- Montando as receitas (qual ingrediente, em qual prato, em que quantidade)
INSERT INTO Receitas (prato_id, ingrediente_id, quantidade_necessaria) VALUES
(1, 1, 200),
(1, 2, 150),
(1, 3, 100),
(2, 4, 1),
(2, 5, 120),
(2, 6, 30);

SELECT
    I.nome AS ingrediente,
    R.quantidade_necessaria,
    I.unidade_medida
FROM Receitas R
INNER JOIN Ingredientes I ON R.ingrediente_id = I.id
WHERE R.prato_id = 1;