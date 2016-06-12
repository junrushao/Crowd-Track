package acmdb04;

import java.sql.*;

public class Feedback {
    public Feedback() {
    }

    private static void update(int pid, String login, String name, Object para, Statement stmt) throws Exception {
        if (para == null)
            return;
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

        String sql = "UPDATE Feedback SET " + name + "=" + para + " WHERE pid=" + pid + " AND login=\"" + login + "\";";

        System.out.println("Executing: " + sql);
        stmt.executeUpdate(sql);
    }

    public static boolean register(int pid, String login, String text, String fbdate, Integer score, Statement stmt) {
        String sql = "INSERT INTO Feedback (pid, login, score) VALUES (" + pid + ",\"" + login + "\"," + score+");";
        try {
            System.out.println("Executing: " + sql);
            stmt.executeUpdate(sql);
            if (text != null && text.length() != 0)
                update(pid, login, "text", text, stmt);
            update(pid, login, "fbdate", fbdate, stmt);
            return true;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
        }
        return false;
    }
}
