package acmdb04;

import java.sql.*;

public class Suggestion {
    Suggestion() {
    }

    public static ResultSet ask(int pid, Statement stmt) {
        String sql = "SELECT p.*, COUNT(v.vid) AS totalVisit"
                + " FROM (POI p) NATURAL JOIN (Visit v)"
                + " WHERE v.login IN ("
                + " SELECT DISTINCT v2.login"
                + " FROM Visit v2"
                + " WHERE v2.pid = " + pid + ")"
		+ " AND p.pid <> " + pid
                + " GROUP BY p.pid"
                + " ORDER BY totalVisit DESC;";
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
