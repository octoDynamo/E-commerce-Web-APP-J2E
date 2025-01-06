package com.example.superm;

import DataAccessObject.CommandeDAO;
import Entity.Commande;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "addpanier", value = "/addpanier")
public class addpanierServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        if(UserNow.getRole()!=0){
            Commande Cmd = new Commande();
            Cmd.setUtilisateur_id(UserNow.getUser().getId());
            Cmd.setProduit_id(id);
            Cmd.setQuantite(quantite);
            Cmd.setDate("2023-01-30");
            Command.add(Cmd);
            System.out.println(UserNow.getUser().getId());
            try {
                new CommandeDAO().create(Cmd);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            response.sendRedirect("panier.jsp");
        }else{
            response.sendRedirect("login.jsp");
        }

    }
}
