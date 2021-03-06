package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
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
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> all(int id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> searchAds(String keyword) throws SQLException {
        List<Ad> adList = new ArrayList<>();
        String sqlQuery = "SELECT DISTINCT a.id FROM ads AS a LEFT JOIN ads_has_category AS ac ON a.id = ac.ads_id JOIN categories AS c ON c.id = ac.category_id WHERE a.title LIKE ? OR c.name LIKE ?";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.NO_GENERATED_KEYS);
        stmt.setString(1, "%" + keyword + "%");
        stmt.setString(2, "%" + keyword + "%");
        stmt.executeQuery();
        ResultSet rs = stmt.getResultSet();
        while (rs.next()) {
            adList.add(findAdById(rs.getInt("id")));
        }
        return adList;
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads (user_id, title, description, price, img_url) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setDouble(4, ad.getPrice());
            stmt.setString(5, ad.getImgUrl());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public Long delete(int id) throws SQLException {
        String sqlQuery = "DELETE FROM ads WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setInt(1, id);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();
        return rs.getLong(1);
    }

    @Override
    public Long update(Ad ad, Ad newAd) throws SQLException {
        String sqlQuery = "UPDATE ads SET user_id = ?, title = ?, price = ?, description = ?, img_url = ? WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setInt(1, (int) ad.getUserId());
        stmt.setString(2, newAd.getTitle());
        stmt.setDouble(3, newAd.getPrice());
        stmt.setString(4, newAd.getDescription());
        stmt.setString(5, newAd.getImgUrl());
        stmt.setInt(6, (int) ad.getId());
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();

        return rs.getLong(1);
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getDouble("price"),
                rs.getString("description"),
                rs.getString("img_url")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    @Override
    public Ad findAdById(int id) throws SQLException {
        String sqlQuery = "SELECT * FROM ads WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.NO_GENERATED_KEYS);
        stmt.setInt(1, id);
        stmt.executeQuery();
        ResultSet rs = stmt.getResultSet();
        rs.next();
        int adId = rs.getInt(1);
        int userId = rs.getInt(2);
        String title = rs.getString(3);
        double price = rs.getDouble(4);
        String description = rs.getString(5);
        String imgUrl = rs.getString(6);
        Ad ad = new Ad(adId, userId, title, price, description, imgUrl);
        return ad;
    }

}
