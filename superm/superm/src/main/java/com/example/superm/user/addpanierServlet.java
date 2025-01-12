package com.example.superm.user;

import DataAccessObject.CommandeDAO;
import DataAccessObject.ProduitDAO;
import Entity.Commande;
import Entity.Produit;
import Entity.Utilisateur;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "addpanier", value = "/addpanier")
public class addpanierServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Parse input parameters
            int productId = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantite"));

            // Retrieve the logged-in user from the session
            HttpSession session = request.getSession(false);
            Utilisateur user = (session != null) ? (Utilisateur) session.getAttribute("user") : null;

            if (user != null) {
                ProduitDAO produitDAO = new ProduitDAO();
                Produit produit = produitDAO.getById(productId);

                if (produit == null) {
                    // Redirect with a product not found error
                    response.sendRedirect("products.jsp?error=product_not_found");
                    return;
                }

                // Check product stock
                if (produit.getQuantite() <= 0) {
                    // Redirect with an out-of-stock error
                    response.sendRedirect("products.jsp?error=out_of_stock");
                    return;
                }

                // Retrieve or initialize the cart
                List<Commande> cart = (List<Commande>) session.getAttribute("cart");
                if (cart == null) {
                    cart = new ArrayList<>();
                }

                // Check if the product already exists in the cart
                boolean exists = false;
                for (Commande commande : cart) {
                    if (commande.getProduit_id() == productId) {
                        // Check if the added quantity exceeds stock
                        if (commande.getQuantite() + quantity > produit.getQuantite()) {
                            response.sendRedirect("products.jsp?error=stock_exceeded");
                            return;
                        }
                        commande.setQuantite(commande.getQuantite() + quantity);
                        exists = true;
                        break;
                    }
                }

                // Add a new item if it doesn't already exist in the cart
                if (!exists) {
                    if (quantity > produit.getQuantite()) {
                        response.sendRedirect("products.jsp?error=stock_exceeded");
                        return;
                    }
                    Commande commande = new Commande();
                    commande.setUtilisateur_id(user.getId());
                    commande.setProduit_id(productId);
                    commande.setQuantite(quantity);
                    commande.setProduit(produit);
                    commande.setDate(java.time.LocalDate.now().toString());
                    cart.add(commande);
                }

                // Save the cart to the session
                session.setAttribute("cart", cart);

                // Redirect to the cart page
                response.sendRedirect("panier.jsp");
            } else {
                // If user is not logged in, redirect to login
                response.sendRedirect("login.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("products.jsp?error=invalid_quantity");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Unexpected%20error");
        }
    }
}
