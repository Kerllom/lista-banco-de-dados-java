CREATE DATABASE IF NOT EXISTS gerenciador_projetos;
USE gerenciador_projetos;

CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Tarefas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    projeto_id INT,
    usuario_id INT,
    descricao VARCHAR(255),
    status VARCHAR(30),
    data_vencimento DATE,
    FOREIGN KEY (projeto_id) REFERENCES Projetos(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

INSERT INTO Usuarios (nome, email) VALUES
('Ana Silva', 'ana@email.com'),
('Bruno Costa', 'bruno@email.com'),
('Carla Souza', 'carla@email.com');

INSERT INTO Projetos (nome, descricao, data_inicio, data_fim) VALUES
('Site Institucional', 'Desenvolvimento do novo site', '2025-01-05', '2025-03-30'),
('App Mobile', 'Aplicativo Android e iOS', '2025-02-01', '2025-06-15');

INSERT INTO Tarefas (projeto_id, usuario_id, descricao, status, data_vencimento) VALUES
(1, 1, 'Criar layout das páginas', 'Concluída', '2025-01-20'),
(1, 2, 'Implementar formulário de contato', 'Em andamento', '2025-02-10'),
(1, 3, 'Configurar hospedagem', 'Pendente', '2025-03-01'),
(2, 1, 'Definir telas do app', 'Em andamento', '2025-02-20'),
(2, 2, 'Integrar com a API', 'Pendente', '2025-04-10');

SELECT
    Tarefas.descricao AS tarefa,
    Usuarios.nome AS responsavel,
    Tarefas.status,
    Tarefas.data_vencimento
FROM Tarefas
INNER JOIN Usuarios ON Tarefas.usuario_id = Usuarios.id
WHERE Tarefas.projeto_id = 1;