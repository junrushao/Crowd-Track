package acmdb04;

import java.sql.*;

public class Favorite {

    public Favorite() {
    }

    public static boolean register(String login, int pid, Statement stmt) {
        String sql = "INSERT INTO Favorites (login, pid) VALUES (\"" + login + "\"," + pid + ");";
        try {
            System.out.println("Executing: " + sql);
            stmt.executeUpdate(sql);
            return true;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
        }
        return false;
    }
}
