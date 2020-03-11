package com.codeup.adlister.dao;

import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategorySQLDao implements Categories {
    private Connection connection = null;

    public CategorySQLDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Category> all() throws SQLException {
        List<Category> categories = new ArrayList<>();
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM categories");
        while (rs.next()) {
            categories.add(new Category(rs.getString("name")));
        }
        return categories;
    }

    public int findCategoryByName(String name) {
        String query = "SELECT * FROM categories WHERE name = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a category by name", e);
        }

    }

    @Override
    public List<String> getCategoriesByAdId(long adId) throws SQLException {
        List<String> categoryList = new ArrayList<>();
        String sqlQuery = "SELECT name FROM categories AS c JOIN ads_has_category AS ac ON c.id = ac.category_id JOIN ads AS a ON a.id = ac.ads_id WHERE a.id = ?";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setLong(1, adId);
        stmt.executeQuery();
        ResultSet rs = stmt.getResultSet();
        while (rs.next()) {
            categoryList.add(rs.getString(1));
        }
        return categoryList;
    }

    @Override
    public Long insert(Category category) throws SQLException {
        String sqlQuery = "INSERT INTO categories (name) VALUES (?)";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, category.getName());
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();
        return rs.getLong(1);
    }

    @Override
    public Long delete(String name) throws SQLException {
        return null;
    }

    @Override
    public Long update(Category oldCategory, Category newCategory) throws SQLException {
        return null;
    }


}
