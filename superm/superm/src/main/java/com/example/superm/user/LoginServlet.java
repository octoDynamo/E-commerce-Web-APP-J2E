package com.example.superm.user;

import com.example.superm.UserNow;
import Entity.Utilisateur;
import DataAccessObject.UtilisateurDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            UserNow.setRole(0);
            UserNow.user.setNom("");
            UserNow.user.setRole(0);
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UtilisateurDAO userDao = new UtilisateurDAO();
            Utilisateur user = userDao.getByEmailAndPassword(email, password);

            if (user != null) {
                UserNow.setUser(user);
                UserNow.setRole(user.getRole());

                if (user.getRole() == 1) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("error", "Email ou mot de passe incorrect");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Erreur de connexion à la base de données");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}