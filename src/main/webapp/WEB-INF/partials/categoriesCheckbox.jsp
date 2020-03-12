<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid d-flex flex-wrap justify-content-around">
    <c:forEach var="category" items="${sessionScope.categories}">
        <div class="mx-2">
            <input type="checkbox" id="${category.name}" name="${category.name}" value="${category.name}"/>
            <label for="${category.name}">${category.name}</label>
        </div>
    </c:forEach>
</div>
