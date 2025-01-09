package com.example.superm.user;

import DataAccessObject.UtilisateurDAO;
import Entity.Utilisateur;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
            Utilisateur user = utilisateurDAO.getByEmailAndPassword(email, password);

            if (user == null) {
                // Rediriger vers la page de connexion avec un message d'erreur
                response.sendRedirect("login.jsp?error=invalid");
            } else {
                // Créer une session pour l'utilisateur
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("role", user.getRole());

                // Redirection basée sur le rôle
                if (user.getRole() == 1) { // Admin
                    response.sendRedirect("dashboard.jsp");
                } else if (user.getRole() == 2) { // Utilisateur classique
                    response.sendRedirect("index.jsp");
                } else {
                    // Rôle inconnu
                    response.sendRedirect("error.jsp?message=Rôle%20inconnu");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
