package models.bo;

import models.bean.User;
import models.dao.UserDAO;

public class UserBO {
	private UserDAO userDAO;

	public UserBO() {
		userDAO = new UserDAO();
	}

	public User checkLogin(String username, String password) {
		return userDAO.getUser(username, password);
	}

	public boolean registerUser(User user) {
		return userDAO.insertUser(user);
	}

	public boolean isUserExist(String username) {
		return userDAO.isUserExist(username);
	}
}