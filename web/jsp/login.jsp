<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.UserLogin" %>
<%@ page import="acmdb04.Utility" %>
<%
    try {
        request.setCharacterEncoding("UTF-8");
        String username = Utility.toString(request.getParameter("login_username"));
        String password = Utility.toString(request.getParameter("login_password"));
        System.out.printf("username = %s, password = %s\n", username, password);

        Connector connector = new Connector();
        int result = UserLogin.login(username, password, connector.stmt);
        if (result == 0)
            throw new Exception("Login failed");
        session.setAttribute("username", username);
        session.setAttribute("is_admin", result == 1 ? "false" : "true");
        System.out.println("success");
        response.sendRedirect("../index.jsp");
    }
    catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect("../index.jsp?fail=true#signin");
    }

%>