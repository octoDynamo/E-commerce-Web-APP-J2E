package com.example.superm.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.example.superm.UserNow;

@WebServlet(name = "AdminDashboard", value = "/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(UserNow.getRole() == 1) {
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        } else {
            response.sendRedirect("../login.jsp");
        }
    }
}
