package DataAccessObject;

import Entity.Commande;
import connectiondb.connectiondb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommandeDAO {
    private final Connection connection;

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
            statement.executeUpdate();
            System.out.println("Commande ajoutée: UserID=" + commande.getUtilisateur_id() +
                    ", ProductID=" + commande.getProduit_id() +
                    ", Quantity=" + commande.getQuantite());
        } catch (SQLException e) {
            System.err.println("Erreur lors de la création de la commande: " + e.getMessage());
            throw e;
        }
    }

    // Retrieve all orders
    public List<Commande> getAll() throws SQLException {
        List<Commande> commandes = new ArrayList<>();
        String sql = "SELECT * FROM commandes"; // Adjust table name if necessary
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Commande commande = mapRowToCommande(rs);
                commandes.add(commande);
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des commandes: " + e.getMessage());
            throw e;
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
        } catch (SQLException e) {
            System.err.println("Erreur lors du comptage des commandes: " + e.getMessage());
            throw e;
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

                    // Debugging logs
                    System.out.println("Commande récupérée: ID=" + commande.getId() +
                            ", UserID=" + commande.getUtilisateur_id() +
                            ", ProductID=" + commande.getProduit_id() +
                            ", Quantity=" + commande.getQuantite());
                }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des commandes pour l'utilisateur ID=" + userId + ": " + e.getMessage());
            throw e;
        }
        return commandes;
    }

    // Delete an order by ID
    public void deleteById(int id) throws SQLException {
        String sql = "DELETE FROM commandes WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Commande supprimée avec succès: ID=" + id);
            } else {
                System.out.println("Aucune commande trouvée avec l'ID=" + id);
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la suppression de la commande ID=" + id + ": " + e.getMessage());
            throw e;
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
