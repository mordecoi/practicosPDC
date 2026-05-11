<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 1. Capturamos los datos del formulario en un Bean de alcance 'page' --%>
<jsp:useBean id="nuevoEvento" class="ubp.pdc.pdcpracticos.agendador.EventoBean" scope="page">
  <%-- La magia de property="*" mapea automáticamente los nombres del formulario
       (fecha, prioridad, notificar, email) con los setters del Bean --%>
</jsp:useBean>
<jsp:setProperty name="nuevoEvento" property="*" />

<%-- 2. Localizamos (o creamos) el Administrador en la Sesión --%>
<jsp:useBean id="agendador" class="ubp.pdc.pdcpracticos.agendador.AgendadorBean" scope="session" />

<%-- 3. Agregamos el nuevo evento a la lista del administrador usando JSTL --%>
<c:set target="${agendador}" property="nuevoEvento" value="${nuevoEvento}" />

<%-- 4. Redirigimos internamente a la página principal para mostrar la tabla actualizada --%>
<jsp:forward page="index.jsp" />