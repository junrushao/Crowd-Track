<%@ page import="acmdb04.Connector" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="acmdb04.Browsing" %>
<%
    String redirect = "../show.jsp?fail=true#poi_browsing";
    try {
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("username") == null) {
            redirect = "../index.jsp";
            throw new Exception("not logged in");
        }

        Float min_price = Utility.toFloat(request.getParameter("min_price"));
        Float max_price = Utility.toFloat(request.getParameter("max_price"));
        String _keywords = Utility.toString(request.getParameter("keyword"));
        String login = (String) session.getAttribute("username");
        String address = Utility.toString(request.getParameter("address"));
        String category = Utility.toString(request.getParameter("category"));
        String sortBy = Utility.toString(request.getParameter("field"));
        String[] keywords = _keywords == null ? new String[0] : Utility.split(_keywords, ',');

        Connector connector = new Connector();
        ResultSet result;
        if ("price".equals(sortBy))
            result = Browsing.sortByPrice(login, min_price, max_price, address, keywords, 1, category, connector.stmt);
        else if ("average score".equals(sortBy))
            result = Browsing.sortByFeedback(login, min_price, max_price, address, keywords, 1, category, connector.stmt);
        else if ("average trusted score".equals(sortBy))
            result = Browsing.sortByTrustedFeedback(login, min_price, max_price, address, keywords, 1, category, connector.stmt);
        else
            throw new Exception("fuck you");
        session.setAttribute("result", result);
        session.setAttribute("back", "show.jsp");
        response.sendRedirect("../POI.jsp");
    }
    catch (Exception e) {
        System.out.println("fail");
        e.printStackTrace();
        response.sendRedirect(redirect);
    }

%>