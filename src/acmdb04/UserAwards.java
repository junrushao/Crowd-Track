package acmdb04;

import java.sql.*;

public class UserAwards {
    UserAwards() {
    }

    public static ResultSet mostTrusted(Statement stmt) {
        String sql = "SELECT u.login"
                + " FROM Users u"
                + " ORDER BY ("
                + " SELECT COUNT(*)"
                + " FROM Trust t"
                + " WHERE t.login2=u.login AND t.is_trusted = true )"
                + " - ( SELECT COUNT(*)"
                + " FROM Trust t"
                + " WHERE t.login2 = u.login AND t.is_trusted = false"
                + " ) DESC;";
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

    public static ResultSet mostUseful(Statement stmt) {
        String sql = "SELECT u.login, AVG(r.rating) AS avgRating"
                + " FROM (Users u) LEFT JOIN (Rates r) ON (u.login=r.rated_login)"
                + " GROUP BY u.login"
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
