package exercicios.exercicio09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Consultas {

    private static final String URL = "jdbc:mysql://localhost:3306/clinica_medica";
    private static final String USUARIO = "root";
    private static final String SENHA = "";

    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            System.out.println("Consultas do Dr. Pedro (medico 1) em 2025-02-10:\n");

            String sql =
                    "SELECT C.id, P.nome AS paciente, C.data_hora, C.status, C.observacoes " +
                            "FROM Consultas C " +
                            "INNER JOIN Pacientes P ON C.paciente_id = P.id " +
                            "WHERE C.medico_id = 1 " +
                            "AND DATE(C.data_hora) = '2025-02-10'";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    int    id         = rs.getInt("id");
                    String paciente   = rs.getString("paciente");
                    String dataHora   = rs.getString("data_hora");
                    String status     = rs.getString("status");
                    String observacoes = rs.getString("observacoes");

                    System.out.println("Consulta #" + id + " | " + paciente
                            + " | " + dataHora + " | " + status
                            + " | " + observacoes);
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}