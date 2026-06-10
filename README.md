# Lista de Exercícios - Java + Banco de Dados (SENAI)

Repositório com a resolução da lista de exercícios de banco de dados,
com aplicações Java conectadas ao MySQL via JDBC.

## Tecnologias
- Java 17
- Maven (gerenciamento de dependências)
- MySQL
- JDBC (mysql-connector-j)

## Estrutura do repositório
```
lista-exercicios-java-senai/
├── pom.xml                          → configuração Maven (driver MySQL)
├── sql/                             → scripts de criação dos bancos
│   └── exercicio01_biblioteca.sql
└── src/main/java/exercicios/        → código Java de cada exercício
    └── exercicio01/
        └── Biblioteca.java
```

## Como executar um exercício
1. Abra o script SQL correspondente (pasta `sql/`) no MySQL Workbench e execute-o.
   Isso cria o banco e insere os dados.
2. Abra a classe Java do exercício no IntelliJ.
3. Ajuste usuário e senha do MySQL no início da classe.
4. Execute a classe (botão verde ▶). O programa lê os dados e mostra o resultado.

## Exercícios
| Nº | Tema | Script SQL | Classe Java |
|----|------|-----------|-------------|
| 01 | Gerenciamento de Livros | `sql/exercicio01_biblioteca.sql` | `exercicio01/Biblioteca.java` |
