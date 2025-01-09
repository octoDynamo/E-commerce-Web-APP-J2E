package DataAccessObject;

import Entity.Commande;
import connectiondb.connectiondb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommandeDAO {
    private Connection connection;

    public CommandeDAO() {
        this.connection = connectiondb.getConnection();
    }

    // Create a new order
    public void create(Commande commande) throws SQLException {
        String sql = "INSERT INTO commandes (utilisateur_id, produit_id, quantite, date) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, commande.getUtilisateur_id());
            statement.setInt(2, commande.getProduit_id());
            statement.setInt(3, commande.getQuantite());
            statement.setString(4, commande.getDate());
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Command added to database successfully!");
            }
        }
    }

    // Retrieve all orders
    public List<Commande> findAll() throws SQLException {
        List<Commande> commandes = new ArrayList<>();
        String sql = "SELECT * FROM commandes";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Commande commande = mapRowToCommande(resultSet);
                commandes.add(commande);
            }
        }
        return commandes;
    }

    // Count total orders
    public int getCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM commandes";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("count");
            }
        }
        return 0;
    }

    // Retrieve orders by user ID
    public List<Commande> findByUserId(int userId) throws SQLException {
        List<Commande> commandes = new ArrayList<>();
        String sql = "SELECT * FROM commandes WHERE utilisateur_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Commande commande = mapRowToCommande(resultSet);
                    commandes.add(commande);
                }
            }
        }
        return commandes;
    }

    // Delete an order by ID
    public void deleteById(int id) throws SQLException {
        String sql = "DELETE FROM commandes WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // Map ResultSet row to Commande object
    private Commande mapRowToCommande(ResultSet resultSet) throws SQLException {
        Commande commande = new Commande();
        commande.setId(resultSet.getInt("id"));
        commande.setUtilisateur_id(resultSet.getInt("utilisateur_id"));
        commande.setProduit_id(resultSet.getInt("produit_id"));
        commande.setQuantite(resultSet.getInt("quantite"));
        commande.setDate(resultSet.getString("date"));
        return commande;
    }
}
