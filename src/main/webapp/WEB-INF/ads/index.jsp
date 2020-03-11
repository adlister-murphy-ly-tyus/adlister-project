<%@ page import="com.codeup.adlister.dao.DaoFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h3>Title:</h3>
            <p><c:out value="${ad.title}"/></p>
            <h3>Description:</h3>
            <p><c:out value="${ad.description}"/></p>
            <a href="${pageContext.request.contextPath}/adsPage?id=${ad.id}">Link</a>
            <br>
           <c:if test="${sessionScope.user.username eq 'admin'}">
                <a href="${pageContext.request.contextPath}/ads/delete?id=${ad.id}">Delete Ad</a>
            </c:if>
            <br>
            <br>
        </div>
    </c:forEach>
</div>
<jsp:include page="../partials/bootstrap-scripts.jsp"/>
</body>
</html>
