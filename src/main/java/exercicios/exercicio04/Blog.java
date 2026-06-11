package exercicios.exercicio04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Exercício 4 - Sistema de Blog Simples
 * Lista os posts de uma categoria com a contagem de comentários de cada um.
 * Rode sql/exercicio04_blog.sql ANTES de executar.
 */
public class Blog {

    private static final String URL = "jdbc:mysql://localhost:3306/blog";
    private static final String USUARIO = "root";
    private static final String SENHA = "";

    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            System.out.println("Posts da categoria 'Programação' e nº de comentários:\n");

            String sql =
                    "SELECT Posts.titulo, COUNT(Comentarios.id) AS total_comentarios " +
                            "FROM Posts " +
                            "INNER JOIN PostCategorias ON Posts.id = PostCategorias.post_id " +
                            "LEFT JOIN Comentarios ON Posts.id = Comentarios.post_id " +
                            "WHERE PostCategorias.categoria_id = 1 " +
                            "GROUP BY Posts.id, Posts.titulo";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    String titulo = rs.getString("titulo");
                    int    total  = rs.getInt("total_comentarios");

                    System.out.println(titulo + " | " + total + " comentário(s)");
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}