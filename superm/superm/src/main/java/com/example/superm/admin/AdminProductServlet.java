package com.example.superm.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import com.example.superm.UserNow;
import Entity.Produit;
import DataAccessObject.ProduitDAO;

@WebServlet(name = "AdminProduct", value = "/admin/products/*")
public class AdminProductServlet extends HttpServlet {
    private ProduitDAO produitDAO;

    public void init() {
        produitDAO = new ProduitDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(UserNow.getRole() != 1) {
            response.sendRedirect("../login.jsp");
            return;
        }

        String action = request.getPathInfo();
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/delete":
                    deleteProduct(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(UserNow.getRole() != 1) {
            response.sendRedirect("../login.jsp");
            return;
        }

        String action = request.getPathInfo();
        try {
            if ("/update".equals(action)) {
                updateProduct(request, response);
            } else if ("/insert".equals(action)) {
                insertProduct(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.setAttribute("products", produitDAO.getAll());
        request.getRequestDispatcher("/admin/products.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/product-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produit product = produitDAO.getById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/admin/product-form.jsp").forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        double prix = Double.parseDouble(request.getParameter("prix"));
        String image = request.getParameter("image");

        Produit newProduct = new Produit();
        newProduct.setNom(nom);
        newProduct.setDescription(description);
        newProduct.setPrix(prix);
        newProduct.setImage(image);

        produitDAO.create(newProduct);
        response.sendRedirect("list");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        double prix = Double.parseDouble(request.getParameter("prix"));
        String image = request.getParameter("image");

        Produit product = new Produit();
        product.setId(id);
        product.setNom(nom);
        product.setDescription(description);
        product.setPrix(prix);
        product.setImage(image);

        produitDAO.update(product);
        response.sendRedirect("list");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        produitDAO.delete(id);
        response.sendRedirect("list");
    }
}