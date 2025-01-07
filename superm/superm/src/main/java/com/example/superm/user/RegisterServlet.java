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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name=request.getParameter("first_name");
        String last_name=request.getParameter("last_name");
        String birthday=request.getParameter("birthday");
        String gender=request.getParameter("gender");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String password=request.getParameter("password");
        Utilisateur USR = new Utilisateur(first_name,last_name,email,password);
        try {
            new UtilisateurDAO().add(USR);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("login.jsp");
    }
}
