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

<div class="popup-wrapper" id="poi_browsing">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/09_poi_browsing.jsp" method="post">
            <fieldset>

                <div class="pure-control-group">
                    <label for="min_price">Min Price</label>
                    <input id="min_price" name="min_price" placeholder="0.0" type="text">
                </div>

                <div class="pure-control-group">
                    <label for="max_price">Max Price</label>
                    <input id="max_price" name="max_price" placeholder="10000.0" type="text">
                </div>

                <div class="pure-control-group">
                    <label for="address">Address</label>
                    <input id="address" name="address" placeholder="Address" type="text">
                </div>

                <div class="pure-control-group">
                    <label for="keyword">Keyword</label>
                    <input id="keyword" name="keyword" placeholder="Keywords" type="text">
                </div>

                <div class="pure-control-group">
                    <label for="Category">Category</label>
                    <input id="Category" name="category" placeholder="Category" type="text">
                </div>


                <div class="pure-control-group">
                    <label for="field"><span class="red_me_please">*</span>Sort by</label>
                    <select id="field" name="field">
                        <option>price</option>
                        <option>average score</option>
                        <option>average trusted score</option>
                    </select>
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <label><span class="red_me_please">Invalid query</span></label>
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
        <a class="popup-close" href="show.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="suggestions" >
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/11_suggestions.jsp" method="post">
            <fieldset>

                <div class="pure-control-group">
                    <label for="visited_site"><span class="red_me_please">*</span>Places like</label>
                    <input id="visited_site" name="visited_site" type="text" placeholder="ID" required>
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <label><span class="red_me_please">Invalid query</span></label>
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
        <a class="popup-close" href="show.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="statistics">
    <div class="popup-container">

        <form class="pure-form pure-form-aligned" action="jsp/13_statistics.jsp" method="post">
            <fieldset>
                <div class="pure-control-group">
                    <label for="top_m"><span class="red_me_please">*</span>Number of places</label>
                    <input id="top_m" name="top_m" placeholder="10" type="text" required>
                </div>

                <div class="pure-control-group">
                    <label for="statistics_category"><span class="red_me_please">*</span>Category</label>
                    <input id="statistics_category" placeholder="Category" name="statistics_category" type="text" required>
                </div>

                <div class="pure-control-group">
                    <label for="type"><span class="red_me_please">*</span>Type</label>
                    <select id="type" name="field">
                        <option>most popular</option>
                        <option>most expensive</option>
                        <option>most highly rated</option>
                    </select>
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <label><span class="red_me_please">Invalid query</span></label>
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
        <a class="popup-close" href="show.jsp">&times;</a>
    </div>
</div>

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
            </nav>
        </div>
    </div>

    <div class="content pure-u-1 pure-u-md-3-4">
        <div class="content_header">
            <h1>Crowd Track</h1>
            <h2>Show me your world</h2>
        </div>
        <div class="posts">
            <%--9--%>
            <section class="post">
                <h2 class="post-title">Show me interesting places!</h2>
                <p class="post-meta">
                    Click <a href="#poi_browsing">here</a> to ask us where to go!
                </p>
            </section>
            <%--11--%>
            <section class="post">
                <h2 class="post-title">Give me traveling suggestions!</h2>
                <p class="post-meta">
                    Click <a href="#suggestions">here</a> to get your suggestions!
                </p>
            </section>
            <%--13--%>
            <section class="post">
                <h2 class="post-title">Statistics are important...</h2>
                <p class="post-meta">
                    Click <a href="#statistics">here</a> to know popular / expensive / highly rated places!
                </p>
            </section>
        </div>
    </div>

</div>


</body>
</html>