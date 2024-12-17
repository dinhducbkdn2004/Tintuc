package controllers;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import models.bean.Comment;
import models.bean.User;
import models.bo.CommentBO;

@WebServlet("/comment")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentBO commentBO;

	public CommentController() {
		commentBO = new CommentBO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		try {
			int articleId = Integer.parseInt(request.getParameter("articleId"));
			String content = request.getParameter("content");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			if ("add".equals(action)) {
				Comment comment = new Comment();
				comment.setContent(content);
				comment.setArticleId(articleId);
				comment.setCreatorId(user.getUsername());
				comment.setCreatedAt(new Date());
				commentBO.addComment(comment);
			} else if ("update".equals(action)) {
				String commentID = request.getParameter("commentID");
				Comment comment = new Comment();
				comment.setCommentID(Integer.parseInt(commentID));
				comment.setContent(content);
				commentBO.updateComment(comment);
			} else if ("delete".equals(action)) {
				String commentID = request.getParameter("commentID");
				commentBO.deleteComment(Integer.parseInt(commentID));
			}

			response.sendRedirect(request.getHeader("referer"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}