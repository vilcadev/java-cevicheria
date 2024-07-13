/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;


import DAO.PlatilloDAO;
import DAOImpl.PlatilloDAOImpl;
import Data.DatabaseConnection;

import Models.Platillo;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig
public class PlatilloController extends HttpServlet {
    
     private final PlatilloDAO platilloDAO = new PlatilloDAOImpl();

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<Platillo> platillos = platilloDAO.listar();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        JSONArray jsonArray = new JSONArray();

        for (Platillo platillo : platillos) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", platillo.getId());
            jsonObject.put("categoriaId", platillo.getCategoriaId());
            jsonObject.put("nombre", platillo.getNombre());
            jsonObject.put("imagenUrl", platillo.getImagenUrl());
            jsonObject.put("nombreCategoria", platillo.getNombreCategoria());
            jsonArray.put(jsonObject);
        }

        out.print(jsonArray.toString());
        out.flush();
    }
   
   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            createPlatillo(request, response);
        } else if ("update".equals(action)) {
            updatePlatillo(request, response);
        } else if ("delete".equals(action)) {
            deletePlatillo(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
         
       
      private void createPlatillo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("Nombre");
        String categoriaId = request.getParameter("CategoriaId");
        String imagenBase64 = request.getParameter("imagenBase64");

        Platillo platillo = new Platillo();
        platillo.setNombre(nombre);
        platillo.setImagenUrl(imagenBase64);
        platillo.setCategoriaId(Integer.parseInt(categoriaId));

        platilloDAO.crear(platillo);
        response.setStatus(HttpServletResponse.SC_CREATED);
    }



       
       
    private void updatePlatillo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("Id"));
        String nombre = request.getParameter("Nombre");
        String imagenBase64 = request.getParameter("imagenBase64");
        int categoriaId = Integer.parseInt(request.getParameter("CategoriaId"));

        Platillo platillo = new Platillo();
        platillo.setId(id);
        platillo.setNombre(nombre);
        platillo.setImagenUrl(imagenBase64);
        platillo.setCategoriaId(categoriaId);

        platilloDAO.editar(platillo);
        response.setStatus(HttpServletResponse.SC_OK);
    }
    
      private void deletePlatillo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("Id"));
        platilloDAO.eliminar(id);
        response.setStatus(HttpServletResponse.SC_OK);
    }
   
  

}
