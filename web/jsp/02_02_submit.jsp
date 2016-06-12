<%@ page import="java.util.ArrayList" %>
<%@ page import="acmdb04.Visit" %>
<%@ page import="acmdb04.Connector" %>
<%@ page import="java.sql.Date" %><%

    System.out.println("02_02_submit.jsp");
    try {
        request.setCharacterEncoding("UTF-8");

        ArrayList<Integer> pids = (ArrayList<Integer>) session.getAttribute("visit_pids");
        ArrayList<Float> costs = (ArrayList<Float>) session.getAttribute("visit_costs");
        ArrayList<Integer> heads = (ArrayList<Integer>) session.getAttribute("visit_heads");
        ArrayList<Date> dates = (ArrayList<Date>) session.getAttribute("visit_dates");
        String login = (String) session.getAttribute("username");

        Connector connector = new Connector();
        int n = pids.size();
        boolean fail = false;
        for (int i = 0; i < n; ++i) {
            System.out.println(pids.get(i));
            System.out.println(costs.get(i));
            System.out.println(heads.get(i));
            System.out.println(dates.get(i));
            int result = Visit.register(login, pids.get(i), costs.get(i), heads.get(i), dates.get(i) == null ? null : dates.get(i).toString(), connector.stmt);
            if (result == -1)
                fail = true;
        }
        System.out.println("Done!");
        if (fail)
            throw new Exception("something wrong.");
        response.sendRedirect("02_01_clear_form.jsp");
    }
    catch (Exception e) {
        e.printStackTrace();
        System.out.println("something wrong.");
        session.setAttribute("result", "error");
        response.sendRedirect("02_01_clear_form.jsp");
    }
%>