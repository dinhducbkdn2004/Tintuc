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
}