package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.sql.SQLException;
import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    User findUserById(long id);
    Long delete(String username) throws SQLException;

    // update an ad
    Long update(User user, User newUser) throws SQLException;

    List<Ad> getFavorites(long userId) throws SQLException;
    boolean insertFavorite(long userId, long adId) throws SQLException;
    boolean removeFavorite(long userId, long adId) throws SQLException;
}
