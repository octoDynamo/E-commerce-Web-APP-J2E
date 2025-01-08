package com.example.superm.admin;

import DataAccessObject.ProduitDAO;
import Entity.Produit;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminProductServlet", value = "/admin/products")
public class AdminProductServlet extends HttpServlet {

    private ProduitDAO produitDAO;

    @Override
    public void init() {
        produitDAO = new ProduitDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Produit> produits = produitDAO.getAll();
            request.setAttribute("produits", produits);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/products.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("delete".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                produitDAO.deleteById(productId);
            }
            response.sendRedirect("/admin/products");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/error.jsp");
        }
    }
}
