package acmdb04;

import java.sql.*;

public class User {
    public User() {
    }

    private static void update(String login, String name, String para, Statement stmt) throws Exception {
        if (para == null) return;
        if (para == "")
            para = null;
        else {
            StringBuilder temp = new StringBuilder(para.toString());
            temp.insert(0, "\"");
            temp.append("\"");
            para = temp.toString();
        }
        String sql = "UPDATE Users SET %s = \"%s\" WHERE login = %s;";
        sql = String.format(sql, name, para, login);
        System.out.println("Executing: " + sql);
        stmt.executeUpdate(sql);
    }

    public static boolean register(String login, String psw, String name, String address, String phone, Statement stmt) {
        String sql ="INSERT INTO Users (login, psw) VALUES (\"%s\", \"%s\");";
        sql = String.format(sql, login, psw);

        try {
            System.out.println("Executing: " + sql);
            stmt.executeUpdate(sql);
            update(login, "name", name, stmt);
            update(login, "address", address, stmt);
            update(login, "phone", phone, stmt);
            return true;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
        }
        return false;
    }
}
