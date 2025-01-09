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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the login page if accessed via GET
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember"); // Checkbox for "Remember Me"

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

                // Handle "Remember Me" functionality
                if ("on".equals(remember)) {
                    Cookie userCookie = new Cookie("userEmail", user.getEmail());
                    userCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                    response.addCookie(userCookie);

                    Cookie roleCookie = new Cookie("userRole", String.valueOf(user.getRole()));
                    roleCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                    response.addCookie(roleCookie);
                }

                // Redirect to the index page
                response.sendRedirect("index.jsp");
            }
        } catch (SQLException e) {
            // Log the exception and redirect to an error page
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
