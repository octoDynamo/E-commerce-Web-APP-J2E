package com.example.superm.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "PaymentServlet", value = "/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Simuler le traitement du paiement
        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");

        // Ajouter une logique pour valider les données de paiement si nécessaire
        boolean paymentSuccess = true; // Simuler le succès du paiement

        if (paymentSuccess) {
            // Vider le panier
            HttpSession session = request.getSession();
            session.removeAttribute("cart");

            // Définir un message de succès
            session.setAttribute("paymentSuccess", "Le paiement a été effectué avec succès !");

            // Rediriger vers la page d'index
            response.sendRedirect("index.jsp");
        } else {
            // Rediriger vers une page d'erreur ou afficher un message d'échec
            response.sendRedirect("paiementcard.jsp?error=payment_failed");
        }
    }
}
