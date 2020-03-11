<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
       <ul class="nav navbar-nav navbar-right">
           <li>
               <form action="/ad/search" method="POST">
                   <input type="text" id="search" name="search">
                   <button type="submit">Search Ad</button>
               </form>
           </li>
           <c:choose>
               <c:when test="${sessionScope.user != null}">
                   <li><a href="/profile">Profile Page</a></li>
                   <c:if test="${sessionScope.user.username eq 'admin'}">
                      <li><a href="/category/create">Create Category</a></li>
                   </c:if>
                <li><a href="/ads/create">Create Ad</a></li>
                   <li><a href="/logout">Logout</a></li>
               </c:when>
               <c:otherwise>
                   <li><a href="/register">Register with us!</a></li>
                   <li><a href="/login">Login</a></li>
               </c:otherwise>
           </c:choose>
        </ul>
    </div>
</nav>
