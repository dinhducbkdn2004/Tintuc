package models.bo;

import java.util.List;
import models.bean.Comment;
import models.dao.CommentDAO;

public class CommentBO {
	private CommentDAO commentDAO;

	public CommentBO() {
		commentDAO = new CommentDAO();
	}

	public boolean addComment(Comment comment) {
		return commentDAO.addComment(comment);
	}

	public boolean updateComment(Comment comment) {
		return commentDAO.updateComment(comment);
	}

	public boolean deleteComment(int commentID) {
		return commentDAO.deleteComment(commentID);
	}

	public List<Comment> getCommentsByArticleId(int articleId) {
		return commentDAO.getCommentsByArticleId(articleId);
	}
}