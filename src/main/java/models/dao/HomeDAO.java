package models.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.ConnectDB;

public class HomeDAO {

	public void addOrUpdateArticleToHome(int articleId, int position) throws SQLException {
		Connection connection = ConnectDB.getConnection();

		String resetSql = "UPDATE home SET articleId = NULL WHERE articleId = ?";
		PreparedStatement resetStatement = connection.prepareStatement(resetSql);
		resetStatement.setInt(1, articleId);
		resetStatement.executeUpdate();
		resetStatement.close();

		String sql = "UPDATE home SET articleId = ? WHERE position = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, articleId);
		preparedStatement.setInt(2, position);
		preparedStatement.executeUpdate();

		preparedStatement.close();
		connection.close();
	}
}