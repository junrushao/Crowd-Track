package acmdb04;

import java.sql.*;

public class UsefulFeedback {

    public UsefulFeedback() {
    }

    public static ResultSet ask(int pid, Statement stmt) {
        String sql = "SELECT fb.*, AVG(r.rating) AS avgRating"
                + " FROM (Feedback fb) LEFT JOIN (Rates r) ON (fb.pid=r.rated_pid AND fb.login=r.rated_login)"
                + " WHERE fb.pid = " + pid
                + " GROUP BY fb.pid, fb.login"
                + " ORDER BY avgRating DESC;";

        try {
            System.out.println("Executing: " + sql);
            ResultSet res = stmt.executeQuery(sql);
            return res;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
            return null;
        }
    }
}
