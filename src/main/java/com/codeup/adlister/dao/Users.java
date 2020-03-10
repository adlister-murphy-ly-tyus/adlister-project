package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.sql.SQLException;
import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    Long delete(String username) throws SQLException;

    // update an ad
    Long update(User user, User newUser) throws SQLException;
}
