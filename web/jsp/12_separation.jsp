<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="acmdb04.Separation" %>
<%
    String redirect = "../manage.jsp?fail=true#separation";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null || !"true".equals(session.getAttribute("is_admin"))) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        String login1 = Utility.toString(request.getParameter("login_1"));
        String login2 = Utility.toString(request.getParameter("login_2"));
        System.out.printf("login1 = %s, login2 = %s\n", login1, login2);

        Connector connector = new Connector();
        String result = Separation.calcSeparation(login1, login2, connector.stmt);
        System.out.println("success, result = " + result);
        session.setAttribute("result", result);
        response.sendRedirect("../manage.jsp#separation");
    }
    catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>