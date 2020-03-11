<%@ page import="com.codeup.adlister.dao.DaoFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
    <link href="https://fonts.googleapis.com/css?family=Pacifico|Roboto&display=swap" rel="stylesheet">

</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<h1>Here Are all the ads!</h1>
<div class="container-fluid d-flex flex-wrap">
    <c:forEach var="ad" items="${ads}">
        <div class="card mx-0" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title"><c:out value="${ad.title}"/></h5>
                <h6 class="card-subtitle mb-2 text-muted"><c:out value="${ad.price}"/></h6>
                <p class="card-text"><c:out value="${ad.description}"/></p>
                <a class="card-link" href="${pageContext.request.contextPath}/adsPage?id=${ad.id}">Link</a>
                <c:if test="${sessionScope.user.username eq 'admin'}">
                    <a class="card-link" href="${pageContext.request.contextPath}/ads/delete?id=${ad.id}">Delete Ad</a>
                </c:if>
            </div>
        </div>
<%--        <div class="col-md-6">--%>
<%--            <h3>Title:</h3>--%>
<%--            <p><c:out value="${ad.title}"/></p>--%>
<%--            <h3>Description:</h3>--%>
<%--            <p><c:out value="${ad.description}"/></p>--%>
<%--            <a href="${pageContext.request.contextPath}/adsPage?id=${ad.id}">Link</a>--%>
<%--            <br>--%>
<%--           <c:if test="${sessionScope.user.username eq 'admin'}">--%>
<%--                <a href="${pageContext.request.contextPath}/ads/delete?id=${ad.id}">Delete Ad</a>--%>
<%--            </c:if>--%>
<%--            <br>--%>
<%--            <br>--%>
<%--        </div>--%>
    </c:forEach>
</div>
<jsp:include page="../partials/bootstrap-scripts.jsp"/>
</body>
</html>
