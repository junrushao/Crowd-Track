<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    if (session.getAttribute("username") == null || !"true".equals(session.getAttribute("is_admin"))) {
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
    <link rel="stylesheet" href="css/popup.css">

</head>
<body>

<div class="popup-wrapper" id="new_poi">
    <div class="popup-container">
        <form class="pure-form pure-form-aligned" action="jsp/03_new_poi.jsp" method="post">
            <fieldset>
                <%--<div class="pure-control-group">--%>
                <%--<label for="new_pid"><span class="red_me_please">*</span>ID</label>--%>
                <%--<input id="new_pid" name="new_pid" type="text" placeholder="ID" required>--%>
                <%--</div>--%>

                <div class="pure-control-group">
                    <label for="new_name"><span class="red_me_please">*</span>Name</label>
                    <input id="new_name" name="new_name" type="text" placeholder="Name" required>
                </div>

                <div class="pure-control-group">
                    <label for="new_category">Category</label>
                    <input id="new_category" name="new_category" type="text" placeholder="Category">
                </div>

                <div class="pure-control-group">
                    <label for="new_address">Address</label>
                    <input id="new_address" name="new_address" type="text" placeholder="Address">
                </div>

                <div class="pure-control-group">
                    <label for="new_price">Price</label>
                    <input id="new_price" name="new_price" type="text" placeholder="Price">
                </div>

                <div class="pure-control-group">
                    <label for="new_url">Url</label>
                    <input id="new_url" name="new_url" type="text" placeholder="Url">
                </div>

                <div class="pure-control-group">
                    <label for="new_phone">Phone</label>
                    <input id="new_phone" name="new_phone" type="text" placeholder="Phone">
                </div>

                <div class="pure-control-group">
                    <label for="new_establish_year">Establish year</label>
                    <input id="new_establish_year" name="new_establish_year" type="text" placeholder="Year">
                </div>

                <div class="pure-control-group">
                    <label for="new_operation_hours">Operation hours</label>
                    <input id="new_operation_hours" name="new_operation_hours" type="text" placeholder="Operation hours">
                </div>

                <div class="pure-control-group">
                    <label for="new_keywords">Keywords</label>
                    <input id="new_keywords" name="new_keywords" type="text" placeholder="Keywords, separated by comma">
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <label><span class="red_me_please">Failed</span></label>
                </div>
                <%
                    }
                %>
                <div class="pure-control-group">
                    <label></label>
                    <button type="submit" class="pure-button pure-button-primary">Submit</button>
                </div>
            </fieldset>
        </form>
        <a class="popup-close" href="manage.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="update_poi">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/04_update_poi.jsp" method="post">
            <fieldset>
                <div class="pure-control-group">
                    <label for="field"><span class="red_me_please">*</span>Field</label>
                    <select id="field" name="field">
                        <option>name</option>
                        <option>category</option>
                        <option>address</option>
                        <option>price</option>
                        <option>url</option>
                        <option>phone</option>
                        <option>establish_year</option>
                        <option>operation_hours</option>
                        <option>keywords</option>
                    </select>
                </div>

                <div class="pure-control-group">
                    <label for="update_pid"><span class="red_me_please">*</span>ID</label>
                    <input id="update_pid" name="update_pid" type="text" required>
                </div>

                <div class="pure-control-group">
                    <label for="update_value">New value</label>
                    <input id="update_value" name="update_value" type="text">
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <label><span class="red_me_please">Failed</span></label>
                </div>
                <%
                    }
                %>
                <div class="pure-control-group">
                    <label></label>
                    <button type="submit" class="pure-button pure-button-primary">Submit</button>
                </div>
            </fieldset>
        </form>
        <a class="popup-close" href="manage.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="separation">
    <div class="popup-container">
        <form class="pure-form pure-form-aligned" action="jsp/12_separation.jsp" method="post">
            <fieldset>
                <div class="pure-control-group">
                    <label for="login_1"><span class="red_me_please">*</span>Login 1</label>
                    <input id="login_1" name="login_1" type="text" placeholder="First Login" required>
                </div>

                <div class="pure-control-group">
                    <label for="login_2"><span class="red_me_please">*</span>Login 2</label>
                    <input id="login_2" name="login_2" type="text" placeholder="Second Login" required>
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <label><span class="red_me_please">Failed</span></label>
                </div>
                <%
                    }
                %>
                <div class="pure-control-group">
                    <label></label>
                    <button type="submit" class="pure-button pure-button-primary">Calculate</button>
                </div>
            </fieldset>
        </form>
        <a class="popup-close" href="manage.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="best">
    <div class="popup-container">
        <form class="pure-form pure-form-aligned" action="jsp/14_best.jsp" method="post">
            <fieldset>
                <div class="pure-control-group">
                    <label for="top_m"><span class="red_me_please">*</span>Number of top users</label>
                    <input id="top_m" name="top_m" type="text" placeholder="10" required>
                </div>

                <div class="pure-control-group">
                    <label for="option"><span class="red_me_please">*</span>Option</label>
                    <select id="option" name="option">
                        <option>trusted</option>
                        <option>useful</option>
                    </select>
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <span class="red_me_please">Invalid query, number too large or too small</span>
                </div>
                <%
                    }
                %>
                <div class="pure-control-group">
                    <label></label>
                    <button type="submit" class="pure-button pure-button-primary">Calculate</button>
                </div>
            </fieldset>
        </form>
        <a class="popup-close" href="manage.jsp">&times;</a>
    </div>
</div>

<div id="layout" class="pure-g">
    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">Manage</h1>
            <h2 class="brand-tagline">CrowdTrack :: <% out.println(session.getAttribute("username"));%></h2>

            <nav class="nav">
                <ul class="nav-list">
                    <%
                        if ("true".equals(session.getAttribute("is_admin"))) {
                    %>
                    <li class="nav-item">
                        <a class="pure-button" href="#">Manage</a>
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
        <div class="posts">
            <%--3--%>
            <section class="post">
                <h2 class="post-title">New POI</h2>
                <p class="post-meta">
                    Click <a href="#new_poi">here</a> to add a POI.
                </p>
            </section>
            <%--4--%>
            <section class="post">
                <h2 class="post-title">Update POI</h2>
                <p class="post-meta">
                    Click <a href="#update_poi">here</a> to update a POI.
                </p>
            </section>
            <%--12--%>
            <section class="post">
                <h2 class="post-title">Two degrees of separation</h2>
                <p class="post-meta">
                    Click <a href="#separation">here</a> to query.
                </p>
            </section>
            <%--14--%>
            <section class="post">
                <h2 class="post-title">User awards</h2>
                <p class="post-meta">
                    Click <a href="#best">here</a> to query most trusted or useful users.
                </p>
            </section>
        </div>
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

</body>
</html>