package controllers;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import models.bean.Comment;
import models.bo.CommentBO;

@WebServlet("/comment")
public class CommentController extends HttpServlet {
  private CommentBO commentBO;

  public CommentController() {
    commentBO = new CommentBO();
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");
    String articleId = request.getParameter("articleId");
    String content = request.getParameter("content");
    HttpSession session = request.getSession();
    String creatorId = (String) session.getAttribute("userId");

    System.out.println("User ID (COMMENT CONTROLLER): " + creatorId);

    if ("add".equals(action)) {
      Comment comment = new Comment();
      comment.setCommentID(java.util.UUID.randomUUID().toString());
      comment.setContent(content);
      comment.setArticleId(articleId);
      comment.setCreatorId(creatorId);
      comment.setCreatedAt(new Date());
      commentBO.addComment(comment);
    } else if ("update".equals(action)) {
      String commentID = request.getParameter("commentID");
      Comment comment = new Comment();
      comment.setCommentID(commentID);
      comment.setContent(content);
      commentBO.updateComment(comment);
    } else if ("delete".equals(action)) {
      String commentID = request.getParameter("commentID");
      commentBO.deleteComment(commentID);
    }

    response.sendRedirect(request.getHeader("referer"));
  }
}