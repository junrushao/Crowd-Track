package acmdb04;

import java.sql.*;

public class Visit {

    public Visit() {
    }

    private static void update(int vid, String name, Object para, Statement stmt) throws Exception {
        if (para == null) return;
        if (para instanceof String) {
            if (para == "")
                para = null;
              else {
                StringBuilder temp = new StringBuilder(para.toString());
                temp.insert(0, "\"");
                temp.append("\"");
                para = temp.toString();
             }
        }
        String sql = "UPDATE VisitEvent SET " + name + "=" + para + " WHERE vid=" + vid + ";";
        System.out.println("Executing: " + sql);
        stmt.executeUpdate(sql);
    }

    private static int addVisitEvent(Float cost, Integer number_of_heads, String visit_date, Statement stmt) {
        String sql = "INSERT INTO VisitEvent (cost) VALUES (" + cost + ");";
        System.out.println("Executing: " + sql);
        try {
            int vid = -1;
            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                vid = rs.getInt(1);
            }
            update(vid, "number_of_heads", number_of_heads, stmt);
            update(vid, "visit_date", visit_date, stmt);
            return vid;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public static int register(String login, Integer pid, Float cost, Integer number_of_heads, String visit_date, Statement stmt) {
        int vid = addVisitEvent(cost, number_of_heads, visit_date, stmt);
        if (vid == -1) return -1;
        String sql = "INSERT INTO Visit (login, pid, vid) VALUES (\"" + login + "\"," + pid + "," + vid + ");";
        try {
            System.out.println("Executing: " + sql);
            stmt.executeUpdate(sql);
            return vid;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
        }
        return -1;
    }
}
