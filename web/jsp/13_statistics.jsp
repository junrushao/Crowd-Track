<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="acmdb04.Suggestion" %>
<%@ page import="acmdb04.Statistics" %>
<%
    String redirect = "../show.jsp?fail=true#suggestions";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null) {
            redirect = "../index.jsp";
            throw new Exception("not logged in");
        }

        int m = Utility.toInt(request.getParameter("top_m"));
        String field = Utility.toString(request.getParameter("field"));
        String category = Utility.toString(request.getParameter("statistics_category"));

        if (m <= 0)
            throw new Exception("m < 0");

        Connector connector = new Connector();
        ResultSet resultSet;
        if ("most popular".equals(field))
            resultSet = Statistics.PopularPOIs(category, connector.stmt);
        else if ("most expensive".equals(field))
            resultSet = Statistics.ExpensivePOIs(category, connector.stmt);
        else if ("most highly rated".equals(field))
            resultSet = Statistics.HighlyRatedPOIs(category, connector.stmt);
        else
            throw new Exception("never happen");

        session.setAttribute("result", resultSet);
        session.setAttribute("top_m", m);
        session.setAttribute("back", "show.jsp");
        response.sendRedirect("../POI.jsp");
    }
    catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>