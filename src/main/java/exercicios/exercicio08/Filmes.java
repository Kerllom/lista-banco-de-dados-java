package exercicios.exercicio08;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Exercício 8 - Sistema de Avaliação de Filmes
 * Calcula a média de avaliação de um filme e lista seus comentários.
 * Rode sql/exercicio08_filmes.sql ANTES de executar.
 */
public class Filmes {

    private static final String URL = "jdbc:mysql://localhost:3306/avaliacao_filmes";
    private static final String USUARIO = "root";
    private static final String SENHA = "";

    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            // Consulta 1: média do filme 1
            String sqlMedia =
                    "SELECT F.titulo, AVG(A.nota) AS media_nota, COUNT(A.id) AS total_avaliacoes " +
                            "FROM Filmes F " +
                            "INNER JOIN Avaliacoes A ON F.id = A.filme_id " +
                            "WHERE F.id = 1 " +
                            "GROUP BY F.id, F.titulo";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sqlMedia)) {
                if (rs.next()) {
                    String titulo = rs.getString("titulo");
                    double media  = rs.getDouble("media_nota");
                    int    total  = rs.getInt("total_avaliacoes");
                    System.out.printf("=== %s ===%n", titulo);
                    System.out.printf("Media: %.1f (%d avaliacoes)%n%n", media, total);
                }
            }

            // Consulta 2: comentários do filme 1
            System.out.println("Comentarios:");
            String sqlComentarios =
                    "SELECT U.nome AS usuario, A.nota, A.comentario " +
                            "FROM Avaliacoes A " +
                            "INNER JOIN Usuarios U ON A.usuario_id = U.id " +
                            "WHERE A.filme_id = 1";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sqlComentarios)) {
                while (rs.next()) {
                    String usuario    = rs.getString("usuario");
                    double nota       = rs.getDouble("nota");
                    String comentario = rs.getString("comentario");
                    System.out.println("- " + usuario + " (nota " + nota + "): " + comentario);
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}



