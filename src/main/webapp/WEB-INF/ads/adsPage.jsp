<%--
  Created by IntelliJ IDEA.
  User: ptyus
  Date: 3/9/20
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
   </jsp:include>
    <title>Title</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<h1>${ads.title}</h1>
<p>${ads.price}</p>
<p>${ads.description}</p>
<p>${ads.imgUrl}</p>

<c:choose>
    <c:when test="${sessionScope.user == null}">
        <a href="${pageContext.request.contextPath}/login"> Login to get contact Info</a>
    </c:when>
    <c:otherwise>
        <h1><c:out value="${adCreator.username}"/> </h1>
        <ul>
            <li><c:out value="${adCreator.email}"/></li>
            <li><c:out value="${adCreator.phoneNumber}"/></li>
        </ul>
    </c:otherwise>
</c:choose>


</body>
</html>
