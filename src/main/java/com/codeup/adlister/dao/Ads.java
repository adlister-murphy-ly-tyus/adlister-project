package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    // get a list of all ads by user id
    List<Ad> all(int id);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    // delete an ad
    Long delete(int id) throws SQLException;

    // update an ad
    Long update(Ad ad, Ad newAd);

    Ad findAdById(int id) throws SQLException;
}
