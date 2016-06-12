package acmdb04;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Utility {

    public static Integer toInt(String s) {
        if ("".equals(s))
            return null;
        return Integer.parseInt(s);
    }

    public static Float toFloat(String s) {
        if ("".equals(s))
            return null;
        return Float.parseFloat(s);
    }

    public static String toString(String s) {
        if ("".equals(s))
            return null;
        return s;
    }

    public static String[] split(String keywords, char delimit) {
        if (keywords == null || "".equals(keywords))
            return new String[0];
        int cnt = 0;
        for (char c : keywords.toCharArray())
            if (c == delimit)
                ++cnt;
        String result[] = new String[cnt + 1];
        cnt = 0;
        for (int s = 0, t; s < keywords.length(); s = t + 1) {
            for (t = s; t < keywords.length() && keywords.charAt(t) != delimit; )
                ++t;
            System.out.printf("[%d, %d] = %s\n", s, t, keywords.substring(s, t));
            result[cnt++] = keywords.substring(s, t);
        }
        return result;
    }

    public static Date toDate(String date) throws ParseException {
        if ("".equals(date))
            return null;
        return new Date(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime());
    }

    public static void checkPhoneNumber(String s) throws ParseException {
        if (s == null || "".equals(s))
            return;
        for (char c: s.toCharArray())
            if (!Character.isDigit(c))
                throw new ParseException("not valid phone number", 1);
    }
}
