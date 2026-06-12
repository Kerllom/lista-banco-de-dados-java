package exercicios.exercicio07;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Eventos {

    private static final String URL = "jdbc:mysql://localhost:3306/eventos";
    private static final String USUARIO = "root";
    private static final String SENHA = "sua_senha_aqui";

    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            System.out.println("Participantes PAGOS do evento 1 (Workshop de Java):\n");

            String sql =
                    "SELECT Participantes.nome, Participantes.email, Inscricoes.status_pagamento " +
                            "FROM Inscricoes " +
                            "INNER JOIN Participantes ON Inscricoes.participante_id = Participantes.id " +
                            "WHERE Inscricoes.evento_id = 1 " +
                            "AND Inscricoes.status_pagamento = 'pago'";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    String nome  = rs.getString("nome");
                    String email = rs.getString("email");

                    System.out.println(nome + " | " + email + " | PAGO");
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}