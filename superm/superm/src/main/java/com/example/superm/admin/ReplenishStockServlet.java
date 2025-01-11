package com.example.superm.admin;

import DataAccessObject.ProduitDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ReplenishStockServlet", value = "/admin/ReplenishStockServlet")
public class ReplenishStockServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));

        try {
            ProduitDAO produitDAO = new ProduitDAO();
            produitDAO.updateQuantite(productId, 10); // Replenish with a default value
            response.sendRedirect("stockShortages.jsp?success=true");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
