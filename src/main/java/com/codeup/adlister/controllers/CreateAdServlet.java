package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.AdCategorySQLDao;
import com.codeup.adlister.dao.Categories;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            try {
                List<Category> categoryList = DaoFactory.getCategoriesDao().all();
                request.getSession().setAttribute("categories", categoryList);
                request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
                return;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("/login")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User sessionUser = (User) request.getSession().getAttribute("user");

        Ad ad = new Ad(
                sessionUser.getId(), // for now we'll hardcode the user id
                request.getParameter("title"),
                Double.parseDouble(request.getParameter("price")),
                request.getParameter("description"),
                request.getParameter("Img_url")
        );
        try {
            long adId = DaoFactory.getAdsDao().insert(ad);
            List<Category> categoryList = DaoFactory.getCategoriesDao().all();
            AdCategorySQLDao adCategorySQLDao = DaoFactory.getAdCategorySQLDao();
            Categories categorySQLDao = DaoFactory.getCategoriesDao();
            String selectedCategory;
            for (Category category : categoryList) {
                if (request.getParameter(category.getName()) != null) {
                    selectedCategory = request.getParameter(category.getName());
                    adCategorySQLDao.insert(adId, categorySQLDao.findCategoryByName(selectedCategory));
                }
            }
            request.getSession().setAttribute("adCreator",DaoFactory.getAdsDao().findAdById((int) adId));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/ads");
    }
}
