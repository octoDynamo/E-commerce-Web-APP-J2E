package com.example.superm.admin;

import DataAccessObject.UtilisateurDAO;
import Entity.Utilisateur;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminUserServlet", value = "/admin/users")
public class AdminUserServlet extends HttpServlet {

    private UtilisateurDAO utilisateurDAO;

    @Override
    public void init() {
        utilisateurDAO = new UtilisateurDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Utilisateur> utilisateurs = utilisateurDAO.getAll();
            request.setAttribute("utilisateurs", utilisateurs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/users.jsp");
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
                int userId = Integer.parseInt(request.getParameter("userId"));
                utilisateurDAO.deleteById(userId);
            }
            response.sendRedirect("/admin/users");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/error.jsp");
        }
    }
}
