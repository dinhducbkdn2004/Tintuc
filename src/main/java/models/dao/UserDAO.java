package models.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.bean.User;
import models.bean.User.Role;
import utils.ConnectDB;
import utils.PasswordUtils;

public class UserDAO {

    public User getUser(String username, String password) {
        User user = null;
        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM user WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                if (PasswordUtils.checkPassword(password, hashedPassword)) {
                    String name = rs.getString("name");
                    String roleStr = rs.getString("role");
                    Role role = Role.valueOf(roleStr.toLowerCase());
                    user = new User(username, null, name, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}