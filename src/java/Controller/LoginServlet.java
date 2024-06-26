package Controller;

import Data.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM usuario WHERE usuario = ? AND contrasena = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, usuario);
            statement.setString(2, contrasena);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Usuario autenticado
                String rol = resultSet.getString("rol");
                if ("ADMIN".equals(rol)) {
                    response.sendRedirect("admin/manageCategories.jsp");
                } else if ("COCINERO".equals(rol)) {
                    response.sendRedirect("cocinero/manageOrders.jsp");
                } else if ("MESERA".equals(rol)) {
                    response.sendRedirect("mesera/tables.jsp");
                } else {
                    response.sendRedirect("error.jsp"); // Redirigir a una página de error si el rol no está definido
                }
            } else {
                // Autenticación fallida
                response.sendRedirect("error.jsp"); // Redirigir a una página de error
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error en la base de datos", e);
        }
    }
}