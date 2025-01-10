package com.example.superm.admin;

import DataAccessObject.ProduitDAO;
import Entity.Produit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

@WebServlet(name = "ProductServlet", value = "/admin/ProductServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class ProductServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form fields
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String category = request.getParameter("category");

        // Handle file upload
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Extract filename
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        // Ensure upload directory exists
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save file to server
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Create product object
        Produit produit = new Produit();
        produit.setNom(name);
        produit.setDescription(description);
        produit.setPrix(price);
        produit.setQuantite(quantity);
        produit.setCategorie(category);
        produit.setImage(UPLOAD_DIRECTORY + "/" + fileName); // Store relative path to the image

        // Save product to database
        try {
            ProduitDAO produitDAO = new ProduitDAO();
            produitDAO.create(produit);
            response.sendRedirect("products.jsp?success=true");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("products.jsp?error=true");
        }
    }
}
