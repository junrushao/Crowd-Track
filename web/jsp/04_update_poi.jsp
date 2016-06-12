<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.POI" %>
<%@ page import="acmdb04.Utility" %>
<%
    String redirect = "../manage.jsp?fail=true#update_poi";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null || !"true".equals(session.getAttribute("is_admin"))) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        int pid = Utility.toInt(request.getParameter("update_pid"));
        String value = Utility.toString(request.getParameter("update_value"));
        String field = Utility.toString(request.getParameter("field"));
        System.out.printf("pid = %s, value = %s, field = %s\n", pid, value, field);

        if ("phone".equals(field))
            Utility.checkPhoneNumber(value);

        if (value == null)
            value = "";

        Connector connector = new Connector();
        boolean result;
        if ("keywords".equals(field))
            result = POI.update_keywords(pid, Utility.split(value, ','), connector.stmt);
        else
            result = POI.update(pid, field, value, connector.stmt);
        if (!result)
            throw new Exception("Update poi failed");
        System.out.println("success");
        response.sendRedirect("../manage.jsp");
    }
    catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>