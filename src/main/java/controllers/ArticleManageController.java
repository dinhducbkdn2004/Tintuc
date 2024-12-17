package controllers;

import models.bo.ArticleBO;
import models.bean.Article;
import models.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/manage")
public class ArticleManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			if (user == null || user.getUserRole() != User.Role.admin) {
				response.sendRedirect(request.getContextPath());
			}

			List<Article> articles = new ArticleBO().getAllArticles();
			request.setAttribute("articles", articles);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/manage.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
