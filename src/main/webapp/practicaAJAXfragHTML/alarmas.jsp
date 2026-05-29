<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="alarma" class="ubp.pdc.pdcpracticos.practicaAJAXfragHTML.AlarmaBean" scope="page" />

<c:forEach var="alarma" items="${alarma.listaAlarmas}">
    <tr>
        <td>${alarma.key}</td>
        <td><span class="badge bg-danger">${alarma.value}</span></td>
    </tr>
</c:forEach>

