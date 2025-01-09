package DataAccessObject;

import Entity.Produit;
import connectiondb.connectiondb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProduitDAO {
    private final Connection connection;

    public ProduitDAO() {
        this.connection = connectiondb.getConnection();
    }

    // Method to delete a product by ID
    public void deleteById(int id) throws SQLException {
        String sql = "DELETE FROM produits WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error deleting product with ID " + id + ": " + e.getMessage());
        }
    }

    // Method to create a new product
    public int create(Produit produit) throws SQLException {
        String sql = "INSERT INTO produits (nom, description, prix, image) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
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
                    return produit.getId();
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Error creating product: " + e.getMessage());
        }
    }

    // Retrieve all products
    public List<Produit> getAll() throws SQLException {
        List<Produit> produits = new ArrayList<>();
        String sql = "SELECT id, nom, description, prix, image FROM produits";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Produit produit = mapRowToProduit(rs);
                produits.add(produit);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving all products: " + e.getMessage());
        }
        return produits;
    }

    // Retrieve a product by ID
    public Produit getById(int id) throws SQLException {
        String sql = "SELECT id, nom, description, prix, image FROM produits WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapRowToProduit(rs);
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving product with ID " + id + ": " + e.getMessage());
        }
        return null;
    }

    // Update an existing product
    public void update(Produit produit) throws SQLException {
        String sql = "UPDATE produits SET nom = ?, description = ?, prix = ?, image = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, produit.getNom());
            stmt.setString(2, produit.getDescription());
            stmt.setDouble(3, produit.getPrix());
            stmt.setString(4, produit.getImage());
            stmt.setInt(5, produit.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error updating product with ID " + produit.getId() + ": " + e.getMessage());
        }
    }

    // Get the total count of products
    public int getCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM produits";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException e) {
            throw new SQLException("Error counting products: " + e.getMessage());
        }
        return 0;
    }

    // Map a ResultSet row to a Produit object
    private Produit mapRowToProduit(ResultSet rs) throws SQLException {
        Produit produit = new Produit();
        produit.setId(rs.getInt("id"));
        produit.setNom(rs.getString("nom"));
        produit.setDescription(rs.getString("description"));
        produit.setPrix(rs.getDouble("prix"));
        produit.setImage(rs.getString("image"));
        return produit;
    }
}
