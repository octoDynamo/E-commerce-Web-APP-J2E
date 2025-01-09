package DataAccessObject;

import Entity.Utilisateur;
import connectiondb.connectiondb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UtilisateurDAO {

    private Connection connection;

    // Constructor to initialize database connection
    public UtilisateurDAO() {
        this.connection = connectiondb.getConnection();
    }

    // Add a new user with a dynamic role
    public void add(Utilisateur utilisateur) throws SQLException {
        String query = "INSERT INTO utilisateurs (nom, prenom, email, mot_de_passe, role) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, utilisateur.getNom());
            stmt.setString(2, utilisateur.getPrenom());
            stmt.setString(3, utilisateur.getEmail());
            stmt.setString(4, utilisateur.getMotDePasse());
            stmt.setInt(5, utilisateur.getRole()); // Dynamic role
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error adding user: " + e.getMessage());
        }
    }

    // Retrieve all users
    public List<Utilisateur> getAll() throws SQLException {
        String query = "SELECT * FROM utilisateurs";
        List<Utilisateur> utilisateurs = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Utilisateur utilisateur = mapRowToUtilisateur(rs);
                utilisateurs.add(utilisateur);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error retrieving all users: " + e.getMessage());
        }
        return utilisateurs;
    }

    // Retrieve user by ID
    public Utilisateur getById(int id) throws SQLException {
        String query = "SELECT * FROM utilisateurs WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapRowToUtilisateur(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error retrieving user by ID: " + e.getMessage());
        }
        return null;
    }

    // Retrieve user by email and password
    public Utilisateur getByEmailAndPassword(String email, String password) throws SQLException {
        String query = "SELECT * FROM utilisateurs WHERE email = ? AND mot_de_passe = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapRowToUtilisateur(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error retrieving user by email and password: " + e.getMessage());
        }
        return null;
    }

    // Count total users
    public int getCount() throws SQLException {
        String query = "SELECT COUNT(*) AS count FROM utilisateurs";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error counting users: " + e.getMessage());
        }
        return 0;
    }

    // Delete user by ID
    public void deleteById(int id) throws SQLException {
        String query = "DELETE FROM utilisateurs WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error deleting user by ID: " + e.getMessage());
        }
    }

    // Search users by name
    public List<Utilisateur> searchByName(String name) throws SQLException {
        String query = "SELECT * FROM utilisateurs WHERE nom LIKE ?";
        List<Utilisateur> utilisateurs = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, "%" + name + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Utilisateur utilisateur = mapRowToUtilisateur(rs);
                    utilisateurs.add(utilisateur);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error searching users by name: " + e.getMessage());
        }
        return utilisateurs;
    }

    // Map a ResultSet row to a Utilisateur object
    private Utilisateur mapRowToUtilisateur(ResultSet rs) throws SQLException {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId(rs.getInt("id"));
        utilisateur.setNom(rs.getString("nom"));
        utilisateur.setPrenom(rs.getString("prenom"));
        utilisateur.setEmail(rs.getString("email"));
        utilisateur.setMotDePasse(rs.getString("mot_de_passe"));
        utilisateur.setRole(rs.getInt("role"));
        return utilisateur;
    }
}
