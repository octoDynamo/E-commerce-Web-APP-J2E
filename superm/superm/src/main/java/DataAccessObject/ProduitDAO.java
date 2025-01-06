package DataAccessObject;

import Entity.Produit;
import connectiondb.connectiondb;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProduitDAO {
    private Connection connection;

    public ProduitDAO() {
        this.connection = connectiondb.getConnection();
    }

    public int create(Produit produit) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("INSERT INTO produits (nom, description, prix, image) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, produit.getNom());
        stmt.setString(2, produit.getDescription());
        stmt.setDouble(3, produit.getPrix());
        stmt.setString(4, produit.getImage());
        int affectedRows = stmt.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Creating product failed, no rows affected.");
        }
        try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                produit.setId(generatedKeys.getInt(1));
            } else {
                throw new SQLException("Creating product failed, no ID obtained.");
            }
        }
        stmt.close();
        return produit.getId();
    }

    public List<Produit> getAll() throws SQLException {
        List<Produit> produits = new ArrayList<>();
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM produits");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Produit produit = new Produit();
            produit.setId(rs.getInt("id"));
            produit.setNom(rs.getString("nom"));
            produit.setDescription(rs.getString("description"));
            produit.setPrix(rs.getDouble("prix"));
            produit.setImage(rs.getString("image"));
            produits.add(produit);
        }
        rs.close();
        stmt.close();
        return produits;
    }

    public Produit getById(int id) throws SQLException {
        Produit produit = null;
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM produits WHERE id = ?");
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            produit = new Produit();
            produit.setId(rs.getInt("id"));
            produit.setNom(rs.getString("nom"));
            produit.setDescription(rs.getString("description"));
            produit.setPrix(rs.getDouble("prix"));
            produit.setImage(rs.getString("image"));
        }
        rs.close();
        stmt.close();
        return produit;
    }

    public void update(Produit produit) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("UPDATE produits SET nom = ?, description = ?, prix = ?, image = ? WHERE id = ?");
        stmt.setString(1, produit.getNom());
        stmt.setString(2, produit.getDescription());
        stmt.setDouble(3, produit.getPrix());
        stmt.setString(4, produit.getImage());
        stmt.setInt(5, produit.getId());
        stmt.executeUpdate();
        stmt.close();
    }

    public void delete(int id) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("DELETE FROM produits WHERE id = ?");
        stmt.setInt(1, id);
        stmt.executeUpdate();
        stmt.close();
    }
}
