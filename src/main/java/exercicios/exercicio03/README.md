# Exercício 3 - Gerenciamento de Projetos e Tarefas

## Propósito
Banco de dados para uma equipe organizar seus projetos e as tarefas
associadas, registrando quem é o responsável por cada tarefa e seu status.

## Estrutura
- **Projetos** (1) → (N) **Tarefas**: um projeto tem várias tarefas.
- **Usuarios** (1) → (N) **Tarefas**: um usuário pode ter várias tarefas.

A tabela `Tarefas` recebe dois relacionamentos 1:N ao mesmo tempo:
`projeto_id` aponta para o projeto e `usuario_id` aponta para o responsável.

Datas (`data_inicio`, `data_fim`, `data_vencimento`) usam o tipo `DATE`.

## Como criar um novo projeto
```sql
INSERT INTO Projetos (nome, descricao, data_inicio, data_fim)
VALUES ('Novo Projeto', 'Descrição', '2025-05-01', '2025-08-01');
```

## Como atribuir uma nova tarefa a um usuário
```sql
INSERT INTO Tarefas (projeto_id, usuario_id, descricao, status, data_vencimento)
VALUES (1, 2, 'Nova tarefa', 'Pendente', '2025-06-01');
```
(`projeto_id` e `usuario_id` devem existir nas tabelas Projetos e Usuarios)

## Como executar
1. Rode `sql/exercicio03_projetos.sql` no MySQL Workbench.
2. Ajuste a senha em `ProjetosTarefas.java` e execute a classe.