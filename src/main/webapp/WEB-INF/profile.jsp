<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

   <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
        <div class="container">
            <h1><c:out value="${sessionScope.user.username}"/> </h1>
           <ul>
                <li><c:out value="${sessionScope.user.email}"/></li>
                <li><c:out value="${sessionScope.user.phoneNumber}"/></li>
            </ul>
            <a href="${pageContext.request.contextPath}/updateUser">Update User Info</a>
        </div>
    <c:forEach var="ad" items="${sessionScope.ads}">
        <div class="col-md-6">
            <h2><c:out value="${ad.title}"/></h2>
            <p><c:out value="${ad.description}"/></p>
            <a href="${pageContext.request.contextPath}/adsPage?id=${ad.id}">Link</a>
            <br>
            <c:if test="${sessionScope.user != null}">
                <a href="${pageContext.request.contextPath}/ads/delete?id=${ad.id}">Delete Ad</a>
               <br>
                <a href="${pageContext.request.contextPath}/ads/update?id=${ad.id}">Update Ad</a>
            </c:if>
        </div>
    </c:forEach>
    <jsp:include page="partials/bootstrap-scripts.jsp"/>
</body>
</html>
