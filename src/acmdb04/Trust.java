package acmdb04;

import java.sql.*;

public class Trust {

    public Trust() {
    }

    public static boolean register(String login1, String login2, boolean is_trusted, Statement stmt) {
        String sql = "INSERT INTO Trust (login1, login2, is_trusted) VALUES (\"" + login1 + "\",\"" + login2 + "\"," + is_trusted + ");";
        if (login1.equals(login2)) {
            System.out.println("A user should not be allowed to trust himself/herself!\n");
            return false;
        }
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
