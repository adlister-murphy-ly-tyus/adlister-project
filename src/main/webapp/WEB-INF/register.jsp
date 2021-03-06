<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container mt-5">
        <h1>Registration</h1>
        <jsp:include page="partials/errorMsg.jsp"/>
        <form action="/register" method="post">
            <div class="form-group">
               <label for="username">Username</label>
               <input id="username" name="username" class="form-control" type="text" required>
            </div>
            <div class="form-group">
              <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input id="phoneNumber" name="phoneNumber" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password" required>
            </div>
            <input type="submit" class="btn btn-success btn-block">
        </form>
    </div>
    <jsp:include page="partials/bootstrap-scripts.jsp"/>
</body>
</html>
