<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="acmdb04.Suggestion" %>
<%
    String redirect = "../show.jsp?fail=true#suggestions";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null) {
            redirect = "../index.jsp";
            throw new Exception("not logged in");
        }

        Integer pid = Utility.toInt(request.getParameter("visited_site"));

        Connector connector = new Connector();
        ResultSet resultSet = Suggestion.ask(pid, connector.stmt);
        session.setAttribute("result", resultSet);
        session.setAttribute("back", "show.jsp");
        response.sendRedirect("../POI.jsp");
    }
    catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>