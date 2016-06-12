<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="acmdb04.Favorite" %>
<%
    String redirect = "../say.jsp?fail=true#favorite";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        int pid = Utility.toInt(request.getParameter("favorite_pid"));
        String login = (String) session.getAttribute("username");

        Connector connector = new Connector();
        boolean result = Favorite.register(login, pid, connector.stmt);
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