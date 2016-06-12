<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="acmdb04.UserAwards" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%
    String redirect = "../manage.jsp?fail=true#best";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null || !"true".equals(session.getAttribute("is_admin"))) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        int top_m = Utility.toInt(request.getParameter("top_m"));
        String best = Utility.toString(request.getParameter("option"));
        System.out.printf("top_m = %d, best = %s\n", top_m, best);

        if (top_m <= 0 || top_m > 50)
            throw new Exception("Invalid query");

        Connector connector = new Connector();
        ResultSet resultSet;
        if ("trusted".equals(best))
            resultSet = UserAwards.mostTrusted(connector.stmt);
        else
            resultSet = UserAwards.mostUseful(connector.stmt);

        ArrayList<String> logins = new ArrayList<String>();
        for (int cnt = 1; cnt <= top_m && resultSet.next(); ++cnt) {
            logins.add(resultSet.getString(1));
        }
        StringBuilder result = new StringBuilder(String.format("Total %d users found:", logins.size()));
        for (String s : logins)
            result = result.append(" ").append(s);

        System.out.println("success, result = " + result);
        session.setAttribute("result", result.toString());
        response.sendRedirect("../manage.jsp#best");
    }
    catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>