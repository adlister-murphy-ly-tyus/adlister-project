<%--
  Created by IntelliJ IDEA.
  User: mattmurphy
  Date: 3/10/20
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Profile</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<form action="${pageContext.request.contextPath}/updateUser" method="post">
<div class="form-group">
    <label for="email">Email</label>
    <input id="email" name="email" class="form-control" type="text" required>
</div>
<div class="form-group">
    <label for="phoneNumber">Phone Number</label>
    <input id="phoneNumber" name="phoneNumber" class="form-control" type="text">
</div>
    <input type="submit" class="btn btn-block btn-primary"/>
</form>
</body>
</html>
