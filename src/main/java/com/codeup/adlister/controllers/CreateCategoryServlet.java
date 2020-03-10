package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Categories;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet ("/category/create")
public class CreateCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/categories/createCategory.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Categories categorySQLDao = DaoFactory.getCategoriesDao();
        System.out.println(request.getParameter("category"));
        try {
            categorySQLDao.insert(new Category(request.getParameter("category")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/profile");
    }
}
