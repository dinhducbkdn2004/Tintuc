package controllers;

import models.dao.ArticleDAO;
import models.bean.Article;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tintuc", "root", "password");
            ArticleDAO articleDAO = new ArticleDAO();

            List<Article> featuredArticles = articleDAO.getAllArticles();
            request.setAttribute("featuredArticles", featuredArticles);

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
