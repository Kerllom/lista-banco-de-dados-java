package exercicios.exercicio05;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Exercício 5 - Gerenciamento de Cursos e Alunos
 * Duas consultas: cursos de um aluno e alunos de um curso.
 * Rode sql/exercicio05_cursos.sql ANTES de executar.
 */
public class CursosAlunos {

    private static final String URL = "jdbc:mysql://localhost:3306/plataforma_cursos";
    private static final String USUARIO = "root";
    private static final String SENHA = "";

    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            // Consulta 1: cursos do aluno 1
            System.out.println("Cursos do aluno 1 (Ana Silva):\n");
            String sql1 =
                    "SELECT Cursos.titulo AS curso, Matriculas.status " +
                            "FROM Matriculas " +
                            "INNER JOIN Cursos ON Matriculas.curso_id = Cursos.id " +
                            "WHERE Matriculas.aluno_id = 1";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql1)) {
                while (rs.next()) {
                    System.out.println("- " + rs.getString("curso")
                            + " (" + rs.getString("status") + ")");
                }
            }

            // Consulta 2: alunos do curso 1
            System.out.println("\nAlunos do curso 1 (Java Básico):\n");
            String sql2 =
                    "SELECT Alunos.nome AS aluno, Matriculas.status " +
                            "FROM Matriculas " +
                            "INNER JOIN Alunos ON Matriculas.aluno_id = Alunos.id " +
                            "WHERE Matriculas.curso_id = 1";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql2)) {
                while (rs.next()) {
                    System.out.println("- " + rs.getString("aluno")
                            + " (" + rs.getString("status") + ")");
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}