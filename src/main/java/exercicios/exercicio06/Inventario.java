package exercicios.exercicio06;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Inventario {
    private static final String URL = "jdbc:mysql://localhost:3306/inventario_loja";
    private static final String USUARIO = "root";
    private static final String SENHA = "";

    public static void main (String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            System.out.println("Estoque atual de cada produto:\n");

            String sql =
                    "SELECT Produtos.nome, " +
                            "COALESCE(SUM(CASE " +
                            "  WHEN TransacoesEstoque.tipo_transacao = 'entrada' THEN TransacoesEstoque.quantidade " +
                            "  WHEN TransacoesEstoque.tipo_transacao = 'saida'   THEN -TransacoesEstoque.quantidade " +
                            "END), 0) AS estoque_atual " +
                            "FROM Produtos " +
                            "LEFT JOIN TransacoesEstoque ON Produtos.id = TransacoesEstoque.produto_id " +
                            "GROUP BY Produtos.id, Produtos.nome";

            try (Statement stmt = conexao.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    String nome = rs.getString("nome");
                    int estoque = rs.getInt("estoque_atual");

                    System.out.println(nome + " | estoque: " + estoque + " unidades(s)");
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}
