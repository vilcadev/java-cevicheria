/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Data.DatabaseConnection;
import Models.Platillo;
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
 * @author user
 */
@WebServlet("/listarPlatillos")
public class PlatilloController extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Platillo> platillos = new ArrayList<>();

        try 
            (Connection connection = DatabaseConnection.getConnection())
        {
            String sql = "SELECT * FROM platillo";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Platillo platillo = new Platillo();
                platillo.setId(resultSet.getInt("Id"));
                platillo.setCategoriaId(resultSet.getInt("CategoriaId"));
                platillo.setNombre(resultSet.getString("Nombre"));
                platillo.setImagenUrl(resultSet.getString("imagenUrl"));
                platillos.add(platillo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error en la base de datos", e);
        }

      // Configura la respuesta HTTP
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Envía el JSON en la respuesta
        PrintWriter out = response.getWriter();
        JSONArray jsonArray = new JSONArray();

        for (Platillo platillo : platillos) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", platillo.getId());
            jsonObject.put("categoriaId", platillo.getCategoriaId());
            jsonObject.put("nombre", platillo.getNombre());
            jsonObject.put("imagenUrl", platillo.getImagenUrl());
            jsonArray.put(jsonObject);
        }

        out.print(jsonArray.toString());
        out.flush();
    }
   
   
   
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("create")) {
            createPlatillo(request, response);
        } else if (action != null && action.equals("update")) {
            updatePlatillo(request, response);
        } else if (action != null && action.equals("delete")) {
            deletePlatillo(request, response);
        }else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
     
       private void createPlatillo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("Nombre");
        String imagenUrl = request.getParameter("imagenUrl");
        int categoriaId = Integer.parseInt(request.getParameter("CategoriaId"));

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO platillo (Nombre, imagenUrl, CategoriaId) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, imagenUrl);
            statement.setInt(3, categoriaId);

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

       
       
    private void updatePlatillo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("Id"));
        String nombre = request.getParameter("Nombre");
        String imagenUrl = request.getParameter("imagenUrl");
        int categoriaId = Integer.parseInt(request.getParameter("CategoriaId"));
        
         System.out.println("ID recibido: " + id);
    System.out.println("Nombre recibido: " + nombre);
    System.out.println("Imagen URL recibida: " + imagenUrl);
    System.out.println("Categoria ID recibido: " + categoriaId);


        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE platillo SET Nombre = ?, imagenUrl = ?, CategoriaId = ? WHERE Id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, imagenUrl);
            statement.setInt(3, categoriaId);
            statement.setInt(4, id);

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
    
    private void deletePlatillo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("Id"));

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM platillo WHERE Id = ?";
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
