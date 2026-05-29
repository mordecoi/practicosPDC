<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- Multiplicamos el parámetro que llega por URL y lo guardamos en una variable --%>
<c:set var="multiplicador" value="${param.severidad * 10}" />

<%-- Devolvemos el fragmento HTML puro --%>
<div class="alert alert-warning fw-bold">
    Impacto estimado en la red: ${multiplicador}%
</div>