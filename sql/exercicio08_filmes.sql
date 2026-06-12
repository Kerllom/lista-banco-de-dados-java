CREATE DATABASE IF NOT EXISTS avaliacao_filmes;
USE avaliacao_filmes;

CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Filmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_lancamento INT,
    diretor VARCHAR(100),
    genero VARCHAR(50)
);

-- Avaliações: liga usuário e filme, guardando a nota e o comentário.
-- nota é DECIMAL(3,1): até 3 dígitos no total, 1 casa decimal (ex.: 9.5)
CREATE TABLE Avaliacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    filme_id INT,
    nota DECIMAL(3,1),
    comentario TEXT,
    data_avaliacao DATE,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (filme_id) REFERENCES Filmes(id)
);

-- Dados de exemplo
INSERT INTO Usuarios (nome, email) VALUES
('Ana Silva', 'ana@email.com'),
('Bruno Costa', 'bruno@email.com'),
('Carla Souza', 'carla@email.com');

INSERT INTO Filmes (titulo, ano_lancamento, diretor, genero) VALUES
('A Origem', 2010, 'Christopher Nolan', 'Ficcao Cientifica'),
('Cidade de Deus', 2002, 'Fernando Meirelles', 'Drama');

INSERT INTO Avaliacoes (usuario_id, filme_id, nota, comentario, data_avaliacao) VALUES
(1, 1, 9.5, 'Excelente, roteiro genial', '2025-01-10'),
(2, 1, 8.0, 'Muito bom, mas complexo', '2025-01-11'),
(3, 1, 9.0, 'Impressionante', '2025-01-12'),
(1, 2, 10.0, 'Obra-prima brasileira', '2025-01-13'),
(2, 2, 9.5, 'Forte e realista', '2025-01-14');

-- Consulta 1: média de avaliação de um filme
-- AVG calcula a média das notas; COUNT conta quantas avaliações há.
-- GROUP BY agrupa por filme para a média ser feita filme a filme.
SELECT
     F.titulo,
     AVG(A.nota) AS media_nota,
     COUNT(A.id) AS total_avaliacoes
 FROM Filmes F
 INNER JOIN Avaliacoes A ON F.id = A.filme_id
 WHERE F.id = 1
 GROUP BY F.id, F.titulo;

-- Consulta 2: todos os comentários de um filme
SELECT
    U.nome AS usuario,
    A.nota,
    A.comentario
FROM Avaliacoes A
INNER JOIN Usuarios U ON A.usuario_id = U.id
WHERE A.filme_id = 1;