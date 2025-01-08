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

    public void add(Utilisateur utilisateur) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("INSERT INTO utilisateurs (nom,prenom, email, mot_de_passe,role) VALUES (?,?, ?, ?,2)");
        stmt.setString(1, utilisateur.getNom());
        stmt.setString(2, utilisateur.getPrenom());
        stmt.setString(3, utilisateur.getEmail());
        stmt.setString(4, utilisateur.getMotDePasse());
        stmt.execute();
        stmt.close();
    }

    public List<Utilisateur> getAll() throws SQLException {
        List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM utilisateurs");
        ResultSet rs = stmt.executeQuery();
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
        rs.close();
        stmt.close();
        return utilisateurs;
    }

    public Utilisateur getById(int id) throws SQLException {
        Utilisateur utilisateur = null;
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM utilisateurs WHERE id = ?");
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            utilisateur = new Utilisateur();
            utilisateur.setId(rs.getInt("id"));
            utilisateur.setNom(rs.getString("nom"));
            utilisateur.setPrenom(rs.getString("prenom"));
            utilisateur.setEmail(rs.getString("email"));
            utilisateur.setMotDePasse(rs.getString("mot_de_passe"));
            utilisateur.setRole(rs.getInt("role"));
        }
        rs.close();
        stmt.close();
        return utilisateur;
    }
    public Utilisateur getByEmailAndPassword(String email, String password) throws SQLException {
        Utilisateur utilisateur = null;
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM utilisateurs WHERE email = ? AND mot_de_passe = ?");
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            utilisateur = new Utilisateur();
            utilisateur.setId(rs.getInt("id"));
            utilisateur.setNom(rs.getString("nom"));
            utilisateur.setPrenom(rs.getString("prenom"));
            utilisateur.setEmail(rs.getString("email"));
            utilisateur.setMotDePasse(rs.getString("mot_de_passe"));
            utilisateur.setRole(rs.getInt("role"));
        }
        rs.close();
        stmt.close();
        return utilisateur;
    }


}

