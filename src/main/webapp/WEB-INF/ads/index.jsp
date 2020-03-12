<%@ page import="com.codeup.adlister.dao.DaoFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container-fluid">
    <h1 class="mx-4 mt-5 mb-3 font-weight-bold">Ad Listings</h1>
</div>
<div class="container-fluid d-flex flex-wrap">
    <c:forEach var="ad" items="${ads}">
        <div class="card mx-4 my-3" style="width: 24rem;">
            <div class="card-body">
                <h4 class="card-title my-3 font-weight-bold">Title: <c:out value="${ad.title}"/></h4>
                <h5 class="card-subtitle mb-2 text-success my-3 font-italic">Price: <fmt:formatNumber type="currency"
                                                                                                      value="${ad.price}"/></h5>
                <p class="card-text my-3">Description: <c:out value="${ad.description}"/></p>
                <a href="${pageContext.request.contextPath}/adsPage?id=${ad.id}" class="btn btn-success btn-lg my-3"
                   role="button" aria-pressed="true">Ad Page</a>
                <c:if test="${sessionScope.user.username eq 'admin'}">
                    <a href="${pageContext.request.contextPath}/ads/update?id=${ad.id}"
                       class="btn btn-info btn-lg my-3" role="button" aria-pressed="true">Edit</a>
                    <a href="${pageContext.request.contextPath}/ads/delete?id=${ad.id}"
                       class="btn btn-danger btn-lg my-3" role="button" aria-pressed="true">Delete</a>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>
<jsp:include page="../partials/bootstrap-scripts.jsp"/>
</body>
</html>
