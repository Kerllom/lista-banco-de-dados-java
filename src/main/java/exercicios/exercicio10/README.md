# Exercício 10 - Sistema de Gerenciamento de Restaurantes

## Propósito
Organizar os pratos de um restaurante, os ingredientes e as receitas.
Um prato usa vários ingredientes e um ingrediente pode entrar em vários pratos.

## Conceito central
Relacionamento **muitos-para-muitos** entre Pratos e Ingredientes, resolvido
pela tabela de junção `Receitas`. Além de ligar prato e ingrediente, ela guarda
a `quantidade_necessaria` de cada ingrediente naquele prato.

## Como adicionar um novo prato e seus ingredientes
```sql
-- 1) cria o prato
INSERT INTO Pratos (nome, descricao, preco)
VALUES ('Novo Prato', 'Descricao', 40.00);

-- 2) cria os ingredientes (se ainda nao existirem)
INSERT INTO Ingredientes (nome, unidade_medida)
VALUES ('Novo Ingrediente', 'gramas');

-- 3) monta a receita ligando prato e ingrediente, com a quantidade
INSERT INTO Receitas (prato_id, ingrediente_id, quantidade_necessaria)
VALUES (3, 7, 100);
```

## Como executar
1. Rode `sql/exercicio10_restaurante.sql` no MySQL Workbench.
2. Ajuste a senha em `Restaurante.java` e execute a classe.