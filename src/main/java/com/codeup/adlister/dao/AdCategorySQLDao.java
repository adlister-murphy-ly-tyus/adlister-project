package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class AdCategorySQLDao {
    private Connection connection = null;

    public AdCategorySQLDao (Config config) {
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

    public boolean insert(long adId, int categoryId) throws SQLException {
        String sqlQuery = "INSERT INTO ads_has_category (ads_id, category_id) VALUES (?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setLong(1, adId);
        stmt.setInt(2, categoryId);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        return rs.next();
    }

}
