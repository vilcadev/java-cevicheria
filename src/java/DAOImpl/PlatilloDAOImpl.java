/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOImpl;

import DAO.PlatilloDAO;
import Data.DatabaseConnection;
import Models.Platillo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author user
 */
public class PlatilloDAOImpl implements PlatilloDAO{
    
     @Override
    public void limpiar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public Platillo ver(int id) {
        Platillo platillo = null;
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM platillo WHERE Id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                platillo = new Platillo();
                platillo.setId(resultSet.getInt("Id"));
                platillo.setNombre(resultSet.getString("Nombre"));
                platillo.setImagenUrl(resultSet.getString("imagenUrl"));
                platillo.setCategoriaId(resultSet.getInt("CategoriaId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return platillo;
    }
    
    
     @Override
    public LinkedList<Platillo> listar() {
        LinkedList<Platillo> platillos = new LinkedList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT p.Id, p.Nombre, p.imagenUrl, p.CategoriaId, c.Nombre AS NombreCategoria " +
                         "FROM platillo p " +
                         "JOIN categoria c ON p.CategoriaId = c.Id";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Platillo platillo = new Platillo();
                platillo.setId(resultSet.getInt("Id"));
                platillo.setCategoriaId(resultSet.getInt("CategoriaId"));
                platillo.setNombre(resultSet.getString("Nombre"));
                platillo.setImagenUrl(resultSet.getString("imagenUrl"));
                platillo.setNombreCategoria(resultSet.getString("NombreCategoria")); 
                platillos.add(platillo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return platillos;
    }
    
    
    @Override
    public void crear(Platillo platillo) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO platillo (Nombre, imagenUrl, CategoriaId) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, platillo.getNombre());
            statement.setString(2, platillo.getImagenUrl());
            statement.setInt(3, platillo.getCategoriaId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     @Override
    public void eliminar(int id) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM platillo WHERE Id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
        @Override
    public void editar(Platillo platillo) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE platillo SET Nombre = ?, imagenUrl = ?, CategoriaId = ? WHERE Id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, platillo.getNombre());
            statement.setString(2, platillo.getImagenUrl());
            statement.setInt(3, platillo.getCategoriaId());
            statement.setInt(4, platillo.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
}
