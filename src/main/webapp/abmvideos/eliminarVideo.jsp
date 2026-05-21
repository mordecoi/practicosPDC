<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 1. Traemos al administrador que ya vive en la sesión --%>
<jsp:useBean id="abmVideos" class="ubp.pdc.pdcpracticos.abmvideos.GestorVideosBean" scope="session" />

<c:set target="${abmVideos}" property="idEliminar" value="${param.id}" />

<%-- 3. Volvemos al index con la lista ya actualizada --%>
<jsp:forward page="index.jsp" />