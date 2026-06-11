# Exercício 6 - Sistema de Inventário de Loja

## Propósito
Controlar o inventário de uma loja: produtos, seus fornecedores e as
movimentações de estoque (entradas e saídas).

## Conceito central
O estoque **não é guardado em um campo fixo**. Ele é calculado a partir das
movimentações registradas em `TransacoesEstoque`:

```
estoque atual = soma das entradas - soma das saídas
```

Na consulta, isso é feito com `SUM` + `CASE`: o `CASE` transforma cada
movimentação em um valor positivo (entrada) ou negativo (saída), e o `SUM`
soma tudo, agrupado por produto com `GROUP BY`.

O campo `tipo_transacao` é um `ENUM('entrada','saida')`, que restringe os
valores possíveis a esses dois.

## Como o estoque é atualizado
Toda vez que entra ou sai mercadoria, registra-se uma nova transação:

```sql
-- entrada de 20 mouses
INSERT INTO TransacoesEstoque (produto_id, tipo_transacao, quantidade, data_transacao)
VALUES (2, 'entrada', 20, '2025-06-01');

-- saída (venda) de 5 mouses
INSERT INTO TransacoesEstoque (produto_id, tipo_transacao, quantidade, data_transacao)
VALUES (2, 'saida', 5, '2025-06-02');
```

A consulta de estoque sempre reflete o saldo atualizado, sem precisar editar
nenhum campo manualmente.

## Como executar
1. Rode `sql/exercicio06_inventario.sql` no MySQL Workbench.
2. Ajuste a senha em `Inventario.java` e execute a classe.