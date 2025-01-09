package DataAccessObject;

import Entity.Categorie;
import connectiondb.connectiondb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategorieDAO {
    private Connection connection;

    public CategorieDAO() {
        connection = connectiondb.getConnection();
    }

    public List<Categorie> getAllCategories() {
        List<Categorie> categories = new ArrayList<>();
        try {
            String query = "SELECT * FROM categories";
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Categorie categorie = new Categorie();
                categorie.setId(rs.getInt("id"));
                categorie.setName(rs.getString("name"));
                categorie.setDescription(rs.getString("description"));
                categories.add(categorie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public void addCategory(Categorie categorie) {
        try {
            String query = "INSERT INTO categories (name, description) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, categorie.getName());
            preparedStatement.setString(2, categorie.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCategory(int id) {
        try {
            String query = "DELETE FROM categories WHERE id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
