<%@ page import="java.util.List" %>
<%@ page import="Entity.Commande" %>
<%@ page import="com.example.superm.Command" %>
<%@ page import="DataAccessObject.ProduitDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Commande> commandeList = Command.get();
    double sum = 0;
    for (Commande cmd : commandeList) {
        sum += cmd.getQuantite() * (new ProduitDAO().getById(cmd.getProduit_id()).getPrix());
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7f3fc;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .btn-success {
            background-color: #9b59b6;
            border: none;
        }
        .btn-success:hover {
            background-color: #8e44ad;
        }
        .form-control {
            border: 1px solid #9b59b6;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #8e44ad;
        }
        .form-label {
            color: #6c757d;
        }
    </style>
</head>
<body>
<section class="p-4 p-md-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-10 col-lg-8 col-xl-5">
            <div class="card rounded-3">
                <div class="card-body p-4">
                    <div class="text-center mb-4">
                        <h3 style="color: #8e44ad;">Payment</h3>
                        <h6>Total: <span style="color: #8e44ad; font-weight: bold;"> <%=sum%> MAD</span></h6>
                    </div>
                    <form>
                        <p class="fw-bold mb-4">Add New Card:</p>

                        <div class="form-outline mb-4">
                            <input type="text" id="cardholderName" class="form-control form-control-lg" placeholder="John Doe" required />
                            <label class="form-label" for="cardholderName">Cardholder's Name</label>
                        </div>

                        <div class="row mb-4">
                            <div class="col-7">
                                <div class="form-outline">
                                    <input type="text" id="cardNumber" class="form-control form-control-lg" placeholder="1234 5678 1234 5678" required />
                                    <label class="form-label" for="cardNumber">Card Number</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-outline">
                                    <input type="text" id="expiryDate" class="form-control form-control-lg" placeholder="MM/YYYY" required />
                                    <label class="form-label" for="expiryDate">Expire</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="form-outline">
                                    <input type="text" id="cvv" class="form-control form-control-lg" placeholder="Cvv" required />
                                    <label class="form-label" for="cvv">Cvv</label>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success btn-lg btn-block">Validate Payment</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
