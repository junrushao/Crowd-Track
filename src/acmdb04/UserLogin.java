package acmdb04;

import java.sql.*;

public class UserLogin {
    public UserLogin() {
    }

    public static int login(String login_name, String psw, Statement stmt) {
        String sql = "SELECT * FROM Users WHERE login=\"" + login_name + "\" AND psw=\"" + psw + "\";";
        try {
            ResultSet res = stmt.executeQuery(sql);
            if (res.next()) {
                if (res.getBoolean("is_admin"))
                    return 2;
                else
                    return 1;
            }
            return 0;
        } catch (Exception e) {
            System.out.println("Cannot execute: " + sql);
            System.out.println(e.getMessage());
            return 0;
        }
    }
}
