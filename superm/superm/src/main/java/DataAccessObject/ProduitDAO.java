package DataAccessObject;

import Entity.Produit;
import connectiondb.connectiondb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProduitDAO {
    private Connection connection;

    public ProduitDAO() {
        this.connection = connectiondb.getConnection();
    }

    // Method to delete a product by ID
    public void deleteById(int id) throws SQLException {
        String sql = "DELETE FROM produits WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    // Other methods in ProduitDAO remain unchanged...
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
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
        }
        return produit.getId();
    }

    public List<Produit> getAll() throws SQLException {
        List<Produit> produits = new ArrayList<>();
        String sql = "SELECT * FROM produits";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Produit produit = mapRowToProduit(rs);
                produits.add(produit);
            }
        }
        return produits;
    }

    public Produit getById(int id) throws SQLException {
        String sql = "SELECT * FROM produits WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Produit produit = new Produit();
                    produit.setId(resultSet.getInt("id"));
                    produit.setNom(resultSet.getString("nom"));
                    produit.setDescription(resultSet.getString("description"));
                    produit.setPrix(resultSet.getDouble("prix"));
                    produit.setImage(resultSet.getString("image"));

                    // Debugging logs
                    System.out.println("Fetched Produit: ID=" + produit.getId() +
                            ", Name=" + produit.getNom() + ", Price=" + produit.getPrix());
                    return produit;
                }
            }
        }
        return null;
    }

    public void update(Produit produit) throws SQLException {
        String sql = "UPDATE produits SET nom = ?, description = ?, prix = ?, image = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, produit.getNom());
            stmt.setString(2, produit.getDescription());
            stmt.setDouble(3, produit.getPrix());
            stmt.setString(4, produit.getImage());
            stmt.setInt(5, produit.getId());
            stmt.executeUpdate();
        }
    }

    public int getCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM produits";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

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
