package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.Users;
import com.codeup.adlister.dao.Validation;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        Users userSQLDao = DaoFactory.getUsersDao();


        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation));

        boolean isValid = Validation.validUsername(username);
        if (inputHasErrors || !isValid) {
            if (!isValid) {
                request.getSession().setAttribute("usernameTaken", true);
            }
            response.sendRedirect("/register");
            return;
        }
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());

        // create and save a new user
        User user = new User(username, email, hash, phoneNumber);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
