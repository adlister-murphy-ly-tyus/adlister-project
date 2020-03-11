<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Profile</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit your profile" />
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
<jsp:include page="partials/bootstrap-scripts.jsp"/>
</body>
</html>
