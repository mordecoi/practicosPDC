<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- Traemos el inventario de la sesión --%>
<jsp:useBean id="inventario" class="ar.edu.ubp.pdc.concesionaria.InventarioBean" scope="session"/>

<%-- Intentamos ejecutar las operaciones y atrapamos cualquier error en la variable "error" --%>
<c:catch var="error">
    <c:choose>
        <c:when test="${param.estado == 'BA'}">
            ${inventario.registrarBaja(param.chasis)}
        </c:when>

        <c:when test="${param.estado == 'ENT'}">
            ${inventario.registrarEntrega(param.chasis, param.cuil)}
        </c:when>

        <c:otherwise>
            ${inventario.registrarDominio(param.chasis, param.estado, param.dominio)}
        </c:otherwise>
    </c:choose>
</c:catch>

<%-- Evaluamos si hubo un error para saber cómo redirigir --%>
<c:choose>
    <c:when test="${not empty error}">
        <%-- Si falló, volvemos enviando el mensaje de error --%>
        <jsp:forward page="index.jsp">
            <jsp:param name="mensajeError" value="${error}"/>
        </jsp:forward>
    </c:when>
    <c:otherwise>
        <%-- Si fue exitoso, volvemos normalmente --%>
        <jsp:forward page="index.jsp"/>
    </c:otherwise>
</c:choose>