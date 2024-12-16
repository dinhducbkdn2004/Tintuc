package controllers;

import models.dao.ArticleDAO;
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
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/newsdb", "root", "password");
            ArticleDAO articleDAO = new ArticleDAO();

            List<Article> articles = articleDAO.getArticlesBySubject(subjectId);
            request.setAttribute("articles", articles);

            RequestDispatcher dispatcher = request.getRequestDispatcher("subject.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
