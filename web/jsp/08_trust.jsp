<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="acmdb04.Trust" %>
<%
    String redirect = "../share.jsp?fail=true#trust";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        String login1 = (String) session.getAttribute("username");
        String login2 = Utility.toString(request.getParameter("login"));
        String trustful = Utility.toString(request.getParameter("type"));

        Connector connector = new Connector();
        boolean result = Trust.register(login1, login2, trustful.equals("Trusted"), connector.stmt);
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