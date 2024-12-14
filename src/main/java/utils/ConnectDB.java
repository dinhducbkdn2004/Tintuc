package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tintuc", "root", "");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }
        return connection;
    }

}