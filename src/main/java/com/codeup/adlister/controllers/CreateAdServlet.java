package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getSession().getAttribute("user"));
        if (request.getSession().getAttribute("user") != null) {
//            response.sendRedirect("/WEB-INF/ads/create.jsp");
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("/login")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User sessionUser = (User) request.getSession().getAttribute("user");
        System.out.println(sessionUser.getId());
        System.out.println(sessionUser.getUsername());
        System.out.println(sessionUser.getEmail());
        System.out.println(sessionUser.getPassword());
        Ad ad = new Ad(
                sessionUser.getId(), // for now we'll hardcode the user id
                request.getParameter("title"),
              Double.parseDouble(request.getParameter("price")),
                request.getParameter("description"),
                request.getParameter("Img_url")
        );
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
