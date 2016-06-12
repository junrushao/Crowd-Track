<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CrowdTrack :: Index</title>

    <link rel="stylesheet" href="css/popup.css">
    <link rel="stylesheet" href="css/pure-min.css">
    <link rel="stylesheet" href="css/grids-responsive-min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link rel="stylesheet" href="css/marketing.css">

    <style scoped>
        .button-signup {
            background: rgb(28, 184, 65);
            border-radius: 4px;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
            color: rgb(255, 255, 255);
        }

        .button-signin {
            background: rgb(255, 255, 255);
            border-radius: 4px;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
            color: rgb(0, 0, 0);
        }

    </style>
</head>
<body>

<script src="js/sha1.js"></script>
<script>
    function deal_with_login_password(s) {
        s.login_password.value = hex_sha1(s.login_password.value);
    }
    function deal_with_register_password(s) {
        s.register_password.value = hex_sha1(s.register_password.value);
    }
</script>
<div class="popup-wrapper" id="signin">
    <div class="popup-container">
        <form class="pure-form" action="jsp/login.jsp" method="post" onsubmit="deal_with_login_password(this)">
            <fieldset>
                <div class="pure-control-group">
                    <label for="login_username"><span class="red_me_please">*</span>Username</label>
                    <input id="login_username" name="login_username" type="text" placeholder="Username" required>
                </div>

                <div class="pure-control-group">
                    <label for="login_password"><span class="red_me_please">*</span>Password</label>
                    <input id="login_password" name="login_password" type="password" placeholder="Password" required>
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <label><span class="red_me_please">Login failed</span></label>
                </div>
                <%
                    }
                %>

                <div class="pure-control-group">
                    <button type="submit" class="pure-button pure-button-primary">Login</button>
                </div>
            </fieldset>
        </form>
        <a class="popup-close" href="index.jsp">&times;</a>
    </div>
</div>

<div class="popup-wrapper" id="signup">
    <div class="popup-container">
        <form class="pure-form" action="jsp/register.jsp" method="post" onsubmit="deal_with_register_password(this)">
            <fieldset>
                <div class="pure-control-group">
                    <label for="register_username"><span class="red_me_please">*</span> Username</label>
                    <input id="register_username" name="register_username" type="text" placeholder="Username" required>
                </div>

                <div class="pure-control-group">
                    <label for="register_password"><span class="red_me_please">*</span> Password</label>
                    <input id="register_password" name="register_password" type="password" placeholder="Password"
                           required>
                </div>

                <div class="pure-control-group">
                    <label for="name">Your name</label>
                    <input id="name" type="text" name="name" placeholder="Your name">
                </div>

                <div class="pure-control-group">
                    <label for="address">Your address</label>
                    <input id="address" type="text" name="address" placeholder="Your address">
                </div>

                <div class="pure-control-group">
                    <label for="phone">Your phone number</label>
                    <input id="phone" type="text" name="phone" placeholder="Your phone number">
                </div>

                <%
                    if (request.getParameter("fail") != null) {
                %>
                <div class="pure-control-group">
                    <label><span class="red_me_please">Registration failed</span></label>
                </div>
                <%
                    }
                %>

                <div class="pure-control-group">
                    <button type="submit" class="pure-button pure-button-primary">Register</button>
                </div>
            </fieldset>
        </form>
        <a class="popup-close" href="index.jsp">&times;</a>
    </div>
</div>

<div class="header">
    <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
        <a class="pure-menu-heading" href="">CrowdTrack :: Index</a>

        <ul class="pure-menu-list">
            <%
                if (session.getAttribute("username") == null) {
            %>
            <a href="#signin">
                <button class="pure-button button-signin" type="button">Sign in</button>
            </a>
            &nbsp
            <a href="#signup">
                <button class="pure-button button-signup" type="button">Sign up</button>
            </a>
            <%
            } else {
            %>
            <li class="pure-menu-item"><a href="home.jsp" class="pure-menu-link"><%
                out.println(session.getAttribute("username"));%></a></li>
            <li class="pure-menu-item"><a href="jsp/logout.jsp" class="pure-menu-link">Logout</a></li>
            <%
                }
            %>
        </ul>
    </div>
</div>

<div class="splash-container">
    <div class="splash">
        <h1 class="splash-head">Crowd Track</h1>
        <p class="splash-subhead">
            Share with the world every single exciting moment in your trip
        </p>
        <p>
            <a href="<% if (session.getAttribute("username") != null) out.print("home.jsp"); else out.print("#signup"); %>"
               class="pure-button pure-button-primary">
                <%
                    if (session.getAttribute("username") != null)
                        out.print("Go!");
                    else
                        out.print("Sign up");
                %>
            </a>
        </p>
    </div>
</div>

<div class="content-wrapper">
    <div class="content">
        <h2 class="content-head is-center">Everywhere You Go</h2>

        <div class="pure-g">
            <div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">

                <h3 class="content-subhead">
                    <i class="fa fa-rocket"></i>
                    Reliable Travel Plan Assistant
                </h3>
                <p>
                    With our most rock-solid database and most accurate algorithm, we are confident to know what you want.
                </p>
            </div>
            <div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
                <h3 class="content-subhead">
                    <i class="fa fa-mobile"></i>
                    Great Place to Record Your Trip
                </h3>
                <p>
                    Our most experienced team will help you honestly record every piece of your feeling.
                </p>
            </div>
            <div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
                <h3 class="content-subhead">
                    <i class="fa fa-th-large"></i>
                    Make Friends All Over The World
                </h3>
                <p>
                    We aim to gather people all over the world, know each other, share with each other.
                </p>
            </div>
            <div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
                <h3 class="content-subhead">
                    <i class="fa fa-check-square-o"></i>
                    Keep Up-to-date Every Moment
                </h3>
                <p>
                    Powered by our robust database, our team are willing to serve you any time and any where.
                </p>
            </div>
        </div>
    </div>

    <div class="ribbon l-box-lrg pure-g">
        <div class="l-box-lrg is-center pure-u-1 pure-u-md-1-2 pure-u-lg-2-5">
            <img class="pure-img-responsive" src="img/acm.png">
        </div>
        <div class="pure-u-1 pure-u-md-1-2 pure-u-lg-3-5">

            <h2 class="content-head content-head-ribbon">Show, Say and Share</h2>

            <p>
                We are open to show you most exciting places to go.
            </p>
            <p>
                We are open to listen to your comments.
            </p>
            <p>
                We are open to encourage people to share feelings from all over the world.
            </p>
        </div>
    </div>

    <div class="content">
        <h2 class="content-head is-center">Why not Join us!</h2>

        <div class="pure-g">
            <div class="l-box-lrg pure-u-1 pure-u-md-1-3">
                <h4>Contact Us</h4>
                <p>
                    We are undergraduate students from ACM Honored Class, Shanghai Jiao Tong University. Please contact us via email.
                </p>
            </div>
            <div class="l-box-lrg pure-u-1 pure-u-md-1-3">
                <h4>Working Opportunities</h4>
                <p>
                    We are always open to ambitious colleagues to change the world. Please feel free to contact us!
                </p>
            </div>
            <div class="l-box-lrg pure-u-1 pure-u-md-1-3">
                <h4>More Information</h4>
                <p>
                    Please refer to the <a href="http://www.cs.utah.edu/~lifeifei/acmdb/">course website</a> for
                    information.
                </p>
            </div>

        </div>

    </div>

    <div class="footer l-box is-center">
        Made with love by
            <a href="mailto:yz_sjr@sjtu.edu.cn?Subject=Hello">
                Junru Shao
            </a>
        and
        <a href="mailto:jungyhuk@sjtu.edu.cn?Subject=Hello">
            Xinyun Chen
        </a>
    </div>

</div>


</body>
</html>
