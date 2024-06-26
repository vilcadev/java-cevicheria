package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String JDBC_URL = "jdbc:mysql://cevicheriaserver.mysql.database.azure.com:3306/cevicheria?useSSL=true&requireSSL=true";
    private static final String USER = "jiren";
    private static final String PASSWORD = "abc12345$";

    public static Connection getConnection() throws SQLException {
        try {
            // Cargar el driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("No se encontró el driver JDBC", e);
        }
        return DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
    }
}
