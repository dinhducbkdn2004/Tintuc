package controllers;

import models.bean.Article;
import models.bean.Subject;
import models.bo.ArticleBO;
import models.bo.SubjectBO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/articles")
public class ArticleListController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      String subject = request.getParameter("subject");
      String search = request.getParameter("search");
      String page = request.getParameter("page");
      String url = "";
      if (page == null) {
        page = "1";
      }
      ArticleBO articleBO = new ArticleBO();

      List<Article> articles = articleBO.getArticlesWithFilter(search, subject, 10, Integer.parseInt(page) - 1);
      if (subject != null) {
        SubjectBO subjectBO = new SubjectBO();
        Subject subjectObj = subjectBO.getSubjectById(subject);
        request.setAttribute("subjectName", subjectObj.getName());

        url = "/views/subject_list_article.jsp";
      } else {
        url = "/views/search_list_article.jsp";
      }

      request.setAttribute("pageNumber", page);
      request.setAttribute("articles", articles);
      request.getRequestDispatcher(url).forward(request, response);

    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
