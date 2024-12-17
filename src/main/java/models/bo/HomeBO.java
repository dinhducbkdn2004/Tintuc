package models.bo;

import java.sql.SQLException;
import models.dao.HomeDAO;

public class HomeBO {
	private HomeDAO homeDAO;

	public HomeBO() {
		homeDAO = new HomeDAO();
	}

	public void addOrUpdateArticleToHome(int articleId, int position) throws ClassCastException, SQLException {
		homeDAO.addOrUpdateArticleToHome(articleId, position);
	}
}