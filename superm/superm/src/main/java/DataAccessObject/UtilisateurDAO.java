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

    public void add(Utilisateur utilisateur) throws SQLException {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = connectiondb.getConnection();
            stmt = connection.prepareStatement(
                    "INSERT INTO utilisateurs (nom, prenom, email, mot_de_passe, role) VALUES (?, ?, ?, ?, 2)"
            );

            stmt.setString(1, utilisateur.getNom());
            stmt.setString(2, utilisateur.getPrenom());
            stmt.setString(3, utilisateur.getEmail());
            stmt.setString(4, utilisateur.getMotDePasse());

            stmt.executeUpdate();
        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (connection != null) try { connection.close(); } catch (SQLException e) { /* ignored */ }
        }
    }

    public List<Utilisateur> getAll() throws SQLException {
        List<Utilisateur> utilisateurs = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = connectiondb.getConnection();
            stmt = connection.prepareStatement("SELECT * FROM utilisateurs");
            rs = stmt.executeQuery();

            while (rs.next()) {
                utilisateurs.add(mapResultSetToUtilisateur(rs));
            }
            return utilisateurs;

        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignored */ }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (connection != null) try { connection.close(); } catch (SQLException e) { /* ignored */ }
        }
    }

    public Utilisateur getById(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = connectiondb.getConnection();
            stmt = connection.prepareStatement("SELECT * FROM utilisateurs WHERE id = ?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToUtilisateur(rs);
            }
            return null;

        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignored */ }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (connection != null) try { connection.close(); } catch (SQLException e) { /* ignored */ }
        }
    }

    public Utilisateur getByEmailAndPassword(String email, String password) throws SQLException {
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = connectiondb.getConnection();
            stmt = connection.prepareStatement("SELECT * FROM utilisateurs WHERE email = ? AND mot_de_passe = ?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToUtilisateur(rs);
            }
            return null;

        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignored */ }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (connection != null) try { connection.close(); } catch (SQLException e) { /* ignored */ }
        }
    }

    public void update(Utilisateur utilisateur) throws SQLException {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = connectiondb.getConnection();
            stmt = connection.prepareStatement(
                    "UPDATE utilisateurs SET nom = ?, prenom = ?, email = ?, mot_de_passe = ?, role = ? WHERE id = ?"
            );

            stmt.setString(1, utilisateur.getNom());
            stmt.setString(2, utilisateur.getPrenom());
            stmt.setString(3, utilisateur.getEmail());
            stmt.setString(4, utilisateur.getMotDePasse());
            stmt.setInt(5, utilisateur.getRole());
            stmt.setInt(6, utilisateur.getId());

            stmt.executeUpdate();
        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (connection != null) try { connection.close(); } catch (SQLException e) { /* ignored */ }
        }
    }

    public void delete(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = connectiondb.getConnection();
            // First delete from commandes
            stmt = connection.prepareStatement("DELETE FROM commandes WHERE utilisateur_id = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            stmt.close();

            // Then delete the user
            stmt = connection.prepareStatement("DELETE FROM utilisateurs WHERE id = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();

        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (connection != null) try { connection.close(); } catch (SQLException e) { /* ignored */ }
        }
    }

    public void updateRole(int userId, int newRole) throws SQLException {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = connectiondb.getConnection();
            stmt = connection.prepareStatement("UPDATE utilisateurs SET role = ? WHERE id = ?");
            stmt.setInt(1, newRole);
            stmt.setInt(2, userId);
            stmt.executeUpdate();

        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (connection != null) try { connection.close(); } catch (SQLException e) { /* ignored */ }
        }
    }

    private Utilisateur mapResultSetToUtilisateur(ResultSet rs) throws SQLException {
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