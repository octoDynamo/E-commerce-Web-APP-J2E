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
<%
    double sum  = 0;
%>
<% for (Commande cmd : commandeList) {
    sum+=cmd.getQuantite()*(new ProduitDAO().getById(cmd.getProduit_id()).getPrix());
%>
<% } %>
<section class="p-4 p-md-5" style="
    background-image: url(https://mdbcdn.b-cdn.net/img/Photos/Others/background3.webp);
  ">
    <div class="row d-flex justify-content-center">
        <div class="col-md-10 col-lg-8 col-xl-5">
            <div class="card rounded-3">
                <div class="card-body p-4">
                    <div class="text-center mb-4">
                        <h3>Settings</h3>
                        <h6>Payment(<%=sum%> MAD)</h6>
                    </div>
                    <form action="">

                        <p class="fw-bold mb-4">Add new card:</p>

                        <div class="form-outline mb-4">
                            <input type="text" id="formControlLgXsd" class="form-control form-control-lg"
                                   value="AIMAN ZAKARIA" />
                            <label class="form-label" for="formControlLgXsd">Cardholder's Name</label>
                        </div>

                        <div class="row mb-4">
                            <div class="col-7">
                                <div class="form-outline">
                                    <input type="text" id="formControlLgXM" class="form-control form-control-lg"
                                           value="1234 5678 1234 5678" />
                                    <label class="form-label" for="formControlLgXM">Card Number</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-outline">
                                    <input type="password" id="formControlLgExpk" class="form-control form-control-lg"
                                           placeholder="MM/YYYY" />
                                    <label class="form-label" for="formControlLgExpk">Expire</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="form-outline">
                                    <input type="password" id="formControlLgcvv" class="form-control form-control-lg"
                                           placeholder="Cvv" />
                                    <label class="form-label" for="formControlLgcvv">Cvv</label>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-success btn-lg btn-block" >Valider paiement</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Ajouter Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/">
</script>
</body>
</html>

