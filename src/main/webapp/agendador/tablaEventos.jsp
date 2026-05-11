<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="table-responsive shadow-sm rounded">
  <table class="table table-hover align-middle bg-white">
    <thead class="table-dark">
    <tr>
      <th>#</th>
      <th>Fecha</th>
      <th>Descripcion</th>
      <th>Prioridad</th>
      <th>Notificar a</th>
      <th class="text-center">Acciones</th>
    </tr>
    </thead>
    <tbody>
    <%-- Recorremos la lista del agendador que está en la sesión --%>
    <c:forEach var="e" items="${agendador.lista}" varStatus="status">
      <%-- Definimos una clase CSS dinámica si el evento está descartado --%>
      <tr class="${e.descartado ? 'fila-descartada' : ''}">
        <td>${status.count}</td>
        <td>
          <fmt:parseDate value="${e.fecha}" pattern="yyyy-MM-dd" var="fechaParseada" type="date" />
          <fmt:formatDate value="${fechaParseada}" pattern="dd/MM/yyyy" />
        </td>
        <td>${e.descripcion}</td>
        <td>
          <c:choose>
            <c:when test="${e.prioridad == 'A'}">Alta</c:when>
            <c:when test="${e.prioridad == 'M'}">Media</c:when>
            <c:otherwise>Baja</c:otherwise>
          </c:choose>
        </td>
        <td>${empty e.email ? '' : e.email}</td>
        <td class="text-center">
          <c:choose>
            <c:when test="${e.descartado}">
              <a href="cambiarEstado.jsp?id=${status.index}">
                Recuperar
              </a>
            </c:when>
            <c:otherwise>
              <%-- Llamamos a una función JS para la confirmación --%>
              <a href="javascript:confirmarDescarte(${status.index})">
                Descartar
              </a>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
    </c:forEach>

    <%-- Si la lista está vacía --%>
    <c:if test="${empty agendador.lista}">
      <tr>
        <td colspan="6" class="text-center text-muted py-4">
          No hay eventos registrados actualmente.
        </td>
      </tr>
    </c:if>
    </tbody>
  </table>
</div>