package models.bo;

import java.util.List;

import models.bean.Article;
import models.dao.ArticleDAO;

public class ArticleBO {
    private ArticleDAO articleDAO;

    // Constructor khởi tạo ArticleDAO
    public ArticleBO() {
        articleDAO = new ArticleDAO();
    }

    // Lấy tất cả bài viết
    public List<Article> getAllArticles() {
        return articleDAO.getAllArticles();
    }

    // Lấy danh sách bài viết theo subjectId (chuyên mục)
    public List<Article> getArticlesBySubject(String subjectId) {
        return articleDAO.getArticlesBySubject(subjectId);
    }

    // Lấy bài viết theo ID
    public Article getArticleById(String articleId) {
        return articleDAO.getArticleById(articleId);
    }

    // Lấy danh sách bài viết nổi bật (dựa vào vị trí 1-5 từ bảng Home)
    public List<Article> getHighlightedArticles() {
        return articleDAO.getHighlightedArticles();
    }

    // Thêm một bài viết mới
    public boolean addArticle(Article article) {
        return articleDAO.addArticle(article);
    }

    // Cập nhật bài viết
    public boolean updateArticle(Article article) {
        return articleDAO.updateArticle(article);
    }

    // Xóa bài viết theo ID
    public boolean deleteArticle(String articleId) {
        return articleDAO.deleteArticle(articleId);
    }
}
