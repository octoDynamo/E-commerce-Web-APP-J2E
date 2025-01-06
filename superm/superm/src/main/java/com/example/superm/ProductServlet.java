package com.example.superm;

import DataAccessObject.ProduitDAO;
import Entity.Produit;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
@MultipartConfig
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("x");
        if (priceStr == null || priceStr.trim().isEmpty()) {
            System.out.println("nulll jdijqd hjwkid kjj kjdhw jdwj ");
        } else {
            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();
            InputStream fileContent = filePart.getInputStream();
            // Enregistrer l'image sur le disque dur
            String savePath = "C://Users//AI-MHT//Desktop//superm//superm//src//main//webapp//images";
            File file = new File(savePath + File.separator + fileName);
            Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            Double prix = Double.parseDouble(priceStr);
            System.out.println(name+description+prix);
            Produit produit = new Produit();
            produit.setId(1);
            produit.setNom(name);
            produit.setDescription(description);
            produit.setImage("images/"+fileName);
            produit.setPrix(prix);
            try {
                new ProduitDAO().create(produit);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            response.sendRedirect("addproduct.jsp");
        }
    }
}
