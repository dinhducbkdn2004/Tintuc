package controllers;

import models.dao.ArticleDAO;
import models.bo.ArticleBO;
import models.bean.Article;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

public class SubjectServlet extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String subjectId = request.getParameter("id");
            
            ArticleBO articleBO = new ArticleBO();

            List<Article> articles = articleBO.getArticlesBySubject(subjectId);
            request.setAttribute("articles", articles);

            RequestDispatcher dispatcher = request.getRequestDispatcher("subject.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
