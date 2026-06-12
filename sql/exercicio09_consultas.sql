CREATE DATABASE IF NOT EXISTS clinica_medica;
USE clinica_medica;

CREATE TABLE Pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE Medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    CRM VARCHAR(20)
);

-- Consultas: dois relacionamentos 1:N (um paciente, um médico).
-- data_hora usa DATETIME = data + hora no mesmo campo.
CREATE TABLE Consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_hora DATETIME,
    status VARCHAR(30),
    observacoes TEXT,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(id)
);

-- Dados de exemplo
INSERT INTO Pacientes (nome, data_nascimento, telefone, endereco) VALUES
('Ana Silva', '1990-05-12', '11999990000', 'Rua A, 10'),
('Bruno Costa', '1985-08-23', '11888880000', 'Rua B, 20'),
('Carla Souza', '2000-02-01', '11777770000', 'Rua C, 30');

INSERT INTO Medicos (nome, especialidade, CRM) VALUES
('Dr. Pedro Lima', 'Cardiologia', 'CRM12345'),
('Dra. Marta Reis', 'Dermatologia', 'CRM67890');

INSERT INTO Consultas (paciente_id, medico_id, data_hora, status, observacoes) VALUES
(1, 1, '2025-02-10 09:00:00', 'Agendada', 'Check-up de rotina'),
(2, 1, '2025-02-10 10:30:00', 'Agendada', 'Dor no peito'),
(3, 2, '2025-02-11 14:00:00', 'Agendada', 'Consulta dermatologica'),
(1, 1, '2025-02-12 08:00:00', 'Agendada', 'Retorno');

-- Consulta: consultas de um médico em uma data específica
-- DATE(C.data_hora) extrai só a parte da data (ignora a hora),
-- permitindo comparar com um dia inteiro.
SELECT
    C.id,
    P.nome AS paciente,
    C.data_hora,
    C.status,
    C.observacoes
FROM Consultas C
INNER JOIN Pacientes P ON C.paciente_id = P.id
WHERE C.medico_id = 1
  AND DATE(C.data_hora) = '2025-02-10';
