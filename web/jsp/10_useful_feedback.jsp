<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="acmdb04.UsefulFeedback" %>
<%
    String redirect = "../share.jsp?fail=true#useful_feedback";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        int pid = Utility.toInt(request.getParameter("poi"));
        int n = Utility.toInt(request.getParameter("top_n"));

        Connector connector = new Connector();
        ResultSet result = UsefulFeedback.ask(pid, connector.stmt);
        if (result == null)
            throw new Exception("fail");
        System.out.println("success");
        session.setAttribute("result", result);
        session.setAttribute("top_m", n);
        session.setAttribute("back", "share.jsp");
        response.sendRedirect("../Feedback.jsp");
    } catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>