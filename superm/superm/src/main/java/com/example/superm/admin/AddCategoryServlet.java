package com.example.superm.admin;

import DataAccessObject.CategorieDAO;
import Entity.Categorie;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/addCategory")
public class AddCategoryServlet extends HttpServlet {
    private CategorieDAO categorieDAO;

    @Override
    public void init() throws ServletException {
        categorieDAO = new CategorieDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Categorie categorie = new Categorie();
        categorie.setName(name);
        categorie.setDescription(description);

        categorieDAO.addCategory(categorie);
        response.sendRedirect("categories.jsp"); // Redirect to the categories page after adding
    }
}