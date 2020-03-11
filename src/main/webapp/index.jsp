<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <jsp:include page="/WEB-INF/partials/head.jsp">
       <jsp:param name="title" value="Welcome to Buy it or sell it!" />
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
    <link href="https://fonts.googleapis.com/css?family=Pacifico|Roboto&display=swap" rel="stylesheet">
</head>
<body>

    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="jumbotron jumbotron-fluid">
        <div class="container transparent-black py-2">
            <h1 class="display-4  black-highlight" id="welcome"> Welcome to Sell it! or Buy it!</h1>
            <p class="lead  black-highlight" id="intro">Buy whatever you want or sell whatever you want baby, AND WE MEAN WHATEVER.....!</p>
            <p class = "trant black-highlight">-Trant Batey!</p>
        </div>
    </div>
    <footer class="footer text-center">Copyright 2020 <br> Brought to you by Hung, Matt, and Paris!</footer>


    <jsp:include page="WEB-INF/partials/bootstrap-scripts.jsp"/>
</body>
</html>
