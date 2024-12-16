package controllers;

import models.dao.ArticleDAO;
import models.bean.Article;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

public class ArticleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tintuc", "root", "password");
            ArticleDAO articleDAO = new ArticleDAO();

            Article article = articleDAO.getArticleById(id);
            request.setAttribute("article", article);

            RequestDispatcher dispatcher = request.getRequestDispatcher("article.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
