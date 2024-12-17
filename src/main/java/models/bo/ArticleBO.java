package models.bo;

import java.util.List;

import models.bean.Article;
import models.dao.ArticleDAO;

public class ArticleBO {
	private ArticleDAO articleDAO;

	public ArticleBO() {
		articleDAO = new ArticleDAO();
	}

	public List<Article> getAllArticles() {
		return articleDAO.getAllArticles();
	}

	public List<Article> getArticlesWithFilter(String searchValue, String subjectId, int limit, int offset) {
		return articleDAO.getArticlesWithFilter(searchValue, subjectId, limit, offset);
	}

	public Article getArticleById(int articleId) {
		return articleDAO.getArticleById(articleId);
	}

	public List<Article> getHighlightedArticles() {
		return articleDAO.getHighlightedArticles();
	}

	public int addArticle(Article article) {
		return articleDAO.addArticle(article);
	}

	public boolean updateArticle(Article article) {
		return articleDAO.updateArticle(article);
	}

	public boolean deleteArticle(int articleId) {
		return articleDAO.deleteArticle(articleId);
	}
}
