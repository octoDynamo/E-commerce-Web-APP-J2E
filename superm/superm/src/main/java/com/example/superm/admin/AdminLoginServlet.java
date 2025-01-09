package com.example.superm.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Perform login validation logic here
        boolean isAdmin = true; // Example condition

        if (isAdmin) {
            // Forward to categories.jsp
            request.getRequestDispatcher("/admin/categories.jsp").forward(request, response);
        } else {
            // Redirect to login page
            response.sendRedirect("/login.jsp");
        }
    }
}
