package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/ads/update")
public class AdsUpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Ads adsSqlDao = DaoFactory.getAdsDao();
        System.out.println("here");

        try {
            request.setAttribute("ad", adsSqlDao.findAdById(id));//finding ad object with ad info and assinging ad //
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request, response);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Ads adsSqlDao = DaoFactory.getAdsDao();
        String title = request.getParameter("title");
        System.out.println(title);
        String description = request.getParameter("description");
        System.out.println(description);
        double price = Double.parseDouble(request.getParameter("price"));
        System.out.println(price);
        String imgUrl = request.getParameter("imgUrl");
        try {
            Ad oldAd = adsSqlDao.findAdById(id);
            User user = (User) request.getSession().getAttribute("user");
            adsSqlDao.update(oldAd, new Ad(user.getId(), title,  price, description, imgUrl));
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
