package DataAccessObject;

import Entity.Commande;
import com.example.superm.UserNow;
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

    public void create(Commande commande) throws SQLException {
        String sql = "INSERT INTO commandes(utilisateur_id, produit_id, quantite, date) values (?,?,?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, commande.getUtilisateur_id(UserNow.getUser().getId()));
        statement.setInt(2, commande.getProduit_id());
        statement.setInt(3, commande.getQuantite());
        statement.setString(4, commande.getDate());
        statement.executeUpdate();
    }

    public List<Commande> findAll() throws SQLException {
        List<Commande> commandes = new ArrayList<>();
        String sql = "SELECT * FROM commandes";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Commande commande = new Commande();
            commande.setId(resultSet.getInt("id"));
            commande.setUtilisateur_id(resultSet.getInt("utilisateur_id"));
            commande.setProduit_id(resultSet.getInt("produit_id"));
            commande.setQuantite(resultSet.getInt("quantite"));
            commande.setDate(resultSet.getString("date"));
            commandes.add(commande);
        }
        return commandes;
    }
}