package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
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
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }


    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users (username, email, password, phone_number) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getPhoneNumber());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    @Override
    public User findUserById(long id) {
        String query = "SELECT * FROM users WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, (id));
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }


    @Override
    public Long delete(String username) throws SQLException {
        return null;
    }

    @Override
    public Long update(User user, User newUser) throws SQLException {
        String sqlQuery = "UPDATE users SET email = ?, phone_number = ? WHERE username = ?";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, newUser.getEmail());
        stmt.setString(2, newUser.getPhoneNumber());
        stmt.setString(3, user.getUsername());
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();
        return rs.getLong(1);
    }

    @Override
    public List<Ad> getFavorites(long userId) throws SQLException {
        List<Ad> adsList = new ArrayList<>();
        String sqlQuery = "SELECT * FROM favorites WHERE users_id = ?";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.NO_GENERATED_KEYS);
        stmt.setLong(1, userId);
        stmt.executeQuery();
        ResultSet rs = stmt.getResultSet();
        int adId;

        while (rs.next()) {
            adId = rs.getInt("ads_id");
            adsList.add(DaoFactory.getAdsDao().findAdById(adId));
        }
        return adsList;
    }

    @Override
    public boolean insertFavorite(long userId, long adId) throws SQLException {
        String sqlQuery = "INSERT INTO favorites (users_id, ads_id) VALUES (?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setLong(1, userId);
        stmt.setLong(2, adId);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        return rs.next();
    }

    @Override
    public boolean removeFavorite(long userId, long adId) throws SQLException {
        String sqlQuery = "DELETE FROM favorites WHERE users_id = ? AND ads_id = ?;";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setLong(1, userId);
        stmt.setLong(2, adId);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        return rs.next();
    }


    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("phone_number")
        );
    }

}
