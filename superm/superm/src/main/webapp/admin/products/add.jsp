<%--
  Created by IntelliJ IDEA.
  User: mahdi
  Date: 08/01/2025
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Add New Product</h2>

    <form action="../admin/products/insert" method="POST" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="nom" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="nom" name="nom" required>
            <div class="invalid-feedback">
                Please provide a product name.
            </div>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            <div class="invalid-feedback">
                Please provide a description.
            </div>
        </div>

        <div class="mb-3">
            <label for="prix" class="form-label">Price</label>
            <input type="number" class="form-control" id="prix" name="prix" step="0.01" required>
            <div class="invalid-feedback">
                Please provide a valid price.
            </div>
        </div>

        <div class="mb-3">
            <label for="image" class="form-label">Image URL</label>
            <input type="text" class="form-control" id="image" name="image" required>
            <div class="invalid-feedback">
                Please provide an image URL.
            </div>
        </div>

        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Add Product</button>
            <a href="list.jsp" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

<script>
    // Form validation
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>
