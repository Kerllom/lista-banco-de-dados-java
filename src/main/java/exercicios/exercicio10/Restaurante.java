package exercicios.exercicio10;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Restaurante {

    private static final String URL = "jdbc:mysql://localhost:3306/restaurante";
    private static final String USUARIO = "root";
    private static final String SENHA = "sua_senha_aqui";

    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            System.out.println("Ingredientes do prato 1 (Macarrao a Bolonhesa):\n");

            String sql =
                    "SELECT I.nome AS ingrediente, R.quantidade_necessaria, I.unidade_medida " +
                            "FROM Receitas R " +
                            "INNER JOIN Ingredientes I ON R.ingrediente_id = I.id " +
                            "WHERE R.prato_id = 1";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    String ingrediente = rs.getString("ingrediente");
                    double quantidade  = rs.getDouble("quantidade_necessaria");
                    String unidade     = rs.getString("unidade_medida");

                    System.out.println(ingrediente + " | " + quantidade + " " + unidade);
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}