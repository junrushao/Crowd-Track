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


<div class="popup-wrapper" id="visit">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/02_visit.jsp" method="post">
            <fieldset>

                <div class="pure-control-group">
                    <label for="pid"><span class="red_me_please">*</span>ID of place</label>
                    <input id="pid" name="pid" type="text" placeholder="ID" required>
                </div>

                <div class="pure-control-group">
                    <label for="cost">Cost</label>
                    <input id="cost" name="cost" type="text" placeholder="0.0">
                </div>

                <div class="pure-control-group">
                    <label for="heads">Number of heads</label>
                    <input id="heads" name="heads" type="text" placeholder="1">
                </div>

                <div class="pure-control-group">
                    <label for="date">Visiting date</label>
                    <input id="date" name="date" type="text" placeholder="yyyy-MM-dd">
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
                    <button type="submit" name="add_more" class="pure-button pure-button-primary">Add more</button>
                    <button type="submit" name="review" class="pure-button pure-button-primary">Review</button>
                </div>
            </fieldset>
        </form>
        <a class="popup-close" href="jsp/02_01_clear_form.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="favorite">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/05_favorite.jsp" method="post">
            <fieldset>

                <div class="pure-control-group">
                    <label for="favorite_pid"><span class="red_me_please">*</span> ID of place</label>
                    <input id="favorite_pid" name="favorite_pid" type="text" placeholder="ID" required>

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
        <a class="popup-close" href="say.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="feedback">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/06_feedback.jsp" method="post">
            <fieldset>

                <div class="pure-control-group">
                    <label for="feedback_pid"><span class="red_me_please">*</span> ID of place</label>
                    <input id="feedback_pid" name="feedback_pid" type="text" class="pure-input-1-2" placeholder="ID" required>
                </div>

                <div class="pure-control-group">
                    <label for="score"><span class="red_me_please">*</span>Score</label>
                    <select id="score" name="score">
                        <option>0</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </div>

                <div class="pure-control-group">
                    <label for="feedback_date">Date</label>
                    <input id="feedback_date" name="feedback_date" type="text" placeholder="yyyy-MM-dd" class="pure-input-1-2">
                </div>

                <div class="pure-control-group">
                    <label for="text">Comments</label>
                    <textarea id="text" name="text" class="pure-input-1-2" placeholder="Your comments"></textarea>
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
        <a class="popup-close" href="say.jsp">&times;</a>
    </div>
</div>

<div id="layout" class="pure-g">
    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">Say</h1>
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
            <%--2--%>
            <section class="post">
                <h2 class="post-title">Here I am!</h2>
                <p class="post-meta">
                    Click <a href="#visit">here</a> to share a place you have visited!
                </p>
            </section>
            <%--5--%>
            <section class="post">
                <h2 class="post-title">My favorite place is...</h2>
                <p class="post-meta">
                    Click <a href="#favorite">here</a> to declare a place you like most!
                </p>
            </section>
            <%--6--%>
            <section class="post">
                <h2 class="post-title">I want to say something...</h2>
                <p class="post-meta">
                    Click <a href="#feedback">here</a> to comment on a place!
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