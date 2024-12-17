package controllers;

import models.bean.Article;
import models.bo.ArticleBO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet({ "/" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(HomeController.class.getName());
	private ArticleBO articleBO;

	public HomeController() {
		articleBO = new ArticleBO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			LOGGER.info("Fetching highlighted articles");
			List<Article> featuredArticles = articleBO.getHighlightedArticles();
			if (featuredArticles == null || featuredArticles.isEmpty()) {
				LOGGER.warning("No highlighted articles found");
			} else {
				LOGGER.info("Highlighted articles fetched successfully");
			}

			request.setAttribute("featuredArticles", featuredArticles);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/index.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error in HomeServlet", e);
			throw new ServletException("Error in HomeServlet", e);
		}
	}
}
