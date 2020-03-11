<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create Category"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Create a new category</h1>
    <form action="${pageContext.request.contextPath}/category/create" method="post">
        <div class="form-group">
            <label for="category">Category Name</label>
            <input id="category" name="category" class="form-control" type="text">
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
<jsp:include page="../partials/bootstrap-scripts.jsp"/>
</body>
</html>