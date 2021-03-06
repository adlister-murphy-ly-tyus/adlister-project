<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Updating the Ads" />
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container mt-5">
    <h1>Update Ad</h1>

    <form action="${pageContext.request.contextPath}/ads/update?id=${ad.id}" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${ad.title}"/>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" type="text" value="${ad.description}"/>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" type="text" value="${ad.price}"/>
        </div>
        <div class="form-group">
            <label for="imgUrl">Image</label>
            <input id="imgUrl" name="imgUrl" class="form-control" type="text"${ad.imgUrl}/>
        </div>
        <input type="submit" class="btn btn-block btn-success"/>
    </form>
</div>
<jsp:include page="../partials/bootstrap-scripts.jsp"/>
</body>
</html>
