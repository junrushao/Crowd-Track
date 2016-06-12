package acmdb04;

import java.sql.*;

public class Separation {
    Separation() {
    }

    public static String calcSeparation(String login1, String login2, Statement stmt) {
        if (oneDegree(login1, login2, stmt))
            return "1";
        if (twoDegree(login1, login2, stmt))
            return "2";
        return "more than 2";
    }

    private static boolean oneDegree(String login1, String login2, Statement stmt) {
        String sql = "SELECT *"
                + " FROM Favorites f"
                + " WHERE f.login=\"" + login1 + "\""
                + " AND f.pid IN ("
                + " SELECT f.pid"
                + " FROM Favorites f"
                + " WHERE f.login=\"" + login2
                + "\");";
        try {
            ResultSet res = stmt.executeQuery(sql);
            return res.next();
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
        }
        return false;
    }

    private static boolean twoDegree(String login1, String login2, Statement stmt) {
        String sql = "SELECT * FROM Users u WHERE EXISTS"
                + " (SELECT * FROM Favorites f WHERE f.login = u.login"
                + " AND f.pid IN ( SELECT f.pid"
                + " FROM Favorites f WHERE f.login=\"" + login1 + "\"))"
                + " AND EXISTS"
                + " (SELECT * FROM Favorites f WHERE f.login = u.login"
                + " AND f.pid IN ( SELECT f.pid"
                + " FROM Favorites f WHERE f.login=\"" + login2 + "\"));";
        try {
            ResultSet res = stmt.executeQuery(sql);
            return res.next();
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
        }
        return false;
    }
}
