package controllers;

import models.bo.ArticleBO;
import models.bean.Article;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/manage")
public class ArticleManageController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Article> articles = new ArticleBO().getAllArticles();
            request.setAttribute("articles", articles);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/manage.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
