CREATE DATABASE IF NOT EXISTS plataforma_cursos;
USE plataforma_cursos;

CREATE TABLE Alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    instrutor VARCHAR(100)
);

-- Tabela de junção: resolve o muitos-para-muitos.
-- Um aluno faz vários cursos; um curso tem vários alunos.
CREATE TABLE Matriculas (
    aluno_id INT,
    curso_id INT,
    data_matricula DATE,
    status VARCHAR(30),
    PRIMARY KEY (aluno_id, curso_id),   -- chave composta
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- Dados de exemplo
INSERT INTO Alunos (nome, email) VALUES
('Ana Silva', 'ana@email.com'),
('Bruno Costa', 'bruno@email.com'),
('Carla Souza', 'carla@email.com');

INSERT INTO Cursos (titulo, descricao, instrutor) VALUES
('Java Básico', 'Introdução à linguagem Java', 'Prof. Pedro'),
('Banco de Dados', 'Modelagem e SQL', 'Prof. Marta'),
('Git e GitHub', 'Versionamento de código', 'Prof. Pedro');

INSERT INTO Matriculas (aluno_id, curso_id, data_matricula, status) VALUES
(1, 1, '2025-01-10', 'Ativa'),
(1, 2, '2025-01-10', 'Ativa'),
(2, 1, '2025-01-12', 'Ativa'),
(2, 3, '2025-01-12', 'Concluída'),
(3, 2, '2025-01-15', 'Ativa');

-- Consulta 1: todos os cursos em que um aluno está matriculado
SELECT
    Alunos.nome AS aluno,
    Cursos.titulo AS curso,
    Matriculas.status
FROM Matriculas
INNER JOIN Alunos ON Matriculas.aluno_id = Alunos.id
INNER JOIN Cursos ON Matriculas.curso_id = Cursos.id
WHERE Alunos.id = 1;

-- Consulta 2: todos os alunos matriculados em um curso
SELECT
    Cursos.titulo AS curso,
    Alunos.nome AS aluno,
    Matriculas.status
FROM Matriculas
INNER JOIN Alunos ON Matriculas.aluno_id = Alunos.id
INNER JOIN Cursos ON Matriculas.curso_id = Cursos.id
WHERE Cursos.id = 1;