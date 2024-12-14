package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.ConnectDB;

public class PasswordHasher {
    public static void main(String[] args) {
        try (Connection conn = ConnectDB.getConnection()) {
            String selectSQL = "SELECT username, password FROM user";
            PreparedStatement selectStmt = conn.prepareStatement(selectSQL);
            ResultSet rs = selectStmt.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                String plainPassword = rs.getString("password");

                // Hash the plaintext password
                String hashedPassword = PasswordUtils.hashPassword(plainPassword);

                // Update the password in the database
                String updateSQL = "UPDATE user SET password = ? WHERE username = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
                updateStmt.setString(1, hashedPassword);
                updateStmt.setString(2, username);
                updateStmt.executeUpdate();
                updateStmt.close();
            }

            rs.close();
            selectStmt.close();
            System.out.println("Password hashing completed successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}