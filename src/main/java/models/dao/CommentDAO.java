package models.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.bean.Comment;
import utils.ConnectDB;

public class CommentDAO {

	public boolean addComment(Comment comment) {
		try (Connection conn = ConnectDB.getConnection()) {
			String sql = "INSERT INTO comment (content, articleId, creatorId, createdAt) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comment.getContent());
			ps.setInt(2, comment.getArticleId());
			ps.setString(3, comment.getCreatorId());
			ps.setTimestamp(4, new java.sql.Timestamp(comment.getCreatedAt().getTime()));
			int result = ps.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateComment(Comment comment) {
		try (Connection conn = ConnectDB.getConnection()) {
			String sql = "UPDATE comment SET content = ? WHERE commentID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comment.getContent());
			ps.setInt(2, comment.getCommentID());
			int result = ps.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteComment(int commentID) {
		try (Connection conn = ConnectDB.getConnection()) {
			String sql = "DELETE FROM comment WHERE commentID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, commentID);
			int result = ps.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Comment> getCommentsByArticleId(int articleId) {
		List<Comment> comments = new ArrayList<>();
		try (Connection conn = ConnectDB.getConnection()) {
			String sql = "SELECT *, u.name as creator FROM comment c JOIN user u ON c.creatorId = u.username WHERE articleId = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, articleId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setCommentID(rs.getInt("commentID"));
				comment.setContent(rs.getString("content"));
				comment.setArticleId(rs.getInt("articleId"));
				comment.setCreatorId(rs.getString("creatorId"));
				comment.setCreator(rs.getString("creator"));
				comment.setCreatedAt(rs.getTimestamp("createdAt"));
				comments.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comments;
	}
}