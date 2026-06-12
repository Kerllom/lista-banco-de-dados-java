CREATE DATABASE IF NOT EXISTS blog;
USE blog;

-- Posts do blog
CREATE TABLE Posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    conteudo TEXT,
    data_publicacao DATE
);

-- Categorias
CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Comentários (1:N com Posts: um post tem vários comentários)
CREATE TABLE Comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    autor VARCHAR(100),
    conteudo TEXT,
    data_comentario DATE,
    FOREIGN KEY (post_id) REFERENCES Posts(id)
);

-- Tabela de junção: resolve o muitos-para-muitos entre Posts e Categorias
CREATE TABLE PostCategorias (
    post_id INT,
    categoria_id INT,
    PRIMARY KEY (post_id, categoria_id),
    FOREIGN KEY (post_id) REFERENCES Posts(id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

-- Dados de exemplo
INSERT INTO Posts (titulo, conteudo, data_publicacao) VALUES
('Introdução ao Java', 'Conteúdo sobre Java...', '2025-01-10'),
('Bancos de Dados na Prática', 'Conteúdo sobre SQL...', '2025-01-15'),
('Dicas de Carreira em TI', 'Conteúdo sobre carreira...', '2025-01-20');

INSERT INTO Categorias (nome) VALUES
('Programação'),
('Banco de Dados'),
('Carreira');

-- Associando posts a categorias (um post pode ter mais de uma)
INSERT INTO PostCategorias (post_id, categoria_id) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 3);

INSERT INTO Comentarios (post_id, autor, conteudo, data_comentario) VALUES
(1, 'Ana', 'Ótimo post!', '2025-01-11'),
(1, 'Bruno', 'Me ajudou muito', '2025-01-12'),
(2, 'Carla', 'Muito claro', '2025-01-16'),
(1, 'Diego', 'Top demais', '2025-01-13');

-- Consulta: posts de uma categoria, com a CONTAGEM de comentários
-- LEFT JOIN nos comentários para incluir posts mesmo com 0 comentários.
-- COUNT conta os comentários; GROUP BY agrupa por post para a contagem
-- ser feita post a post.
SELECT
    Posts.titulo,
    COUNT(Comentarios.id) AS total_comentarios
FROM Posts
INNER JOIN PostCategorias ON Posts.id = PostCategorias.post_id
LEFT JOIN Comentarios ON Posts.id = Comentarios.post_id
WHERE PostCategorias.categoria_id = 1
GROUP BY Posts.id, Posts.titulo;