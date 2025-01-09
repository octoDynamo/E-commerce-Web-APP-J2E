package com.example.superm.user;

import DataAccessObject.CommandeDAO;
import Entity.Commande;
import Entity.Utilisateur;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet(name = "addpanier", value = "/addpanier")
public class addpanierServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the main page if accessed via GET
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Parse input parameters
            int productId = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantite"));

            // Retrieve the logged-in user from the session
            HttpSession session = request.getSession(false); // Get existing session without creating a new one
            Utilisateur user = (session != null) ? (Utilisateur) session.getAttribute("user") : null;

            if (user != null) {
                // Create a new Commande object
                Commande commande = new Commande();
                commande.setUtilisateur_id(user.getId());
                commande.setProduit_id(productId);
                commande.setQuantite(quantity);
                commande.setDate(LocalDate.now().toString()); // Use current date dynamically

                // Save the commande to the database
                CommandeDAO commandeDAO = new CommandeDAO();
                commandeDAO.create(commande);

                // Debugging logs (optional)
                System.out.println("User ID: " + user.getId());
                System.out.println("Product ID: " + productId);
                System.out.println("Quantity: " + quantity);

                // Redirect to the cart page
                response.sendRedirect("panier.jsp");
            } else {
                // Redirect to login if the user is not logged in
                response.sendRedirect("login.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid input parameters
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Invalid%20input");
        } catch (SQLException e) {
            // Handle database-related errors
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Database%20error");
        } catch (Exception e) {
            // Handle any unexpected errors
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Unexpected%20error");
        }
    }
}
