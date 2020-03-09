package com.codeup.adlister.dao;

public class Validation {

    public static boolean validUsername(String username) {
        Users mySQLUsersDao = DaoFactory.getUsersDao();
        if (mySQLUsersDao.findByUsername(username) != null) {
            return false;
        }
        return true;
    }

}
