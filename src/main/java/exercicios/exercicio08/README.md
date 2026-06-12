# Exercício 8 - Sistema de Avaliação de Filmes

## Propósito
Plataforma de streaming onde usuários avaliam filmes com uma nota e um
comentário. Um usuário pode avaliar vários filmes e um filme pode ser
avaliado por vários usuários.

## Conceitos centrais
- **Muitos-para-muitos** entre Usuarios e Filmes, resolvido pela tabela
  `Avaliacoes`, que além de ligar os dois guarda a nota e o comentário.
- Consulta com `AVG` (média das notas) + `COUNT` (quantidade de avaliações),
  agrupados por filme com `GROUP BY`.
- O campo `nota` é `DECIMAL(3,1)`: aceita valores como 8.0, 9.5, 10.0.

## Como adicionar uma nova avaliação
```sql
INSERT INTO Avaliacoes (usuario_id, filme_id, nota, comentario, data_avaliacao)
VALUES (2, 1, 8.5, 'Muito bom', '2025-06-01');
```
(o usuario_id e o filme_id devem existir nas tabelas Usuarios e Filmes)

## Como executar
1. Rode `sql/exercicio08_filmes.sql` no MySQL Workbench.
2. Ajuste a senha em `Filmes.java` e execute a classe.