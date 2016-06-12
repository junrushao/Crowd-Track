package acmdb04;

import java.sql.*;

public class POI {
    public POI() {
    }

    public static boolean update(int pid, String name, Object para, Statement stmt) {
        if (para == null) return true;
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

        String sql = "UPDATE POI SET " + name + "=" + para + " WHERE pid=" + pid + ";";

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

    public static boolean update_keywords(int pid, String keywords[], Statement stmt) {
        String sql = "DELETE FROM hasKeywords WHERE pid=" + pid + ";";
        try {
            stmt.executeUpdate(sql);
            for (int i = 0; i < keywords.length; ++i) { 
                sql = "INSERT INTO hasKeywords (pid, word) VALUES (" + pid + ",\"" + keywords[i] + "\");";
                stmt.executeUpdate(sql);
            }
            return true;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql + "\n");
            System.out.println(e.getMessage());
        }
        return false;
    }

    public static int register(String name, String category, String address, Float price, String url, String phone, Integer establish_year, String operation_hours, Statement stmt) {
        String sql = "INSERT INTO POI (name) VALUES (\"" + name + "\");";
        try {
            System.out.println("Executing: " + sql);
//            stmt.executeUpdate(sql);
            int pid = -1;
            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()){
                pid = rs.getInt(1);
            }
            System.out.println("pid = " + pid);

            update(pid, "category", category, stmt);
            update(pid, "address", address, stmt);
            update(pid, "price", price, stmt);
            update(pid, "url", url, stmt);
            update(pid, "phone", phone, stmt);
            update(pid, "establish_year", establish_year, stmt);
            update(pid, "operation_hours", operation_hours, stmt);
            return pid;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Cannot execute: " + sql + "\n");
            System.out.println(e.getMessage());
        }
        return -1;
    }
}
