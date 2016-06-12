<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.User" %>
<%@ page import="acmdb04.Utility" %>
<%
    try {
        request.setCharacterEncoding("UTF-8");
        String username = Utility.toString((request.getParameter("register_username")));
        String password = Utility.toString(request.getParameter("register_password"));
        String name = Utility.toString(request.getParameter("name"));
        String address = Utility.toString(request.getParameter("address"));
        String phone = Utility.toString(request.getParameter("phone"));
        System.out.printf("username = %s, password = %s, name = %s, address = %s, phone = %s\n", username, password, name, address, phone);
        Utility.checkPhoneNumber(phone);
        Connector connector = new Connector();
        if (!User.register(username, password, name, address, phone, connector.stmt))
            throw new Exception("failed");
        System.out.println("success");
        session.setAttribute("username", username);
        session.setAttribute("is_admin", "false");
        response.sendRedirect("../index.jsp");
    } catch (Exception e) {
        System.out.println("fail");
        response.sendRedirect("../index.jsp?fail=true#signup");
    }
%>