package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);


        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        boolean passwordsMatch = BCrypt.checkpw(password, user.getPassword());
        if (passwordsMatch) {
            request.getSession().setAttribute("user", user);
            try {
                List<Ad> userFavorites = DaoFactory.getUsersDao().getFavorites(user.getId());
                request.getSession().setAttribute("favorites", userFavorites);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (request.getSession().getAttribute("marker") != null) {
                response.sendRedirect(request.getSession().getAttribute("marker").toString());
                return;
            }
            response.sendRedirect("/profile");
        } else {
            response.sendRedirect("/login");
        }
    }
}
