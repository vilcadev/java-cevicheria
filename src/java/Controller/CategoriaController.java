/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Data.DatabaseConnection;
import Models.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Omar
 */
@WebServlet("/listarCategorias")
public class CategoriaController extends HttpServlet {
    
    String vista = "admin/manageCategories.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CategoriaController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoriaController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categoria> categorias = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM categoria";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(resultSet.getInt("Id"));
                categoria.setNombre(resultSet.getString("Nombre"));
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error en la base de datos", e);
        }

        // Convertir la lista de categorías a JSON
        JSONArray jsonArray = new JSONArray();
        for (Categoria categoria : categorias) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", categoria.getId());
            jsonObject.put("nombre", categoria.getNombre());
            jsonArray.put(jsonObject);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonArray.toString());
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("create")) {
            createCategoria(request, response);
            }
            else if (action != null && action.equals("update")) {
            editarCategoria(request, response);
        } 
            else if (action != null && action.equals("delete")) {
            deleteCategoria(request, response);
        } 
        else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
    
    private void createCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("Nombre");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO categoria (Nombre) VALUES (?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.setStatus(HttpServletResponse.SC_CREATED);
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error en la base de datos", e);
        }
    }
    
    private void editarCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("Id"));
        String nombre = request.getParameter("Nombre");
        

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE categoria SET Nombre = ? WHERE Id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setInt(2, id);

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error en la base de datos", e);
        }
    }
    
    
      private void deleteCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("Id"));

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM categoria WHERE Id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error en la base de datos", e);
        }
    }
    
    
    
    

    
}