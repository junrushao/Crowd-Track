<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="acmdb04.Trust" %>
<%@ page import="acmdb04.Rate" %>
<%
    String redirect = "../share.jsp?fail=true#rate";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        int rate_poi = Utility.toInt(request.getParameter("rate_poi"));
        String rate_user = Utility.toString(request.getParameter("rate_user"));
        String login = (String) session.getAttribute("username");
        int score = Utility.toInt(request.getParameter("score"));

        Connector connector = new Connector();
        boolean result = Rate.register(login, rate_user, rate_poi, score, connector.stmt);
        if (!result)
            throw new Exception("fail");

        System.out.println("success");
        response.sendRedirect("../share.jsp");
    } catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>