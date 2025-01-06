<%@ page import="java.util.List" %>
<%@ page import="Entity.Commande" %>
<%@ page import="com.example.superm.Command" %>
<%@ page import="DataAccessObject.ProduitDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List < Commande> commandeList = Command.get();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panier</title>
    <!-- Ajouter Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<!-- Ajouter un header -->
<header class="container-fluid bg-primary text-white p-3">
    <h1 class="text-center">Panier</h1>
</header>

<!-- Ajouter un conteneur pour le corps de la page -->
<div class="container mt-5">
    <!-- Ajouter un tableau pour afficher la liste des produits -->
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>produits</th>
            <th>Quantité</th>
            <th>prix</th>
            <th>Supprimer</th>
        </tr>
        </thead>
        <tbody>
        <!-- Boucle à travers la liste des produits et afficher les détails -->
        <%
            double sum  = 0;
        %>
        <% for (Commande cmd : commandeList) {
            sum+=cmd.getQuantite()*(new ProduitDAO().getById(cmd.getProduit_id()).getPrix());
        %>
            <tr>

                <td><%= new ProduitDAO().getById(cmd.getProduit_id()).getNom() %></td>
                <td><%=cmd.getQuantite()%></td>
                <td><%= new ProduitDAO().getById(cmd.getProduit_id()).getPrix() %></td>
                <td>
                    <form>
                        <input type="hidden" name="id" value="<%=cmd.getId()%>">
                        <button type="submit" class="bg-danger">
                            supprimer
                        </button>
                    </form>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <!-- Ajouter un bouton pour passer au paiement -->
    <form action="paiementcard.jsp" method="post">
        <button class="btn btn-primary float-right" >Passez au paiement via Credit card(<%=sum%> MAD)</button>
    </form>
    <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
        <input type="hidden" name="cmd" value="_xclick">
        <input type="hidden" name="business" value="workoutaiman@hotmail.com">
        <input type="hidden" name="item_name" value="aimht">
        <input type="hidden" name="amount" value="<%=sum/10%>">
        <input type="hidden" name="currency_code" value="EUR">
        <input type="image" src="https://www.paypal.com/fr_FR/FR/i/btn/btn_buynow_LG.gif"
               border="0" name="submit" alt="Payez avec PayPal - c'est simple, rapide et sécurisé">
    </form>
</div>

<!-- Ajouter Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/">
</script>
</body>
</html>

