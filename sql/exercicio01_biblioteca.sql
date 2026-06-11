
CREATE DATABASE IF NOT EXISTS biblioteca;


USE biblioteca;

CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE Editoras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50)
);

CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    autor_id INT,
    editora_id INT,
    FOREIGN KEY (autor_id) REFERENCES Autores(id),
    FOREIGN KEY (editora_id) REFERENCES Editoras(id)
);

-- 5 autores
INSERT INTO Autores (nome, nacionalidade) VALUES
('Machado de Assis', 'Brasileira'),
('Clarice Lispector', 'Brasileira'),
('George Orwell', 'Britânica'),
('Gabriel García Márquez', 'Colombiana'),
('Jane Austen', 'Britânica');

-- 3 editoras
INSERT INTO Editoras (nome, cidade) VALUES
('Companhia das Letras', 'São Paulo'),
('Editora Record', 'Rio de Janeiro'),
('Penguin Books', 'Londres');

-- 10 livros
INSERT INTO Livros (titulo, ano_publicacao, autor_id, editora_id) VALUES
('Dom Casmurro', 1899, 1, 1),
('Memórias Póstumas de Brás Cubas', 1881, 1, 2),
('A Hora da Estrela', 1977, 2, 1),
('A Paixão Segundo G.H.', 1964, 2, 1),
('1984', 1949, 3, 3),
('A Revolução dos Bichos', 1945, 3, 3),
('Cem Anos de Solidão', 1967, 4, 2),
('O Amor nos Tempos do Cólera', 1985, 4, 2),
('Orgulho e Preconceito', 1813, 5, 3),
('Emma', 1815, 5, 3);

SELECT
    Livros.titulo,
    Livros.ano_publicacao,
    Autores.nome AS autor,
    Editoras.nome AS editora
FROM Livros
INNER JOIN Autores ON Livros.autor_id = Autores.id
INNER JOIN Editoras ON Livros.editora_id = Editoras.id;
