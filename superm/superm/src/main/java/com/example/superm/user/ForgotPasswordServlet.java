package com.example.superm.user;

import DataAccessObject.UtilisateurDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ForgotPasswordServlet", value = "/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try {
            UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

            // Check if email exists
            if (utilisateurDAO.existsByEmail(email)) {
                // Redirect to reset password page if email exists
                request.setAttribute("email", email);
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            } else {
                // Redirect back to verification page with an error message
                response.sendRedirect("passwordVerification.jsp?error=email_not_found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
