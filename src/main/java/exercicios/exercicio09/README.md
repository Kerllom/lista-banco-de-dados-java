# Exercício 9 - Gerenciamento de Consultas Médicas

## Propósito
Sistema de agendamento de uma clínica, registrando pacientes, médicos e as
consultas marcadas. Um paciente pode ter várias consultas e um médico pode
atender várias consultas.

## Conceitos centrais
- A tabela `Consultas` tem dois relacionamentos 1:N: `paciente_id` aponta
  para Pacientes e `medico_id` aponta para Medicos.
- O campo `data_hora` usa o tipo `DATETIME`, que guarda data e hora juntas
  (ex.: 2025-02-10 09:00:00).
- A função `DATE(data_hora)` extrai só a parte da data, permitindo filtrar
  todas as consultas de um dia inteiro, sem se importar com a hora.

## Como agendar uma nova consulta
```sql
INSERT INTO Consultas (paciente_id, medico_id, data_hora, status, observacoes)
VALUES (3, 1, '2025-02-13 11:00:00', 'Agendada', 'Primeira consulta');
```
(o paciente_id e o medico_id devem existir nas tabelas Pacientes e Medicos)

## Como executar
1. Rode `sql/exercicio09_consultas.sql` no MySQL Workbench.
2. Ajuste a senha em `Consultas.java` e execute a classe.