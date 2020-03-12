<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ads.title}"/>
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container-fluid">
    <h1 class="mx-4 mt-5 mb-3 font-weight-bold">Ad Page</h1>
</div>
<div class="container-fluid d-flex flex-wrap overflow-auto">
    <div class="card mx-4 my-3" id="ad-card" style="width: 24rem;">
        <div class="card-body">
            <h4 class="card-title my-3 font-weight-bold">Title: <c:out value="${ads.title}"/></h4>
            <h5 class="card-subtitle mb-2 text-success my-3 font-italic">Price: <fmt:formatNumber type="currency"
                                                                                                  value="${ads.price}"/></h5>
            <p class="card-text my-3">Description: <c:out value="${ads.description}"/></p>
            <p class="card-text my-3 font-weight-bold">Categories :</p>
            <c:forEach var="category" items="${categories}">
                <span style="color: green">[ <c:out value="${category.toUpperCase()}"/> ]</span>
            </c:forEach>
            <c:set var="matched" value="false"/>
            <c:forEach var="favorite" items="${sessionScope.favorites}">
                <c:if test="${(sessionScope.user == null) || (sessionScope.user.id == adCreator.id) || (favorite.id == ads.id)}">
                    <c:set var="matched" value="true"/>
                </c:if>
            </c:forEach>
            <c:if test="${matched == false && sessionScope.user != null}">
                <br>
                <a href="${pageContext.request.contextPath}/favorites?id=${ads.id}" class="btn btn-info btn-lg my-3"
                   role="button" aria-pressed="true">Add to Favorites</a>
            </c:if>
        </div>
    </div>
</div>

<c:choose>
    <c:when test="${sessionScope.user == null}">
        <div class="container-fluid">
            <a class="mx-4 my-3" href="${pageContext.request.contextPath}/login"> Login to get contact Info</a>
        </div>
    </c:when>
    <c:otherwise>
        <div class="container-fluid d-flex flex-wrap overflow-auto">
            <div class="card mx-4 my-3" style="width: 24rem;">
                <div class="card-body">
                    <h5 class="card-title my-3 font-weight-bold">Ad creator contact information:</h5>
                    <h5 class="card-title my-3">Name: <c:out value="${adCreator.username}"/></h5>
                    <h5 class="card-title my-3">Email: <c:out value="${adCreator.email}"/></h5>
                    <h5 class="card-title my-3">Phone Number: <c:out value="${adCreator.phoneNumber}"/></h5>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
<jsp:include page="../partials/bootstrap-scripts.jsp"/>
</body>
</html>
