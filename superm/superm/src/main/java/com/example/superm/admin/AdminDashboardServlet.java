package com.example.superm.admin;

import DataAccessObject.CommandeDAO;
import DataAccessObject.ProduitDAO;
import DataAccessObject.UtilisateurDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AdminDashboardServlet", value = "/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private ProduitDAO produitDAO;
    private UtilisateurDAO utilisateurDAO;
    private CommandeDAO commandeDAO;

    @Override
    public void init() {
        produitDAO = new ProduitDAO();
        utilisateurDAO = new UtilisateurDAO();
        commandeDAO = new CommandeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int totalProducts = produitDAO.getCount();
            int totalUsers = utilisateurDAO.getCount();
            int totalOrders = commandeDAO.getCount();

            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalOrders", totalOrders);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/dashboard.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/error.jsp");
        }
    }
}
