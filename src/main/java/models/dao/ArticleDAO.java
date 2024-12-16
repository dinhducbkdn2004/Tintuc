package models.dao;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import models.bean.Article;
import utils.ConnectDB;

public class ArticleDAO {

   

	// Lấy tất cả bài viết
    public List<Article> getAllArticles() {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT * FROM Article";

        try (Connection connection = ConnectDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                articles.add(mapResultSetToArticle(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

    // Lấy danh sách bài viết theo subjectId
    public List<Article> getArticlesBySubject(String subjectId) {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT * FROM Article WHERE subjectId = ?";

        try (Connection connection = ConnectDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, subjectId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    articles.add(mapResultSetToArticle(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

    // Lấy bài viết theo ID
    public Article getArticleById(String articleId) {
        String sql = "SELECT * FROM Article WHERE id = ?";
        try (Connection connection = ConnectDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, articleId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToArticle(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Lấy các bài viết nổi bật (Home, vị trí 1-5)
    public List<Article> getHighlightedArticles() {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT a.* FROM Article a JOIN Home h ON a.id = h.articleId WHERE h.position BETWEEN 1 AND 5";

        try (Connection connection = ConnectDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                articles.add(mapResultSetToArticle(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

 // Thêm một bài viết mới
    public boolean addArticle(Article article) {
        String sql = "INSERT INTO Article (id, title, subjectId, thumbnail, content, createdAt, introduce) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = ConnectDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
        	
        	// Chuyển kiểu Date thành String
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String createdAtStr = sdf.format(article.getCreatedAt());

            statement.setString(1, article.getId());
            statement.setString(2, article.getTitle());
            statement.setString(3, article.getSubjectId());
            statement.setString(4, article.getThumbnail());
            statement.setString(5, article.getContent());
            statement.setString(6, createdAtStr); // Chuyển ngày thành chuỗi
            statement.setString(7, article.getIntroduce());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Cập nhật bài viết
    public boolean updateArticle(Article article) {
        String sql = "UPDATE Article SET title = ?, subjectId = ?, thumbnail = ?, content = ?, createdAt = ?, introduce = ? WHERE id = ?";

        try (Connection connection = ConnectDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String createdAtStr = sdf.format(article.getCreatedAt());

            statement.setString(1, article.getTitle());
            statement.setString(2, article.getSubjectId());
            statement.setString(3, article.getThumbnail());
            statement.setString(4, article.getContent());
            statement.setString(5, createdAtStr);
            statement.setString(6, article.getIntroduce());
            statement.setString(7, article.getId());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Xóa bài viết theo ID
    public boolean deleteArticle(String articleId) {
        String sql = "DELETE FROM Article WHERE id = ?";

        try (Connection connection = ConnectDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, articleId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Map dữ liệu từ ResultSet sang Article
	    private Article mapResultSetToArticle(ResultSet resultSet) throws SQLException {
	    	
	        Article article = new Article();
	        article.setId(resultSet.getString("id"));
	        article.setTitle(resultSet.getString("title"));
	        article.setSubjectId(resultSet.getString("subjectId"));
	        article.setThumbnail(resultSet.getString("thumbnail"));
	        article.setContent(resultSet.getString("content"));
//	        article.setCreatedAt(resultSet.getString("createdAt"));
	     // Chuyển đổi từ String sang Date
	        String createdAtStr = resultSet.getString("createdAt");
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date createdAt = (Date) sdf.parse(createdAtStr);
	            article.setCreatedAt(createdAt);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        article.setIntroduce(resultSet.getString("introduce"));
	        return article;
	    }
//
//		public static List<Article> getArticleById() {
//			// TODO Auto-generated method stub
//			return null;
//		}
	}
