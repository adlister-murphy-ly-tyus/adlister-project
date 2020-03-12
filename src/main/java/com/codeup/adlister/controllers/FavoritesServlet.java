package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/favorites")
public class FavoritesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        long adId = Long.parseLong(request.getParameter("id"));

        try {
            DaoFactory.getUsersDao().insertFavorite(user.getId(), adId);
            List<Ad> userFavorites = DaoFactory.getUsersDao().getFavorites(user.getId());
            request.getSession().setAttribute("favorites", userFavorites);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getSession().getAttribute("marker").toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        long adId = Long.parseLong(request.getParameter("id"));

        try {
            DaoFactory.getUsersDao().removeFavorite(user.getId(), adId);
            List<Ad> userFavorites = DaoFactory.getUsersDao().getFavorites(user.getId());
            request.getSession().setAttribute("favorites", userFavorites);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/profile");
    }
}
