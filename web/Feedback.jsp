<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    if (session.getAttribute("username") == null || session.getAttribute("result") == null || session.getAttribute("back") == null) {
        response.sendRedirect("share.jsp");
    }
    else {
        String back = (String) session.getAttribute("back");
        Integer top_m = (Integer) session.getAttribute("top_m");
        session.setAttribute("back", null);
        session.setAttribute("top_m", null);
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
                        <a class="pure-button" href="<% out.print(back); %>">Back</a>
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
                <th>Username</th>
                <th>Score</th>
                <th>Date</th>
                <th>Text</th>
            </tr>
            </thead>

            <tbody>
            <%
                try {
                    ResultSet resultSet = (ResultSet) session.getAttribute("result");
                    session.setAttribute("result", null);
                    int cnt = 0;
                    while (resultSet.next()) {
                        int pid = resultSet.getInt(1);
                        String login = resultSet.getString(2);
                        String text = resultSet.getString(3);
                        Date date = resultSet.getObject(4) == null ? null : resultSet.getDate(4);
                        int score = resultSet.getInt(5);
            %>
            <%
                out.println("<tr>");
                out.println("<td>" + pid + "</td>");
                out.println("<td>" + login + "</td>");
                out.println("<td>" + score + "</td>");
                out.println("<td>" + date + "</td>");
                out.println("<td>" + text + "</td>");
                out.println("</tr>");
            %>
            <%
                        ++cnt;
                        if (top_m != null && cnt == top_m)
                            break;
                    }
                } catch (Exception e) {
                    System.out.println("fail");
                    e.printStackTrace();
                    response.sendRedirect("share.jsp");
                }
            %>
            </tbody>

        </table>
    </div>

</div>


</body>
</html>

<%
    }
%>