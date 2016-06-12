<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("say.jsp");
    }
    else {

        ArrayList<Integer> pids = (ArrayList<Integer>) session.getAttribute("visit_pids");
        ArrayList<Float> costs = (ArrayList<Float>) session.getAttribute("visit_costs");
        ArrayList<Integer> heads = (ArrayList<Integer>) session.getAttribute("visit_heads");
        ArrayList<Date> dates = (ArrayList<Date>) session.getAttribute("visit_dates");
//        session.setAttribute("visit_pids", null);
//        session.setAttribute("visit_costs", null);
//        session.setAttribute("visit_heads", null);
//        session.setAttribute("visit_dates", null);
//        session.setAttribute("back", null);
%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CrowdTrack :: <% out.println(session.getAttribute("username")); %></title>

    <link rel="stylesheet" href="css/pure-min.css">
    <link rel="stylesheet" href="css/grids-responsive-min.css">
    <link rel="stylesheet" href="css/blog.css">
    <link rel="stylesheet" href="css/side-menu.css">
    <link rel="stylesheet" href="css/prising.css">
    <link rel="stylesheet" href="css/popup.css">

</head>
<body>

<div id="layout" class="pure-g">
    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">Show</h1>
            <h2 class="brand-tagline">CrowdTrack :: <% out.println(session.getAttribute("username"));%></h2>

            <nav class="nav">
                <ul class="nav-list">
                    <%
                        if ("true".equals(session.getAttribute("is_admin"))) {
                    %>
                    <li class="nav-item">
                        <a class="pure-button" href="manage.jsp">Manage</a>
                    </li>
                    <%
                        }
                    %>
                    <li class="nav-item">
                        <a class="pure-button" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="jsp/logout.jsp">Logout</a>
                    </li>
                </ul>
                <ul class="nav-list">
                    <li class="nav-item">
                        <a class="pure-button" href="jsp/02_02_submit.jsp">Confirm</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="jsp/02_01_clear_form.jsp">Cancel</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="content pure-u-1 pure-u-md-3-4">
        <div class="content_header">
            <h1>Crowd Track</h1>
            <h2>Show me your world</h2>
        </div>

        <table class="pure-table pure-table-horizontal" style="margin-left: auto; margin-right: auto; margin-top: 5%;">
            <thead>
            <tr>
                <th>Place ID</th>
                <th>Cost</th>
                <th>Heads</th>
                <th>Date</th>
            </tr>
            </thead>

            <tbody>
            <%
                try {
                    int n = pids.size();
                    for (int i = 0; i < n; ++i) {
            %>
            <%
                out.println("<tr>");
                out.println("<td>" + pids.get(i) + "</td>");
                out.println("<td>" + costs.get(i) + "</td>");
                out.println("<td>" + heads.get(i) + "</td>");
                out.println("<td>" + dates.get(i) + "</td>");
                out.println("</tr>");
            %>
            <%
                    }
                } catch (Exception e) {
                    System.out.println("fail");
                    e.printStackTrace();
                    response.sendRedirect("say.jsp");
                }
            %>
            </tbody>

        </table>
    </div>

</div>

<%
    if (session.getAttribute("result") != null) {
        String result = (String) session.getAttribute("result");
        session.setAttribute("result", null);
        System.out.println("result = " + result);
%>
<script>alert("<%out.print(result);%>")</script>
<%
    }
%>

<%
    }
%>

</body>
</html>
