package com.example.superm.user;

import DataAccessObject.UtilisateurDAO;
import Entity.Utilisateur;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the registration page if accessed via GET
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        try {
            UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

            // Check if email already exists
            if (utilisateurDAO.existsByEmail(email)) {
                response.sendRedirect("register.jsp?error=email_exists");
                return;
            }

            // Check if passwords match
            if (!password.equals(confirmPassword)) {
                response.sendRedirect("register.jsp?error=password_mismatch");
                return;
            }

            // Create a new user
            Utilisateur user = new Utilisateur(first_name, last_name, email, password);
            utilisateurDAO.add(user);

            // Redirect to login page
            response.sendRedirect("login.jsp?success=account_created");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}