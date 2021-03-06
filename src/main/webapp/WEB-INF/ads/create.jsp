<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container mt-5">
    <h1>Create a new Ad</h1>
    <form action="${pageContext.request.contextPath}/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>
        <div class="form-group">
            <label for="price">Price ($)</label>
            <input id="price" name="price" class="form-control" type="text" required/>
        </div>
        <div class="form-group">
            <label for="image_url">Image</label>
            <input id="image_url" name="image_url" class="form-control" type="text"/>
        </div>
        <jsp:include page="../partials/categoriesCheckbox.jsp"/>
        <input type="submit" class="btn btn-block btn-success">
    </form>
</div>
<jsp:include page="../partials/bootstrap-scripts.jsp"/>
</body>
</html>
