package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tintuc?useUnicode=true&characterEncoding=UTF-8",
                    "root",
                    "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}