<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - admin</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/Table-With-Search-search-table.css">
    <link rel="stylesheet" href="assets/css/Table-With-Search.css">
</head>

<body id="page-top">
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: rgb(27,215,136);color: rgb(0,0,0);">
        <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
            <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-landmark" style="color: #000000;"></i></div>
            <div class="sidebar-brand-text mx-3"><span style="color: #000000;">admin</span></div>
        </a>
            <hr class="sidebar-divider my-0">
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link" href="index.jsp"><i class="fas fa-tachometer-alt"></i><span style="color: rgba(0,0,0,0.8);">Dashboard</span></a><a class="nav-link" href="error.jsp" style="color: #000000;"><i class="fas fa-tachometer-alt"></i><span>utilisateur</span></a><a class="nav-link" href="error.jsp" style="color: #000000;"><i class="fas fa-tachometer-alt"></i><span><span style="font-weight: normal !important; background-color: rgb(27, 215, 136);">Categorie </span></span></a><a class="nav-link" href="error.jsp" style="color: #000000;"><i class="fas fa-tachometer-alt"></i><span><span style="font-weight: normal !important; background-color: rgb(27, 215, 136);">ProduitCategorie </span></span></a><a class="nav-link" href="error.jsp" style="color: #000000;"><i class="fas fa-tachometer-alt"></i><span><span style="font-weight: normal !important; background-color: rgb(27, 215, 136);">Commande</span></span></a><a class="nav-link" href="error.jsp" style="color: #000000;"><i class="fas fa-tachometer-alt"></i><span><span style="font-weight: normal !important; background-color: rgb(27, 215, 136);">Produit </span></span></a></li>
            </ul>
            <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
        </div>
    </nav>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content" style="color: #000000;">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                    <ul class="navbar-nav flex-nowrap ms-auto">
                        <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                            <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                <form class="me-auto navbar-search w-100">
                                    <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                        <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                    </div>
                                </form>
                            </div>
                        </li>


                    </ul>
                </div>
            </nav>
            <form action="ProductServlet" method="post" enctype="multipart/form-data">


                <div class="col-md-6 offset-md-3 mt-5">
                    <br>
                    <form accept-charset="UTF-8" action="https://getform.io/f/{your-form-endpoint-goes-here}" method="POST" enctype="multipart/form-data" target="_blank">
                        <div class="form-group">
                            <label for="exampleInputName">Nom de produit</label>
                            <input type="text" name="name" id="name" class="form-control" id="exampleInputName" placeholder="Enter le nom de produit" required="required">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1" required="required">Description de produit</label>
                            <input type="text" name="description" id="description" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter la description de produit">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1" required="required">Prix</label>
                            <input type="number" name="x" id="price" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="prix">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1" required="required">Quantite</label>
                            <input type="number" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="la quantite minium c'est 1">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Categorie</label>
                            <select class="form-control" id="exampleFormControlSelect1" name="platform" required="required">
                                <option>Electronic</option>
                                <option>Vetement</option>
                                <option>Sport</option>
                            </select>
                        </div>
                        <hr>
                        <div class="form-group mt-3">
                            <label class="mr-2">telecharger image de produit:</label>
                            <input type="file" name="image" id="image">
                        </div>
                        <hr>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </form>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © admin 2023</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Table-With-Search-search-table.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>