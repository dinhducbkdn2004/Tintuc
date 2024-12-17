package models.dao;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import models.bean.Article;
import utils.ConnectDB;

public class ArticleDAO {

    public List<Article> getAllArticles() {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT *, s.name AS subjectName FROM Article a JOIN Subject s ON a.subjectId = s.id";

        try (Connection connection = ConnectDB.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Article article = mapResultSetToArticle(resultSet);
                article.setSubject(resultSet.getString("subjectName"));
                articles.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return articles;
    }

    public List<Article> getArticlesBySubject(String subjectId, int limit, int offset) {
        List<Article> articles = new ArrayList<>();
        // lấy ra các bài viết theo chủ đề mới nhất và theo trang
        String sql = "SELECT *, s.name AS subjectName FROM Article a JOIN Subject s ON a.subjectId = s.id WHERE a.subjectId = ? ORDER BY a.createdAt DESC LIMIT ? OFFSET ?";
        try (Connection connection = ConnectDB.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, subjectId);
            statement.setInt(2, limit);
            statement.setInt(3, offset);

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

    public Article getArticleById(String articleId) {
        String sql = "SELECT *, s.name AS subjectName FROM Article a JOIN Subject s ON a.subjectId = s.id WHERE a.id = ?";
        Article article = null;
        try (Connection connection = ConnectDB.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, articleId);
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

    public boolean addArticle(Article article) {
        String sql = "INSERT INTO Article (id, title, subjectId, thumbnail, content, createdAt, introduce) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = ConnectDB.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String createdAtStr = sdf.format(article.getCreatedAt());

            statement.setString(1, article.getId());
            statement.setString(2, article.getTitle());
            statement.setString(3, article.getSubjectId());
            statement.setString(4, article.getThumbnail());
            statement.setString(5, article.getContent());
            statement.setString(6, createdAtStr);
            statement.setString(7, article.getIntroduce());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

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

    private Article mapResultSetToArticle(ResultSet resultSet) throws SQLException {

        Article article = new Article();
        article.setId(resultSet.getString("id"));
        article.setTitle(resultSet.getString("title"));
        article.setSubjectId(resultSet.getString("subjectId"));
        article.setThumbnail(resultSet.getString("thumbnail"));
        article.setContent(resultSet.getString("content"));

        String createdAtStr = resultSet.getString("createdAt");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date createdAt = sdf.parse(createdAtStr);
            article.setCreatedAt(createdAt);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        article.setIntroduce(resultSet.getString("introduce"));
        return article;
    }
}
