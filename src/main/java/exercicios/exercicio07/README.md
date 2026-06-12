# Exercício 7 - Sistema de Eventos e Participantes

## Propósito
Gerenciar eventos e os participantes inscritos. Um participante pode se
inscrever em vários eventos e um evento pode ter vários participantes.

## Conceito central
Relacionamento **muitos-para-muitos** entre Eventos e Participantes, resolvido
pela tabela de junção `Inscricoes`, que também guarda a data e o status de
pagamento de cada inscrição.

O campo `status_pagamento` é um `ENUM('pago','pendente')`, e a consulta usa o
`WHERE` para filtrar apenas as inscrições pagas.

## Índice
Foi criado um índice em `status_pagamento` (`idx_status_pagamento`). Índices
aceleram consultas que filtram por essa coluna, algo útil quando a tabela tem
muitos registros.

## Como registrar um novo evento
```sql
INSERT INTO Eventos (nome, data_evento, local, descricao)
VALUES ('Novo Evento', '2025-07-01', 'Local X', 'Descrição');
```

## Como registrar um novo participante e inscrevê-lo
```sql
INSERT INTO Participantes (nome, email, telefone)
VALUES ('Novo Participante', 'novo@email.com', '11000000000');

INSERT INTO Inscricoes (evento_id, participante_id, data_inscricao, status_pagamento)
VALUES (1, 4, '2025-06-01', 'pendente');
```

## Como executar
1. Rode `sql/exercicio07_eventos.sql` no MySQL Workbench.
2. Ajuste a senha em `Eventos.java` e execute a classe.