package com.example.superm.admin;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import com.example.superm.UserNow;
import DataAccessObject.UtilisateurDAO;

@WebServlet(name = "AdminUser", value = "/admin/users")
public class AdminUserServlet extends HttpServlet {
    private UtilisateurDAO utilisateurDAO;

    public void init() {
        utilisateurDAO = new UtilisateurDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(UserNow.getRole() != 1) {
            response.sendRedirect("../login.jsp");
            return;
        }

        try {
            listUsers(request, response);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.setAttribute("users", utilisateurDAO.getAll());
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }
}