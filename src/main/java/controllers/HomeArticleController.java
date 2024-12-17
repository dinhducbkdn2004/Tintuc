package controllers;

import models.bean.User;
import models.bo.HomeBO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/manage/home")
public class HomeArticleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(HomeArticleController.class.getName());
	private HomeBO homeBO;

	public HomeArticleController() {
		homeBO = new HomeBO();
	}

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
			int position = Integer.parseInt(request.getParameter("position"));

			homeBO.addOrUpdateArticleToHome(articleId, position);
			LOGGER.info("Article added to home successfully");

			response.sendRedirect(request.getContextPath() + "/manage");
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error in HomeServlet", e);
			throw new ServletException("Error in HomeServlet", e);
		}
	}
}
