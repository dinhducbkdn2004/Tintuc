package controllers;

import models.dao.ArticleDAO;
import models.bean.Article;
import models.bo.UserBO;
import models.bo.ArticleBO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

public class HomeServlet extends HttpServlet {
	private ArticleBO ArticleBO;

	  public HomeServlet() {
	    ArticleBO = new ArticleBO();}
	  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    		ArticleBO articleBO = new ArticleBO(); // Tạo đối tượng ArticleDAO
            List<Article> featuredArticles;
			
				featuredArticles = articleBO.getHighlightedArticles(); 
			
			
            request.setAttribute("featuredArticles", featuredArticles);

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        
        }
    
}
