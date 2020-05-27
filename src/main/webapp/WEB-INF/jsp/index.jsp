<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="en">
<head>
    <title>Spring security</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/favicons/favicon.ico">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/jumbotron.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Spring security</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right">
                <div class="form-group">
                </div>
                <div class="form-group">
                </div>
                <sec:authorize access="!isAuthenticated()">
                    <button type="button" class="btn btn-link">Forgot password?</button>
                    <button class="btn btn-success" onclick="location.href='/login'" type="button">Sign in</button>
                    <button class="btn btn-default" onclick="location.href='/registration'" type="button">Register
                    </button>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <button class="btn btn-success" onclick="location.href='/logout'" type="button">Sign out</button>
                </sec:authorize>
            </form>
        </div>
    </div>
</nav>
<div class="jumbotron">
    <div class="container">
        <h1 id="hello">
            Hello, ${empty pageContext.request.userPrincipal? "guest": pageContext.request.userPrincipal.name}!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a
            jumbotron and three supporting pieces of content. Use it as a starting point to create something more
            unique.</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a>
            <a id="subscribe" class="btn btn-danger btn-lg" href="#" role="button">Subscribe</a></p>
        <div style="text-align: right">
            <a href="/news" class="button large hpbottom">Test: another page for logged users with USER rights</a>
        </div>
        <div style="text-align: right">
            <a href="/admin" class="button large hpbottom">Test: another page for logged users with ADMIN rights</a>
        </div>
        <button onclick="location.href='/news'" type="button" class="btn btn-link">Test: another page for logged users
            with USER rights
        </button>
        <button onclick="location.href='/admin'" type="button" class="btn btn-link">Test: another page for logged users
            with ADMIN rights
        </button>
    </div>
</div>
<div class="container">
    <div id="articles" class="row">
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a>
                <button id="download1"><img src="${contextPath}/resources/favicons/download.svg" alt="download"
                                            width="27" height="27"
                                            style="vertical-align: middle"></button>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a>
                <button id="download2"><img src="${contextPath}/resources/favicons/download.svg" alt="download"
                                            width="27" height="27"
                                            style="vertical-align: middle"></button>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
                porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut
                fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a>
                <button id="download3"><img src="${contextPath}/resources/favicons/download.svg" alt="download"
                                            width="27" height="27"
                                            style="vertical-align: middle"></button>
            </p>
        </div>
    </div>
    <div id="adminPanel" class="bd-example">
        <h2>Admin panel</h2>
        <table class="table table-dark">
            <thead>
            <tr class="bg-primary">
                <th scope="col">ID</th>
                <th scope="col">UserName</th>
                <th scope="col">Password</th>
                <th scope="col">Roles</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allUsers}" var="user">
                <tr class="bg-success">
                    <th scope="row">${user.id}</th>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>
                        <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}" method="post">
                            <input type="hidden" name="userId" value="${user.id}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <hr>
    <footer>
        <p>&copy; 2020 Company, Inc.</p>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script>
    if (${not empty pageContext.request.userPrincipal}) {
        $("#name").show();
        if (${pageContext.request.isUserInRole('ADMIN')}) {
            $("#admin").show();
            $("#subscribe").hide();
            $("#download1").hide();
            $("#download2").hide();
            $("#download3").hide();
            $("#articles").hide();
            $("#adminPanel").show();
        }
        if (${!pageContext.request.isUserInRole('ADMIN')})
            $("#admin").hide();
            $("#subscribe").show();
            $("#download1").show();
            $("#download2").show();
            $("#download3").show();
            $("#articles").show();
            $("#adminPanel").hide();
    } else {
            $("#name").hide();
            $("#admin").hide();
            $("#subscribe").hide();
            $("#download1").hide();
            $("#download2").hide();
            $("#download3").hide();
            $("#articles").show();
            $("#adminPanel").hide();
    }
</script>
</body>
</html>
