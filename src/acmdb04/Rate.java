package acmdb04;

import java.sql.*;

public class Rate {
    public Rate() {
    }

    private static boolean _register(String login, String rated_login, int rated_pid, int rating, Statement stmt) {
        if (login.equals(rated_login)) {
            System.out.println("A user should not be allowed to provide a usefulness-rating for his or her own feedback!\n");
            return false;
        }
        String sql = "INSERT INTO Rates (login, rated_login, rated_pid, rating) VALUES (\"" + login + "\",\"" + rated_login + "\"," + rated_pid + "," + rating + ");";
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

    public static boolean register(String login, String rated_login, int rated_pid, int rating, Statement stmt) {
        String sql = String.format("SELECT f.login FROM Feedback f WHERE f.pid = %s AND f.login = \"%s\";", rated_pid, rated_login);
        try {
            System.out.println("Executing: " + sql);
            ResultSet res = stmt.executeQuery(sql);
            if (!res.next())
                return false;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
            return false;
        }
        return _register(login, rated_login, rated_pid, rating, stmt);
    }
}