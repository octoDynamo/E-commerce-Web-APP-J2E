package com.example.superm.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.Iterator;

import Entity.Commande;

@WebServlet(name = "RemoveFromCartServlet", value = "/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product ID to remove
        int productId = Integer.parseInt(request.getParameter("id"));

        // Get the cart from the session
        HttpSession session = request.getSession();
        List<Commande> cart = (List<Commande>) session.getAttribute("cart");

        if (cart != null) {
            // Use an iterator to safely remove the item
            Iterator<Commande> iterator = cart.iterator();
            while (iterator.hasNext()) {
                Commande commande = iterator.next();
                if (commande.getProduit_id() == productId) {
                    iterator.remove();
                    break;
                }
            }

            // Update the cart in the session
            session.setAttribute("cart", cart);
        }

        // Redirect back to the cart page
        response.sendRedirect("panier.jsp");
    }
}
