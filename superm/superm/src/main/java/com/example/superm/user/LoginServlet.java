package com.example.superm.user;

import DataAccessObject.UtilisateurDAO;
import Entity.Utilisateur;
import com.example.superm.UserNow;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Optional: Redirect to the login page if accessed via GET
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Utilisateur user = new UtilisateurDAO().getByEmailAndPassword(email, password);

            if (user == null) {
                // Redirect back to login page with an error message
                response.sendRedirect("login.jsp?error=invalid");
            } else {
                // Set user session attributes
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("role", user.getRole());

                // Determine redirection based on user role
                int role = user.getRole();
                switch (role) {
                    case 1: // Admin
                        response.sendRedirect("dashboard.jsp");
                        break;
                    case 2: // Regular User
                        response.sendRedirect("index.jsp");
                        break;
                    default:
                        response.sendRedirect("login.jsp?error=unknownRole");
                        break;
                }
            }
        } catch (SQLException e) {
            // Log the exception and redirect to an error page
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
