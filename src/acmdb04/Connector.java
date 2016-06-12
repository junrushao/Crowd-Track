package acmdb04;

import java.sql.*;

public class Connector {
    public Connection con;
    public Statement stmt;

    public Connector() throws Exception {
        try {
            String userName = "acmdbu04";
            String password = "l0ikga5q";
            String url = "jdbc:mysql://georgia.eng.utah.edu/acmdb04";
//            String userName = "root";
//            String password = "sjr.cxy";
//            String url = "jdbc:mysql://localhost:3306/test?useUnicode=yes&characterEncoding=UTF-8";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, userName, password);
            stmt = con.createStatement();
        } catch (Exception e) {
            System.err.println("Unable to open mysql jdbc connection.");
            System.err.println(e.getMessage());
            throw (e);
        }
    }

    public void closeConnection() throws Exception {
        if (con != null)
            con.close();
        if (stmt != null)
            stmt.close();
    }

}
