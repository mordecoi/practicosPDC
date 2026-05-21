<%--
  Created by IntelliJ IDEA.
  User: Facundo-I
  Date: 5/21/2026
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:useBean id="estadoVehiculo" class="ar.edu.ubp.pdc.concesionaria.EstadosVehiculoBean" scope="session"/>
<%--<jsp:useBean id="vehiculo" class="ar.edu.ubp.pdc.concesionaria.VehiculoBean" scope="page"/>--%>
<jsp:useBean id="inventario" class="ar.edu.ubp.pdc.concesionaria.InventarioBean" scope="session"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inventario de Vehiculos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="container py-4">
    <h2 class="mb-4">Inventario de vehiculos</h2>

    <c:if test="${not empty param.mensajeError}">
        <div class="alert alert-danger mb-3">
                ${param.mensajeError}
        </div>
    </c:if>

    <div class="row bg-primary text-white p-2 fw-bold align-items-center">
        <div class="col-md-3">Vehiculo</div>
        <div class="col-md-2">Estado</div>
        <div class="col-md-2">Dominio</div>
        <div class="col-md-2">Cuil Propietario</div>
        <div class="col-md-3"></div>
    </div>
    <c:forEach var="vehiculo" items="${inventario.listado}">
        <div class="row p-2 fw-bold align-items-center">
            <div class="col-md-3">${vehiculo.marca} ${vehiculo.modelo} (${vehiculo.fabricadoEn}) ${vehiculo.nroChasis}</div>
            <div class="col-md-2">
                <select name="estado" id="estadoVehiculo" class="form-select" onchange="evaluarEstado(this)" disabled>
                    <c:forEach var="estado" items="${estadoVehiculo.listado}">
                        <option value="${estado.key}" ${estado.key == vehiculo.estado ? 'selected' : ''}>${estado.value}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <input type="text" class="form-control" name="dominio" disabled value="${vehiculo.dominio}"/>
            </div>
            <div class="col-md-2">
                <input type="text" class="form-control" name="cuil" disabled value="${vehiculo.cuilPropietario}">
            </div>
            <div class="col-md-3 align-items-start">
                <c:choose>
                    <c:when test="${vehiculo.estado == 'BA'}">
                    <span class="text-danger fw-bold">
                        Baja: <fmt:formatDate value="${vehiculo.fechaBaja}" pattern="dd-MM-yyyy"/>
                    </span>
                    </c:when>

                    <c:when test="${vehiculo.estado == 'ENT'}">
                    <span class="text-success fw-bold">
                        Entrega: <fmt:formatDate value="${vehiculo.fechaEntrega}" pattern="dd-MM-yyyy"/>
                    </span>
                    </c:when>

                    <c:otherwise>
                        <button type="button" class="btn btn-primary btn-sm px-3 btn-editar" onclick="habilitarEdicion(this)">Editar</button>
                        <button type="button" class="btn btn-success btn-sm px-3 d-none btn-guardar" onclick="guardarEdicion(this, '${vehiculo.nroChasis}')">Guardar</button>
                        <button type="button" class="btn btn-warning btn-sm px-3 d-none btn-cancelar" onclick="cancelarEdicion(this)">Cancelar</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:forEach>

    <script src="js/concesionaria.js"></script>
</body>
</html>
