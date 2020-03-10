<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <c:forEach var="category" items="${sessionScope.categories}">
        <div>
            <input type="checkbox" id="${category.name}" name="${category.name}" value="${category.name}"/>
            <label for="${category.name}">${category.name}</label>
        </div>
    </c:forEach>
</div>
