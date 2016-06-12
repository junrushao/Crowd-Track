<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
    }
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

</head>
<body>


<div id="layout" class="pure-g">
    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">Home</h1>
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
            </nav>
        </div>
    </div>

    <div class="content pure-u-1 pure-u-md-3-4">
        <div class="content_header">
            <h1>Crowd Track</h1>
            <h2>Show me your world</h2>
        </div>
        <div class="pricing-tables pure-g">
            <div class="pure-u-1 pure-u-md-1-3">
                <div class="pricing-table pricing-table-free">
                    <div class="pricing-table-header">
                        <h2>List all places we know</h2>
                        <span class="pricing-table-price">
                            Show <span> </span>
                    </span>
                    </div>

                    <button class="button-choose pure-button" onclick="window.location.href='show.jsp'">Go</button>
                </div>
            </div>

            <div class="pure-u-1 pure-u-md-1-3">
                <div class="pricing-table pricing-table-biz pricing-table-selected">
                    <div class="pricing-table-header">
                        <h2>Comment places</h2>

                    <span class="pricing-table-price">
                        Say <span> </span>
                    </span>
                    </div>

                    <button class="button-choose pure-button" onclick="window.location.href='say.jsp'">Go</button>
                </div>
            </div>

            <div class="pure-u-1 pure-u-md-1-3">
                <div class="pricing-table pricing-table-enterprise">
                    <div class="pricing-table-header">
                        <h2>Let your friends know</h2>

                    <span class="pricing-table-price">
                        Share <span> </span>
                    </span>
                    </div>

                    <button class="button-choose pure-button"  onclick="window.location.href='share.jsp'" >Go</button>
                </div>
            </div>
        </div> <!-- end pricing-tables -->

    </div>
</div>


</body>
</html>