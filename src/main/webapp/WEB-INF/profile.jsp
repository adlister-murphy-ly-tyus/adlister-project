<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container-fluid">
    <h1 class="mx-3 my-3">Welcome, <c:out value="${sessionScope.user.username.toUpperCase()}"/>!</h1>
    <div class="card mx-3 my-3" style="width: 24rem;">
        <div class="card-body">
            <h5 class="card-title my-3">Username: <c:out value="${sessionScope.user.username}"/></h5>
            <h5 class="card-title my-3">Email: <c:out value="${sessionScope.user.email}"/></h5>
            <h5 class="card-title my-3">Phone Number: <c:out value="${sessionScope.user.phoneNumber}"/></h5>
            <a href="${pageContext.request.contextPath}/updateUser" class="btn btn-info btn-lg my-3"
               role="button" aria-pressed="true">Update my profile</a>
        </div>
    </div>
</div>

<div class="container-fluid">
    <h1 class="mx-4 mt-5 mb-3">My created ad listings..</h1>
</div>

<div class="container-fluid d-flex flex-wrap overflow-auto">
    <c:forEach var="ad" items="${sessionScope.ads}">
        <div class="card mx-4 my-3" style="width: 24rem;">
            <div class="card-body">
                <h4 class="card-title my-3 font-weight-bold">Title: <c:out value="${ad.title}"/></h4>
                <h5 class="card-subtitle mb-2 text-success my-3 font-italic">Price: <fmt:formatNumber type="currency"
                                                                                                      value="${ad.price}"/></h5>
                <p class="card-text my-3">Description: <c:out value="${ad.description}"/></p>
                <a href="${pageContext.request.contextPath}/adsPage?id=${ad.id}" class="btn btn-success btn-lg my-3"
                   role="button" aria-pressed="true">Ad Page</a>
                <a href="${pageContext.request.contextPath}/ads/update?id=${ad.id}" class="btn btn-info btn-lg my-3"
                   role="button" aria-pressed="true">Update</a>
                <a href="${pageContext.request.contextPath}/ads/delete?id=${ad.id}" class="btn btn-danger btn-lg my-3"
                   role="button" aria-pressed="true">Delete</a>
            </div>
        </div>
    </c:forEach>
</div>

<div class="container-fluid">
    <h1 class="mx-4 mt-5 mb-3">Favorites</h1>
</div>

<div class="container-fluid d-flex flex-wrap overflow-auto">
    <c:forEach var="favorite" items="${sessionScope.favorites}">
        <div class="card mx-4 my-3" style="width: 24rem;">
            <div class="card-body">
                <h4 class="card-title my-3 font-weight-bold">Title: <c:out value="${favorite.title}"/></h4>
                <h5 class="card-subtitle mb-2 text-success my-3 font-italic">Price: <fmt:formatNumber type="currency"
                                                                                                      value="${favorite.price}"/></h5>
                <p class="card-text my-3">Description: <c:out value="${favorite.description}"/></p>
                <a href="${pageContext.request.contextPath}/adsPage?id=${favorite.id}"
                   class="btn btn-success btn-block my-2"
                   role="button" aria-pressed="true">Ad Page</a>
                <form action="${pageContext.request.contextPath}/favorites?id=${favorite.id}" method="post">
                    <button type="submit" class="btn btn-block btn-danger my-2">Remove from Favorites</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="partials/bootstrap-scripts.jsp"/>
</body>
</html>
