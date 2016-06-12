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
    <link rel="stylesheet" href="css/popup.css">

</head>
<body>

<div class="popup-wrapper" id="rate">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/07_rate.jsp" method="post">
            <fieldset>

                <div class="pure-control-group">
                    <label for="rate_poi"><span class="red_me_please">*</span>ID of place</label>
                    <input id="rate_poi" name="rate_poi" placeholder="ID" type="text" required>
                </div>

                <div class="pure-control-group">
                    <label for="rate_user"><span class="red_me_please">*</span>Whose feedback</label>
                    <input id="rate_user" name="rate_user" placeholder="Username" type="text" required>
                </div>

                <div class="pure-control-group">
                    <label for="score"><span class="red_me_please">*</span>Score</label>
                    <select id="score" name="score">
                        <option>0</option>
                        <option>1</option>
                        <option>2</option>
                    </select>
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
        <a class="popup-close" href="share.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="trust">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/08_trust.jsp" method="post">
            <fieldset>

                <div class="pure-control-group">
                    <label for="login"><span class="red_me_please">*</span>Username</label>
                    <input id="login" name="login" type="text" placeholder="Username" required>
                </div>

                <div class="pure-control-group">
                    <label for="type"><span class="red_me_please">*</span>Trustfulness</label>
                    <select id="type" name="type">
                        <option>Trusted</option>
                        <option>Not trusted</option>
                    </select>
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
        <a class="popup-close" href="share.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="useful_feedback">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/10_useful_feedback.jsp" method="post">
            <fieldset>

                <div class="pure-control-group">
                    <label for="poi"><span class="red_me_please">*</span>ID of place</label>
                    <input id="poi" name="poi" type="text" placeholder="ID" required>
                </div>

                <div class="pure-control-group">
                    <label for="top_n"><span class="red_me_please">*</span>How many to list</label>
                    <input id="top_n" name="top_n" type="text" placeholder="10" required>
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
        <a class="popup-close" href="share.jsp">&times;</a>
    </div>
</div>

<div id="layout" class="pure-g">
    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">Share</h1>
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
        <div class="posts">
            <%--7--%>
            <section class="post">
                <h2 class="post-title">Your feedback is useful / useless...</h2>
                <p class="post-meta">
                    Click <a href="#rate">here</a> to rate feedback you like or dislike!
                </p>
            </section>
            <%--8--%>
            <section class="post">
                <h2 class="post-title">Do you trust him / her?</h2>
                <p class="post-meta">
                    Click <a href="#trust">here</a> to rate a user's trustfulness.
                </p>
            </section>
            <%--10--%>
            <section class="post">
                <h2 class="post-title">Useful feedbacks</h2>
                <p class="post-meta">
                    Click <a href="#useful_feedback">here</a> to get people's most useful feedbacks on places you are interested in!
                </p>
            </section>
        </div>
    </div>

</div>


</body>
</html>