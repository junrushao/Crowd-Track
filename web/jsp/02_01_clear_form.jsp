<%
    request.setCharacterEncoding("UTF-8");
    session.setAttribute("visit_pids", null);
    session.setAttribute("visit_costs", null);
    session.setAttribute("visit_heads", null);
    session.setAttribute("visit_dates", null);
    response.sendRedirect("../say.jsp");
%>