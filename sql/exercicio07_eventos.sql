CREATE DATABASE IF NOT EXISTS eventos;
USE eventos;

CREATE TABLE Eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_evento DATE,
    local VARCHAR(150),
    descricao VARCHAR(255)
);

CREATE TABLE Participantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Inscricoes (
    evento_id INT,
    participante_id INT,
    data_inscricao DATE,
    status_pagamento ENUM('pago', 'pendente'),
    PRIMARY KEY (evento_id, participante_id),
    FOREIGN KEY (evento_id) REFERENCES Eventos(id),
    FOREIGN KEY (participante_id) REFERENCES Participantes(id)
);

CREATE INDEX idx_status_pagamento ON Inscricoes(status_pagamento);

INSERT INTO Eventos (nome, data_evento, local, descricao) VALUES
('Workshop de Java', '2025-03-10', 'Auditório A', 'Imersão em Java'),
('Meetup de Dados', '2025-03-20', 'Sala 5', 'Encontro sobre bancos de dados');

INSERT INTO Participantes (nome, email, telefone) VALUES
('Ana Silva', 'ana@email.com', '11999990000'),
('Bruno Costa', 'bruno@email.com', '11888880000'),
('Carla Souza', 'carla@email.com', '11777770000');

INSERT INTO Inscricoes (evento_id, participante_id, data_inscricao, status_pagamento) VALUES
(1, 1, '2025-02-01', 'pago'),
(1, 2, '2025-02-02', 'pendente'),
(1, 3, '2025-02-03', 'pago'),
(2, 1, '2025-02-05', 'pago');

SELECT
    Participantes.nome,
    Participantes.email,
    Inscricoes.status_pagamento
FROM Inscricoes
INNER JOIN Participantes ON Inscricoes.participante_id = Participantes.id
WHERE Inscricoes.evento_id = 1
    AND Inscricoes.status_pagamento = 'pago';