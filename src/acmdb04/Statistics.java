package acmdb04;

import java.sql.*;

public class Statistics {
    public static ResultSet PopularPOIs(String category, Statement stmt) {
        String sql = "SELECT p.*, COUNT(v.vid) AS totalVisit"
                + " FROM (POI p) LEFT JOIN (Visit v) USING (pid)"
                + " WHERE p.category=\"" + category + "\""
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

    public static ResultSet ExpensivePOIs(String category, Statement stmt) {
        String sql = "SELECT p.*, AVG(ve.cost/ve.number_of_heads) AS totalCost"
                + " FROM (POI p) LEFT JOIN ((Visit v) NATURAL JOIN (VisitEvent ve)) USING (pid)"
                + " WHERE p.category=\"" + category + "\""
                + " GROUP BY p.pid"
                + " ORDER BY AVG(ve.cost/ve.number_of_heads) DESC;";
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

    public static ResultSet HighlyRatedPOIs(String category, Statement stmt) {
        String sql = "SELECT p.*, AVG(fb.score) AS totalScore"
                + " FROM (POI p) LEFT JOIN (Feedback fb) USING (pid)"
                + " WHERE p.category=\"" + category + "\""
                + " GROUP BY p.pid"
                + " ORDER BY AVG(fb.score) DESC;";
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
