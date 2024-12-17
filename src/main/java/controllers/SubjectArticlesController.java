package controllers;

import models.bo.ArticleBO;
import models.bean.Article;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/subject/*")
public class SubjectArticlesController extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      String pathInfo = request.getPathInfo();
      if (pathInfo == null || pathInfo.equals("/")) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Subject ID is missing");
        return;
      }

      String subjectId = pathInfo.substring(1);
      int limit = request.getParameter("limit") != null ? Integer.parseInt(request.getParameter("limit")) : 10;
      int offset = request.getParameter("offset") != null ? Integer.parseInt(request.getParameter("offset")) : 0;

      ArticleBO articleBO = new ArticleBO();

      List<Article> articles = articleBO.getArticlesBySubject(subjectId, limit, offset);
      request.setAttribute("articles", articles);

      RequestDispatcher dispatcher = request.getRequestDispatcher("subject.jsp");
      dispatcher.forward(request, response);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
