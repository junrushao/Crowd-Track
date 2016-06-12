<%
    session.setAttribute("username", null);
    session.setAttribute("is_admin", null);
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>