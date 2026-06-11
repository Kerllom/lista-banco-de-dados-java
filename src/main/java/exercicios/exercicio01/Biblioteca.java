package exercicios.exercicio01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Biblioteca {

    // Dados da conexão: endereço do banco, usuário e senha do MySQL
    private static final String URL = "jdbc:mysql://localhost:3306/biblioteca";
    private static final String USUARIO = "root";
    private static final String SENHA = ""; // troque pela sua senha do MySQL

    public static void main(String[] args) {
        // try-with-resources: abre a conexão e a fecha sozinho no fim,
        // mesmo que dê erro. Evita "vazamento" de conexão.
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            System.out.println("Conexão estabelecida com sucesso!\n");

            // A MESMA consulta SQL do Workbench, agora dentro do Java
            String sql =
                "SELECT Livros.titulo, Livros.ano_publicacao, " +
                "Autores.nome AS autor, Editoras.nome AS editora " +
                "FROM Livros " +
                "INNER JOIN Autores ON Livros.autor_id = Autores.id " +
                "INNER JOIN Editoras ON Livros.editora_id = Editoras.id";

            // Statement executa o comando; ResultSet guarda o resultado
            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                // rs.next() avança uma linha por vez; retorna false quando acabam
                while (rs.next()) {
                    String titulo  = rs.getString("titulo");
                    int    ano     = rs.getInt("ano_publicacao");
                    String autor   = rs.getString("autor");
                    String editora = rs.getString("editora");

                    System.out.println(titulo + " (" + ano + ") - "
                                       + autor + " | " + editora);
                }
            }

        } catch (Exception e) {
            // Se a conexão ou a consulta falhar, mostra o motivo
            System.out.println("Erro: " + e.getMessage());
        }
    }
}
