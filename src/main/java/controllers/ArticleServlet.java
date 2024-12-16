package controllers;

import models.dao.ArticleDAO;
import models.bo.ArticleBO;
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
            ArticleBO articleBO = new ArticleBO();

            Article article = articleBO.getArticleById(id);
            request.setAttribute("article", article);

            RequestDispatcher dispatcher = request.getRequestDispatcher("article.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
