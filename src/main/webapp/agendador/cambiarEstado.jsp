<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- Accedemos al bean de la sesión --%>
<jsp:useBean id="agendador" class="ubp.pdc.pdcpracticos.agendador.AgendadorBean" scope="session" />

<%--
    Invertimos el valor de 'descartado' del elemento específico.
    Usamos el parámetro 'id' que viene en la URL (?id=0, ?id=1, etc.)
--%>
<c:set target="${agendador.lista[param.id]}"
       property="descartado"
       value="${!agendador.lista[param.id].descartado}" />

<%-- Volvemos al index para redibujar la tabla con los nuevos estilos --%>
<jsp:forward page="index.jsp" />