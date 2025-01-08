package DataAccessObject;

import Entity.Utilisateur;
import connectiondb.connectiondb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtilisateurDAO {

    private Connection connection;

    public UtilisateurDAO() {
        this.connection = connectiondb.getConnection();
    }

    // Add user with dynamic role
    public void add(Utilisateur utilisateur) throws SQLException {
        String query = "INSERT INTO utilisateurs (nom, prenom, email, mot_de_passe, role) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, utilisateur.getNom());
            stmt.setString(2, utilisateur.getPrenom());
            stmt.setString(3, utilisateur.getEmail());
            stmt.setString(4, utilisateur.getMotDePasse());
            stmt.setInt(5, utilisateur.getRole()); // Dynamic role
            stmt.executeUpdate();
        }
    }

    // Retrieve all users
    public List<Utilisateur> getAll() throws SQLException {
        String query = "SELECT * FROM utilisateurs";
        List<Utilisateur> utilisateurs = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Utilisateur utilisateur = new Utilisateur();
                utilisateur.setId(rs.getInt("id"));
                utilisateur.setNom(rs.getString("nom"));
                utilisateur.setPrenom(rs.getString("prenom"));
                utilisateur.setEmail(rs.getString("email"));
                utilisateur.setMotDePasse(rs.getString("mot_de_passe"));
                utilisateur.setRole(rs.getInt("role"));
                utilisateurs.add(utilisateur);
            }
        }
        return utilisateurs;
    }

    // Retrieve user by ID
    public Utilisateur getById(int id) throws SQLException {
        String query = "SELECT * FROM utilisateurs WHERE id = ?";
        Utilisateur utilisateur = null;
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    utilisateur = new Utilisateur();
                    utilisateur.setId(rs.getInt("id"));
                    utilisateur.setNom(rs.getString("nom"));
                    utilisateur.setPrenom(rs.getString("prenom"));
                    utilisateur.setEmail(rs.getString("email"));
                    utilisateur.setMotDePasse(rs.getString("mot_de_passe"));
                    utilisateur.setRole(rs.getInt("role"));
                }
            }
        }
        return utilisateur;
    }

    // Retrieve user by email and password
    public Utilisateur getByEmailAndPassword(String email, String password) throws SQLException {
        String query = "SELECT * FROM utilisateurs WHERE email = ? AND mot_de_passe = ?";
        Utilisateur utilisateur = null;
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    utilisateur = new Utilisateur();
                    utilisateur.setId(rs.getInt("id"));
                    utilisateur.setNom(rs.getString("nom"));
                    utilisateur.setPrenom(rs.getString("prenom"));
                    utilisateur.setEmail(rs.getString("email"));
                    utilisateur.setMotDePasse(rs.getString("mot_de_passe"));
                    utilisateur.setRole(rs.getInt("role"));
                }
            }
        }
        return utilisateur;
    }
}
