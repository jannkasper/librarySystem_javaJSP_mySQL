package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class myConnection {
    public static Connection getConnection () {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:8889/javaJSP_library","root", "root");
        } catch (SQLException e) {
            System.out.println("JAN1 " + e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


        return con;

    }
}