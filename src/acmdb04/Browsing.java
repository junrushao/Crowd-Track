package acmdb04;

import java.sql.*;

public class Browsing {
    Browsing() {
    }

    public static ResultSet sortByPrice(String login, Float minPrice, Float maxPrice, String address, String[] keywords, int keyword_type, String category, Statement stmt)
    //keyword_type: does not matter
    {
        String sql = null;
        boolean first_condition = true;
        sql = "SELECT *"
                + " FROM POI p";
        if (minPrice != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.price >= " + minPrice;
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.price >= " + minPrice;
            }
        }
        if (maxPrice != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.price <= " + maxPrice;
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.price <= " + maxPrice;
            }
        }
        if (address != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.address LIKE \"%" + address + "%\"";
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.address LIKE \"%" + address + "%\"";
            }
        }
        if (category != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.category=\"" + category + "\"";
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.category=\"" + category + "\"";
            }
        }
        if (keywords.length > 0) {
            for (int i = 0; i < keywords.length; ++i) {
                StringBuilder builder = new StringBuilder();
                builder.append("(SELECT DISTINCT h.pid FROM hasKeywords h WHERE h.word=\"" + keywords[i] + "\")");
                if (first_condition == true) {
                    sql = sql
                          + " WHERE"
                          + " p.pid IN " + builder.toString();
                    first_condition = false;
                } else {
                    sql = sql
                          + " AND p.pid IN " + builder.toString();
                }
            }
        }
        sql = sql + " ORDER BY p.price;";
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

    public static ResultSet sortByFeedback(String login, Float minPrice, Float maxPrice, String address, String[] keywords, int keyword_type, String category, Statement stmt)
    //keyword_type: does not matter
    {
        String sql = null;
        boolean first_condition = true;
        sql = "SELECT p.*, AVG(fb.score) AS avgScore"
                + " FROM (POI p) LEFT JOIN (Feedback fb) USING (pid)";
        if (minPrice != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.price >= " + minPrice;
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.price >= " + minPrice;
            }
        }
        if (maxPrice != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.price <= " + maxPrice;
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.price <= " + maxPrice;
            }
        }
        if (address != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.address LIKE \"%" + address + "%\"";
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.address LIKE \"%" + address + "%\"";
            }
        }
        if (category != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.category=\"" + category + "\"";
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.category=\"" + category + "\"";
            }
        }
        if (keywords.length > 0) {
            for (int i = 0; i < keywords.length; ++i) {
                StringBuilder builder = new StringBuilder();
                builder.append("(SELECT DISTINCT h.pid FROM hasKeywords h WHERE h.word=\"" + keywords[i] + "\")");
                if (first_condition == true) {
                    sql = sql
                          + " WHERE"
                          + " p.pid IN " + builder.toString();
                    first_condition = false;
                } else {
                    sql = sql
                          + " AND p.pid IN " + builder.toString();
                }
            }
        }
        sql = sql + " GROUP BY p.pid"
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

    public static ResultSet sortByTrustedFeedback(String login, Float minPrice, Float maxPrice, String address, String[] keywords, int keyword_type, String category, Statement stmt)
    //keyword_type: does not matter
    {
        String sql = null;
        boolean first_condition = true;
        sql = "SELECT p.*, AVG(fb2.score) AS avgScore"
                + " FROM (POI p) LEFT JOIN"
                + " ((SELECT * FROM Feedback fb"
                + " WHERE fb.login IN ("
                + " SELECT t.login2"
                + " FROM Trust t"
                + " WHERE t.login1=\"" + login + "\""
                + " AND t.is_trusted = true )"
                + " ) AS fb2) USING (pid)";
        if (minPrice != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.price >= " + minPrice;
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.price >= " + minPrice;
            }
        }
        if (maxPrice != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.price <= " + maxPrice;
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.price <= " + maxPrice;
            }
        }
        if (address != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.address LIKE \"%" + address + "%\"";
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.address LIKE \"%" + address + "%\"";
            }
        }
        if (category != null) {
            if (first_condition == true) {
                sql = sql
                        + " WHERE"
                        + " p.category=\"" + category + "\"";
                first_condition = false;
            } else {
                sql = sql
                        + " AND p.category=\"" + category + "\"";
            }
        }
        if (keywords.length > 0) {
            for (int i = 0; i < keywords.length; ++i) {
                StringBuilder builder = new StringBuilder();
                builder.append("(SELECT DISTINCT h.pid FROM hasKeywords h WHERE h.word=\"" + keywords[i] + "\")");
                if (first_condition == true) {
                    sql = sql
                          + " WHERE"
                          + " p.pid IN " + builder.toString();
                    first_condition = false;
                } else {
                    sql = sql
                          + " AND p.pid IN " + builder.toString();
                }
            }
        }
        sql = sql
                + " GROUP BY p.pid"
                + " ORDER BY avgScore DESC;";
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
