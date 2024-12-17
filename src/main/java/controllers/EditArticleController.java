package controllers;

import models.bean.Article;
import models.bean.Subject;
import models.bean.User;
import models.bo.ArticleBO;
import models.bo.SubjectBO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/manage/article/edit")
public class EditArticleController extends HttpServlet {
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

			int articleId = Integer.parseInt(request.getParameter("id"));
			ArticleBO articleBO = new ArticleBO();

			String action = request.getParameter("action");
			if (action != null && action.equals("delete")) {
				articleBO.deleteArticle(articleId);
				response.sendRedirect(request.getContextPath() + "/manage");
				return;
			}

			Article article = articleBO.getArticleById(articleId);

			SubjectBO subjectBO = new SubjectBO();
			List<Subject> subjects = subjectBO.getSubjects();

			request.setAttribute("article", article);
			request.setAttribute("subjects", subjects);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/edit_article.jsp");
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
			article.setId(Integer.parseInt(request.getParameter("id")));
			article.setTitle(request.getParameter("title"));
			article.setSubjectId(request.getParameter("subject"));
			article.setThumbnail(request.getParameter("thumbnail"));
			article.setIntroduce(request.getParameter("introduction"));
			article.setContent(request.getParameter("content"));

			boolean isUpdated = articleBO.updateArticle(article);

			if (!isUpdated) {
				response.sendRedirect(request.getContextPath() + "/manage/article/edit?id=" + article.getId());
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/article/" + article.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
