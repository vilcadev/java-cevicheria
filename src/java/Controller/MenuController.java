/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Data.DatabaseConnection;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;


@WebServlet("/gestionarMenu")
public class MenuController extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonString = sb.toString();

        // Verificar si el JSON es válido y manejarlo
        if (jsonString == null || jsonString.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No se proporcionaron platillos para guardar.");
            return;
        }

        // Convertir la cadena JSON a un JSONObject para facilitar el manejo
        JSONObject jsonObject;
        try {
            jsonObject = new JSONObject(jsonString);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de datos JSON incorrecto.");
            return;
        }

        // Obtener la fecha y los platillos del JSON
        String fecha = jsonObject.optString("fecha");
        JSONArray platillosArray = jsonObject.optJSONArray("platillos");

        if (fecha == null || fecha.isEmpty() || platillosArray == null || platillosArray.length() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de datos JSON incorrecto.");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false);

            // Insertar en la tabla Menu
            String insertMenuSQL = "INSERT INTO Menu (Fecha) VALUES (?)";
            PreparedStatement pstmt = conn.prepareStatement(insertMenuSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, fecha);
            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();
            int menuId = 0;
            if (rs.next()) {
                menuId = rs.getInt(1);
            }

            // Insertar en la tabla MenuPlatillo
            String insertMenuPlatilloSQL = "INSERT INTO MenuPlatillo (Menu_Id, Platillo_Id, PrecioUnitario) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(insertMenuPlatilloSQL);
            for (int i = 0; i < platillosArray.length(); i++) {
                JSONObject platillo = platillosArray.getJSONObject(i);
                int platilloId = platillo.getInt("id");
                double precio = platillo.getDouble("precio");

                pstmt.setInt(1, menuId);
                pstmt.setInt(2, platilloId);
                pstmt.setDouble(3, precio);
                pstmt.addBatch();
            }
            pstmt.executeBatch();

            conn.commit();

            // Enviar respuesta JSON de éxito
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("message", "Menú guardado exitosamente");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse.toString());

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al guardar el menú");
        }
    }

}
