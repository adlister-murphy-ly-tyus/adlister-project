<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.usernameTaken}">
        <h3 style="color: red">Username is taken</h3>
        <% request.getSession().removeAttribute("usernameTaken");%>
    </c:when>


</c:choose>