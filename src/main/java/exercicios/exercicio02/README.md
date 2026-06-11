# Exercício 2 - Registro de Pedidos Online

## Propósito
Banco de dados para uma loja virtual, registrando clientes, produtos
e os pedidos realizados.

## Conceito central: muitos-para-muitos
Um pedido pode ter vários produtos e um produto pode estar em vários
pedidos. Esse relacionamento é resolvido pela tabela de junção
**ItensPedido**, que liga Pedidos a Produtos e guarda a quantidade
e o preço no momento da compra.

## Como adicionar um novo cliente
INSERT INTO Clientes (nome, email, endereco)
VALUES ('Novo Cliente', 'email@email.com', 'Endereço');

## Como adicionar um novo produto
INSERT INTO Produtos (nome, preco, estoque)
VALUES ('Novo Produto', 99.90, 20);

## Como executar
1. Rode sql/exercicio02_pedidos.sql no MySQL Workbench.
2. Ajuste a senha em PedidosOnline.java e execute a classe.