<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="acmdb04.Feedback" %>
<%@ page import="java.sql.Date" %>
<%
    String redirect = "../say.jsp?fail=true#feedback";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        int pid = Utility.toInt(request.getParameter("feedback_pid"));
        int score = Utility.toInt(request.getParameter("score"));
        Date date = Utility.toDate(request.getParameter("feedback_date"));
        String login = (String) session.getAttribute("username");
        String text = Utility.toString(request.getParameter("text"));

        Connector connector = new Connector();
        boolean result = Feedback.register(pid, login, text, date == null ? null : date.toString(), score, connector.stmt);
        if (!result)
            throw new Exception("fail");

        System.out.println("success");
        response.sendRedirect("../say.jsp");
    } catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>