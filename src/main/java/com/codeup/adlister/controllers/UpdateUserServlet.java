package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.Users;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/updateUser")
public class UpdateUserServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("username");
    Users usersSqlDao = DaoFactory.getUsersDao();
    request.setAttribute("user", usersSqlDao.findByUsername(username));
    request.getRequestDispatcher("/WEB-INF/editProfile.jsp").forward(request, response);
}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users usersSqlDao = DaoFactory.getUsersDao();
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        User oldUser = (User) request.getSession().getAttribute("user");
        try {
            System.out.println(email);
            System.out.println(phoneNumber);
            User newUser =  new User(oldUser.getId(), oldUser.getUsername(), email, oldUser.getPassword(), phoneNumber);
            request.getSession().setAttribute("user", newUser);
            usersSqlDao.update(oldUser, newUser);
        } catch (SQLException e) {
           e.printStackTrace();
       }
       response.sendRedirect("/profile");
    }

}
