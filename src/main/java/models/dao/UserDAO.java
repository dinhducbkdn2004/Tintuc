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
            System.out.print(username + " " + password);
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

    public boolean insertUser(User user) {
        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "INSERT INTO user (username, password, name, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            String hashedPassword = PasswordUtils.hashPassword(user.getPassword());
            ps.setString(2, hashedPassword);
            ps.setString(3, user.getName());
            ps.setString(4, "user"); // mặc định user mới đăng ký sẽ là user
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isUserExist(String username) {
        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "SELECT COUNT(*) FROM user WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}