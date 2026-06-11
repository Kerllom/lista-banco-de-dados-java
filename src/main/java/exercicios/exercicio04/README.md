# Exercício 4 - Sistema de Blog Simples

## Propósito
Banco de dados para um blog, com posts, categorias e comentários.
Um post pode pertencer a várias categorias e receber vários comentários.

## Conceitos centrais
- **Muitos-para-muitos** entre Posts e Categorias, resolvido pela tabela
  de junção `PostCategorias`.
- **Um-para-muitos** entre Posts e Comentarios (um post tem vários comentários).
- Consulta com `COUNT` + `GROUP BY` para contar os comentários de cada post.
- `LEFT JOIN` usado para incluir posts que ainda não têm comentários.

## Como adicionar um novo post e associá-lo a categorias
```sql
-- 1) cria o post
INSERT INTO Posts (titulo, conteudo, data_publicacao)
VALUES ('Novo Post', 'Conteúdo...', '2025-06-01');

-- 2) associa às categorias desejadas (usando o id do post criado)
INSERT INTO PostCategorias (post_id, categoria_id) VALUES (4, 1), (4, 2);
```

## Como executar
1. Rode `sql/exercicio04_blog.sql` no MySQL Workbench.
2. Ajuste a senha em `Blog.java` e execute a classe.