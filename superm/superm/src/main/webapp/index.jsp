<%@ page import="com.example.superm.UserNow" %>
<%@ page import="DataAccessObject.ProduitDAO" %>
<%@ page import="Entity.Produit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>


<%
    List<Produit> produitList = new ArrayList<>();
    try {
        produitList = new ProduitDAO().getAll();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>supermarket</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
<nav class="navbar navbar-light navbar-expand-lg bg-light">
    <div class="container"><a class="navbar-brand" href="#"><h5 class="nav-name">SuperM</h5></a><button data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" class="navbar-toggler" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent"><ul class="navbar-nav  m-auto">

            <ul class="navbar-nav m-auto">

                <li class="nav-item">
                    <a class="nav-link " href="index.jsp" role="button" aria-expanded="false">
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="user/panier.jsp" role="button" aria-expanded="false">
                        Panier
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="user/login.jsp" role="button" aria-expanded="false">
                        <% if (UserNow.getRole()!=0){%>
                        Logout
                        <%} else{%>
                        login
                        <%}%>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="user/login.jsp" aria-expanded="false">
                        <h4><%= UserNow.getUser().getNom()+" "+UserNow.getUser().getPrenom()%></h4>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<section class="mt-5">
    <div class="container">
        <div class="img-main-banner"></div>
    </div>
</section>
<section>
    <div class="container mt-5 salessection">
        <div class="row">
            <div class="col-12 col-lg-6 mb-3 mb-lg-0">
                <div>
                    <div class="py-10 px-8 rounded-3" style="background: url(assets/img/grocery-banner.png)no-repeat;background-size: cover;background-position: center;padding: 20px;">
                        <div>
                            <h3 class="fw-bold mb-1">Fruits &amp; Vegetables </h3>
                            <p class="mb-4">Get Upto <span class="fw-bold">30%</span> Off</p><a class="btn btn-dark" role="button" href="#!">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-6">
                <div>
                    <div class="py-10 px-8 rounded-3" style="background: url(assets/img/grocery-banner-2.jpg)no-repeat;background-size: cover;background-position: center;padding: 20px;">
                        <div>
                            <h3 class="fw-bold mb-1">Freshly Baked Buns </h3>
                            <p class="mb-4">Get Upto <span class="fw-bold">25%</span> Off</p><a class="btn btn-dark" role="button" href="#!">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="my-lg-14 my-8">
    <div class="container">
        <div class="row">
            <div class="col-12 mb-6">
                <h3 class="mb-4 nav-name">Popular Products</h3>
            </div>
        </div>
        <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-4">
                <% for(Produit P : produitList) {%>
            <%
                System.out.println("\""+P.getImage()+"\"");
            %>
            <div class="col">
                <div class="card card-product">
                    <div class="card-body">
                        <div class="text-center position-relative">
                            <div class="position-absolute top-0 start-0"></div><a href="#!"><img class="img-fluid mb-3" src=<%= "\""+P.getImage()+"\"" %> alt="SUPERM"></a>
                        </div>
                        <div class="text-small mb-1"><a href="#!" class="text-decoration-none text-muted"><small><%=P.getNom()%></small></a></div>
                        <h2 class="fs-6"><a href="#!" class="text-inherit text-dark text-decoration-none"><%=P.getDescription()%></a></h2>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div>  <span class="text-dark"><%= P.getPrix()%>MAD
                                <div>
<form action = "addpanier" method="post">
                                <input type="hidden" name="id" value="<%=P.getId()%>">
                                <input type="number" name="quantite" value="1" style="width:40px;">
                                <button type="submit" class="bg-success" >Add</button>
                            </form>
                            </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
</section>
<div class="container border-top py-4">
    <div class="row align-items-center me-5">
        <div class="col-md-6"><span class="text-muted small">Copyright 2022 © superm</span></div>
    </div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>