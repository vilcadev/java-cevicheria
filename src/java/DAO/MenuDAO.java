/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Data.DatabaseConnection;
import Models.Platillo;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author user
 */
public class MenuDAO {
    
    public List<Platillo> getPlatillosPorFecha(Date fecha) {
        List<Platillo> platillos = new LinkedList<>();
        String sql = "SELECT p.Id AS IdPlatillo, p.Nombre, mp.precioUnitario, p.ImagenUrl " +
             "FROM Menu m " +
             "JOIN MenuPlatillo mp ON m.Id = mp.Menu_Id " +
             "JOIN Platillo p ON mp.Platillo_Id = p.Id " +
             "WHERE m.Fecha = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
             
            statement.setDate(1, new java.sql.Date(fecha.getTime()));
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                Platillo platillo = new Platillo();
                platillo.setId(resultSet.getInt("IdPlatillo"));
                platillo.setNombre(resultSet.getString("Nombre"));
                platillo.setPrecioUnitario(resultSet.getDouble("PrecioUnitario"));
                platillo.setImagenUrl(resultSet.getString("ImagenUrl"));
                platillos.add(platillo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return platillos;
    }
}
