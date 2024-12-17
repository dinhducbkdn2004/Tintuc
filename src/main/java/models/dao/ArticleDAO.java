package models.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import models.bean.Article;
import utils.ConnectDB;

public class ArticleDAO {

	public List<Article> getAllArticles() {
		List<Article> articles = new ArrayList<>();
		String sql = "SELECT *, s.name AS subjectName, COALESCE(p.position, -1) AS position FROM Article a LEFT JOIN Subject s ON a.subjectId = s.id LEFT JOIN Home p ON a.id = p.articleId ORDER BY a.createdAt DESC";

		try (Connection connection = ConnectDB.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {

			while (resultSet.next()) {
				Article article = mapResultSetToArticle(resultSet);
				article.setSubject(resultSet.getString("subjectName"));
				articles.add(article);
				article.setPosition(resultSet.getInt("position"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return articles;
	}

	public List<Article> getArticlesWithFilter(String searchValue, String subjectId, int limit, int offset) {
		List<Article> articles = new ArrayList<>();
		String sql = "SELECT *, s.name AS subjectName FROM Article a JOIN Subject s ON a.subjectId = s.id";
		if (searchValue != null && !searchValue.isEmpty()) {
			sql += " WHERE a.title LIKE ? OR a.introduce LIKE ?";
		} else if (subjectId != null && !subjectId.isEmpty()) {
			sql += " WHERE a.subjectId = ?";
		}
		sql += " ORDER BY a.createdAt DESC LIMIT ? OFFSET ?";
		try (Connection connection = ConnectDB.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {

			if (searchValue != null && !searchValue.isEmpty()) {
				statement.setString(1, "%" + searchValue + "%");
				statement.setString(2, "%" + searchValue + "%");
				statement.setInt(3, limit);
				statement.setInt(4, offset);
			} else if (subjectId != null && !subjectId.isEmpty()) {
				statement.setString(1, subjectId);
				statement.setInt(2, limit);
				statement.setInt(3, offset);
			} else {
				statement.setInt(1, limit);
				statement.setInt(2, offset);
			}

			try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					Article article = mapResultSetToArticle(resultSet);
					article.setSubject(resultSet.getString("subjectName"));
					articles.add(article);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articles;
	}

	public Article getArticleById(int articleId) {
		String sql = "SELECT *, s.name AS subjectName FROM Article a JOIN Subject s ON a.subjectId = s.id WHERE a.id = ?";
		Article article = null;
		try (Connection connection = ConnectDB.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setInt(1, articleId);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					article = mapResultSetToArticle(resultSet);
					article.setSubject(resultSet.getString("subjectName"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return article;
	}

	public List<Article> getHighlightedArticles() {
		List<Article> articles = new ArrayList<>();
		String sql = "SELECT a.* FROM Article a JOIN Home h ON a.id = h.articleId WHERE h.position BETWEEN 1 AND 5"
				+ " ORDER BY h.position ASC";

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

	public int addArticle(Article article) {
		String[] generatedColumns = { "id" };
		String sql = "INSERT INTO Article (title, subjectId, thumbnail, content, createdAt, introduce) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection connection = ConnectDB.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql, generatedColumns)) {

			statement.setString(1, article.getTitle());
			statement.setString(2, article.getSubjectId());
			statement.setString(3, article.getThumbnail());
			statement.setString(4, article.getContent());
			statement.setTimestamp(5, new java.sql.Timestamp(new Date().getTime()));
			statement.setString(6, article.getIntroduce());

			int affectedRows = statement.executeUpdate();
			if (affectedRows > 0) {
				try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
					if (generatedKeys.next()) {
						article.setId(generatedKeys.getInt(1));
						return article.getId();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public boolean updateArticle(Article article) {
		String sql = "UPDATE Article SET title = ?, subjectId = ?, thumbnail = ?, content = ?, introduce = ? WHERE id = ?";

		try (Connection connection = ConnectDB.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setString(1, article.getTitle());
			statement.setString(2, article.getSubjectId());
			statement.setString(3, article.getThumbnail());
			statement.setString(4, article.getContent());
			statement.setString(5, article.getIntroduce());
			statement.setInt(6, article.getId());

			return statement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteArticle(int articleId) {
		String sql = "DELETE FROM Article WHERE id = ?";

		try (Connection connection = ConnectDB.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setInt(1, articleId);
			return statement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private Article mapResultSetToArticle(ResultSet resultSet) throws SQLException {

		Article article = new Article();
		article.setId(resultSet.getInt("id"));
		article.setTitle(resultSet.getString("title"));
		article.setSubjectId(resultSet.getString("subjectId"));
		article.setThumbnail(resultSet.getString("thumbnail"));
		article.setContent(resultSet.getString("content"));
		article.setCreatedAt(resultSet.getTimestamp("createdAt"));
		article.setIntroduce(resultSet.getString("introduce"));
		return article;
	}
}