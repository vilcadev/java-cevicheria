/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoriaDAO;
import DAOImpl.CategoriaDAOImpl;
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
    
      private final CategoriaDAO categoriaDAO = new CategoriaDAOImpl();
    
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
        List<Categoria> categorias = categoriaDAO.listar();

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
        Categoria categoria = new Categoria();
        categoria.setNombre(nombre);
        
        categoriaDAO.crear(categoria);

        response.setStatus(HttpServletResponse.SC_CREATED);
    }
    
    private void editarCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("Id"));
               String nombre = request.getParameter("Nombre");

               Categoria categoria = new Categoria();
               categoria.setId(id);
               categoria.setNombre(nombre);

               categoriaDAO.editar(categoria);

               response.setStatus(HttpServletResponse.SC_OK);
    }
    
    
      private void deleteCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         int id = Integer.parseInt(request.getParameter("Id"));
        
        categoriaDAO.eliminar(id);

        response.setStatus(HttpServletResponse.SC_OK);
    }
    
    
    
    

    
}