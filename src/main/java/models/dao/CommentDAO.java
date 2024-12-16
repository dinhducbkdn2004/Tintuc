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
            String sql = "INSERT INTO comment (commentID, content, articleId, creatorId, createdAt) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, comment.getCommentID());
            ps.setString(2, comment.getContent());
            ps.setString(3, comment.getArticleId());
            ps.setString(4, comment.getCreatorId());
            ps.setTimestamp(5, new java.sql.Timestamp(comment.getCreatedAt().getTime()));
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
            ps.setString(2, comment.getCommentID());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteComment(String commentID) {
        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "DELETE FROM comment WHERE commentID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, commentID);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Comment> getCommentsByArticleId(String articleId) {
        List<Comment> comments = new ArrayList<>();
        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM comment WHERE articleId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, articleId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentID(rs.getString("commentID"));
                comment.setContent(rs.getString("content"));
                comment.setArticleId(rs.getString("articleId"));
                comment.setCreatorId(rs.getString("creatorId"));
                comment.setCreatedAt(rs.getTimestamp("createdAt"));
                comments.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }
}