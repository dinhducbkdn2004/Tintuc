package controllers;

import models.bean.Article;
import models.bo.ArticleBO;
import models.bean.Comment;
import models.bo.CommentBO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/article/*")
public class ArticleController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      String pathInfo = request.getPathInfo();
      if (pathInfo == null || pathInfo.equals("/")) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Article ID is missing");
        return;
      }
      int id = Integer.parseInt(pathInfo.substring(1));
      ArticleBO articleBO = new ArticleBO();

      Article article = articleBO.getArticleById(id);
      request.setAttribute("article", article);

      if (article != null) {
        List<Comment> comments = new CommentBO().getCommentsByArticleId(id);
        request.setAttribute("comments", comments);

        List<Article> relatedArticles = articleBO.getArticlesWithFilter(null, article.getSubjectId(), 6, 0);
        relatedArticles.removeIf(a -> a.getId() == article.getId());

        request.setAttribute("relatedArticles", relatedArticles);
      }

      RequestDispatcher dispatcher = request.getRequestDispatcher("/views/article.jsp");
      dispatcher.forward(request, response);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
