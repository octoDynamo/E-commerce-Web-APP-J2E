<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produits Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <h1>Ajouter un Produit</h1>
    <div class="form-container">
        <form action="ProductServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Nom du produit</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
            </div>

            <div class="form-group">
                <label for="price">Prix</label>
                <input type="number" id="price" name="price" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="quantity">Quantité</label>
                <input type="number" id="quantity" name="quantity" class="form-control" min="1" required>
            </div>

            <div class="form-group">
                <label for="category">Catégorie</label>
                <select id="category" name="category" class="form-control" required>
                    <option value="electronic">Électronique</option>
                    <option value="clothing">Vêtements</option>
                    <option value="sport">Sport</option>
                </select>
            </div>

            <div class="form-group">
                <label for="image">Image du produit</label>
                <div class="file-upload">
                    <input type="file" id="image" name="image" accept="image/*" required>
                </div>
            </div>

            <button type="submit" class="submit-btn">
                <i class="fas fa-save"></i> Enregistrer le produit
            </button>
        </form>
    </div>
</div>
</body>
</html>
