package exercicios.exercicio03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ProjetosTarefas {

    private static final String URL = "jdbc:mysql://localhost:3306/gerenciador_projetos";
    private static final String USUARIO = "root";
    private static final String SENHA = "sua_senha_aqui";

    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA)) {

            System.out.println("Tarefas do Projeto 1 (Site Institucional):\n");

            String sql =
                    "SELECT Tarefas.descricao AS tarefa, Usuarios.nome AS responsavel, " +
                            "Tarefas.status, Tarefas.data_vencimento " +
                            "FROM Tarefas " +
                            "INNER JOIN Usuarios ON Tarefas.usuario_id = Usuarios.id " +
                            "WHERE Tarefas.projeto_id = 1";

            try (Statement stmt = conexao.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    String tarefa      = rs.getString("tarefa");
                    String responsavel = rs.getString("responsavel");
                    String status      = rs.getString("status");
                    String vencimento  = rs.getString("data_vencimento");

                    System.out.println(tarefa + " | " + responsavel
                            + " | " + status + " | vence em " + vencimento);
                }
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}