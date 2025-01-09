package com.example.superm.admin;

import DataAccessObject.CategorieDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/deleteCategory")
public class DeleteCategoryServlet extends HttpServlet {
    private CategorieDAO categorieDAO;

    @Override
    public void init() throws ServletException {
        categorieDAO = new CategorieDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        categorieDAO.deleteCategory(id);
        response.sendRedirect("admin/categories.jsp");
    }
}
