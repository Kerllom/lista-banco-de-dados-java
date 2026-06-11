package exercicios.exercicio02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Exercício 2 - Registro de Pedidos Online
 * Lista os pedidos de um cliente específico, com produtos e quantidades.
 * Rode o script sql/exercicio02_pedidos.sql ANTES de executar.
 */
public class PedidosOnline {

    private static final String URL = "jdbc:mysql://localhost:3306/loja_online";
    private static final String USUARIO = "root";
    private static final String SENHA = "sua_senha_aqui"; // sua senha do MySQL

    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            System.out.println("Conexão estabelecida!\n");
            System.out.println("Pedidos do cliente 1 (Ana Silva):\n");

            // Mesma consulta de 3 tabelas que rodamos no Workbench
            String sql =
                    "SELECT Pedidos.id AS numero_pedido, Pedidos.data_pedido, " +
                            "Produtos.nome AS produto, ItensPedido.quantidade, " +
                            "ItensPedido.preco_unitario " +
                            "FROM Pedidos " +
                            "INNER JOIN ItensPedido ON Pedidos.id = ItensPedido.pedido_id " +
                            "INNER JOIN Produtos ON ItensPedido.produto_id = Produtos.id " +
                            "WHERE Pedidos.cliente_id = 1";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    int    numeroPedido = rs.getInt("numero_pedido");
                    String produto      = rs.getString("produto");
                    int    quantidade   = rs.getInt("quantidade");
                    double precoUnit    = rs.getDouble("preco_unitario");

                    System.out.println("Pedido #" + numeroPedido + " | "
                            + produto + " | Qtd: " + quantidade
                            + " | R$ " + precoUnit);
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}