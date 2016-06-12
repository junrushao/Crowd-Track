<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.POI" %>
<%@ page import="acmdb04.Utility" %>
<%
    String redirect = "../manage.jsp?fail=true#new_poi";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null || !"true".equals(session.getAttribute("is_admin"))) {
            redirect = "../index.jsp";
            throw new Exception("not admin");
        }

        String name = Utility.toString(request.getParameter("new_name"));
        String category = Utility.toString(request.getParameter("new_category"));
        String address = Utility.toString(request.getParameter("new_address"));
        Float price = Utility.toFloat(request.getParameter("new_price"));
        String url = Utility.toString(request.getParameter("new_url"));
        String phone = Utility.toString(request.getParameter("new_phone"));
        Integer establish_year = Utility.toInt(request.getParameter("new_establish_year"));
        String operation_hours = Utility.toString(request.getParameter("new_operation_hours"));
        String keywords[] = Utility.split(Utility.toString(request.getParameter("new_keywords")), ',');
        System.out.printf("name = %s, category = %s, address = %s, price = %f, url = %s, phone = %s, establish_year = %d, operation_hours = %s, keywords = %s\n", name, category, address, price, url, phone, establish_year, operation_hours, keywords);

        Utility.checkPhoneNumber(phone);
        Connector connector = new Connector();
        int result = POI.register(name, category, address, price, url, phone, establish_year, operation_hours, connector.stmt);
        if (result == -1)
            throw new Exception("Register new poi failed");
        boolean result2 = POI.update_keywords(result, keywords, connector.stmt);
        if (!result2)
            throw new Exception("failed");
        System.out.println("success");
        response.sendRedirect("../manage.jsp");
    } catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>