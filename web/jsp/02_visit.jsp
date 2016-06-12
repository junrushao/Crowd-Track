<%@ page import="java.util.ArrayList" %>
<%@ page import="acmdb04.Utility" %>
<%@ page import="java.sql.Date" %>
<%@ page import="acmdb04.Connector" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="acmdb04.Suggestion" %><%
    System.out.println("Here I am!");
    try {
        request.setCharacterEncoding("UTF-8");

        ArrayList<Integer> pids;
        ArrayList<Float> costs;
        ArrayList<Integer> heads;
        ArrayList<Date> dates;

        if (session.getAttribute("visit_pids") == null) {
            pids = new ArrayList<Integer>();
            session.setAttribute("visit_pids", pids);
        }
        else {
            pids = (ArrayList<Integer>) session.getAttribute("visit_pids");
        }
        if (session.getAttribute("visit_costs") == null) {
            costs = new ArrayList<Float>();
            session.setAttribute("visit_costs", costs);
        }
        else {
            costs = (ArrayList<Float>) session.getAttribute("visit_costs");
        }
        if (session.getAttribute("visit_heads") == null) {
            heads = new ArrayList<Integer>();
            session.setAttribute("visit_heads", heads);
        }
        else {
            heads = (ArrayList<Integer>) session.getAttribute("visit_heads");
        }
        if (session.getAttribute("visit_dates") == null) {
            dates = new ArrayList<Date>();
            session.setAttribute("visit_dates", dates);
        }
        else {
            dates = (ArrayList<Date>) session.getAttribute("visit_dates");
        }

        Integer pid = Utility.toInt(request.getParameter("pid"));
        Float cost = Utility.toFloat(request.getParameter("cost"));
        Integer head = Utility.toInt(request.getParameter("heads"));
        Date date = Utility.toDate(request.getParameter("date"));
        System.out.println(pid);
        System.out.println(cost);
        System.out.println(head);
        System.out.println(date);
        if (!(pid == null && cost == null && head == null && date == null)) {
            pids.add(pid);
            costs.add(cost);
            heads.add(head);
            dates.add(date);
        }

        Connector connector = new Connector();
        StringBuilder result = new StringBuilder("We recommend some places for you:\\n");
        ResultSet resultSet = Suggestion.ask(pid, connector.stmt);
        int cnt = 0;
        while (resultSet.next()) {
            ++cnt;
            int suggest_pid = resultSet.getInt(1);
            String name = resultSet.getString(2);
            result.append("ID: ").append(suggest_pid).append(", Name: ").append(name).append("\\n");
//            if (cnt == 5)
//                break;
        }
        if (cnt > 0)
            session.setAttribute("result", result.toString());
        else
            session.setAttribute("result", "Sorry, temporarily we do not have place to recommend for you.");

        if (request.getParameter("add_more") != null) {
            response.sendRedirect("../say.jsp#visit");
        }
        else if (request.getParameter("review") != null) {
            response.sendRedirect("../VisitInfo.jsp");
        }
        else {
            throw new Exception("which button did you choose???");
        }
        System.out.println("Done!");
    }
    catch (Exception e) {
        e.printStackTrace();
        System.out.println("Something wrong");
        response.sendRedirect("../say.jsp?fail=true#visit");
    }
%>