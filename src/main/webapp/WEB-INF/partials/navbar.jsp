<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" style="font-family: 'Pacifico', cursive;" href="${pageContext.request.contextPath}/ads">Sell it! or Buy it!</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <li class="nav-item"><a class="nav-link" href="/profile">Profile Page</a></li>
                    <c:if test="${sessionScope.user.username eq 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="/category/create">Create Category</a></li>
                    </c:if>
                    <li class="nav-item"><a class="nav-link" href="/ads/create">Create Ad</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item"><a class="nav-link" href="/register">Register with us!</a></li>
                    <li class="nav-item"><a class="nav-link" href="/login">Log In</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
        <form action="/ad/search" class="form-inline my-2 my-lg-0" method="post">
            <input id="search" name= "search" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search Ad</button>
        </form>
    </div>

</nav>


