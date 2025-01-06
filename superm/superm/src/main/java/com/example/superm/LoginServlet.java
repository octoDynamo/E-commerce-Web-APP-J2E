package com.example.superm;

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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            Utilisateur user = new UtilisateurDAO().getByEmailAndPassword(email,password);
            if(user == null){
                response.sendRedirect("login.jsp");
            }else {
                UserNow.setRole(user.getRole());
                UserNow.setUser(user);
                int role = user.getRole();
                switch (role) {
                    case 1:
                        response.sendRedirect("dashboard.jsp");
                        break;
                    case 2:
                        response.sendRedirect("index.jsp");
                        break;
                    default:
                        response.sendRedirect("login.jsp");
                        break;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}



