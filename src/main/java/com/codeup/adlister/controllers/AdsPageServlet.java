package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.AdsPageServlet", urlPatterns = "/adsPage")
public class AdsPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));
        Ads adsSqlDao = DaoFactory.getAdsDao();
        Ad foundAd = null;
        try {
           foundAd = adsSqlDao.findAdById(id);
       } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("ads", foundAd);
        request.getRequestDispatcher("/WEB-INF/ads/adsPage.jsp").forward(request, response);
    }
}

