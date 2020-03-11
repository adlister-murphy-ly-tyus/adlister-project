package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ad/search")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchString = request.getParameter("search");
//        System.out.println(searchString);
        try {
            List<Ad> adList = DaoFactory.getAdsDao().searchAds(searchString);
            System.out.println(adList);
            for (Ad ad : adList) {
                System.out.println(ad.getTitle());
            }
            request.setAttribute("ads", DaoFactory.getAdsDao().searchAds(searchString));
        } catch (SQLException se) {
            se.printStackTrace();
        }
        request.getSession().setAttribute("marker", "/ads");
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}
