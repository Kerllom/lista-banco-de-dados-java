# Exercício 5 - Gerenciamento de Cursos e Alunos

## Propósito
Plataforma de cursos online que gerencia cursos, alunos e suas matrículas.
Um aluno pode se matricular em vários cursos e um curso pode ter vários alunos.

## Conceito central
Relacionamento **muitos-para-muitos** entre Alunos e Cursos, resolvido pela
tabela de junção `Matriculas`. Além de ligar aluno e curso, ela guarda dados
próprios da matrícula (data e status).

## Integridade referencial
As chaves estrangeiras de `Matriculas` garantem que só é possível matricular
um aluno e um curso que realmente existem — não há matrícula "órfã" apontando
para um aluno ou curso inexistente.

## Como matricular um aluno em um curso
```sql
INSERT INTO Matriculas (aluno_id, curso_id, data_matricula, status)
VALUES (3, 1, '2025-06-01', 'Ativa');
```
(o aluno_id e o curso_id devem existir nas tabelas Alunos e Cursos)

## Como executar
1. Rode `sql/exercicio05_cursos.sql` no MySQL Workbench.
2. Ajuste a senha em `CursosAlunos.java` e execute a classe.