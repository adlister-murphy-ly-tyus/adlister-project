package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import java.sql.SQLException;
import java.util.List;

public interface Categories {
    List<Category> all() throws SQLException;

    int findCategoryByName(String name);

    List<String> getCategoriesByAdId(long adId) throws SQLException;

    // insert a new ad and return the new ad's id
    Long insert(Category category) throws SQLException;

    Long delete(String name) throws SQLException;

    Long update(Category oldCategory, Category newCategory) throws SQLException;
}
