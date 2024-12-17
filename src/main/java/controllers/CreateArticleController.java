package controllers;

import models.bean.Article;
import models.bo.ArticleBO;
import models.bean.Subject;
import models.bean.User;
import models.bo.SubjectBO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/article/create")
public class CreateArticleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			if (user == null || user.getUserRole() != User.Role.admin) {
				response.sendRedirect(request.getContextPath());
				return;
			}

			SubjectBO subjectBO = new SubjectBO();
			List<Subject> subjects = subjectBO.getSubjects();
			request.setAttribute("subjects", subjects);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/create_article.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			if (user == null || user.getUserRole() != User.Role.admin) {
				response.sendRedirect(request.getContextPath());
				return;
			}

			ArticleBO articleBO = new ArticleBO();
			Article article = new Article();
			article.setTitle(request.getParameter("title"));
			article.setSubjectId(request.getParameter("subject"));
			article.setThumbnail(request.getParameter("thumbnail"));
			article.setIntroduce(request.getParameter("introduce"));
			article.setContent(request.getParameter("content"));
			int id = articleBO.addArticle(article);

			if (id == -1) {
				response.sendRedirect(request.getContextPath() + "/article/create");
				return;
			} else
				response.sendRedirect(request.getContextPath() + "/article/" + id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
