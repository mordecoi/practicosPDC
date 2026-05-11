<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Agendador de Eventos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body class="container py-4">

<h2 class="mb-4">Mi agenda</h2>

<div class="card shadow-sm mb-5">
  <div class="card-body">
    <form action="procesar.jsp" method="post" id="formEvento">
      <div class="row g-3">

        <div class="col-md-6">
          <label class="form-label">Fecha</label>
          <input type="date" name="fecha" id="txtFecha" class="form-control" required>
        </div>

        <div class="col-md-6">
          <label class="form-label">Prioridad</label>
          <select name="prioridad" id="selPrioridad" class="form-select">
            <option value="A">Alta</option>
            <option value="M" selected>Media</option>
            <option value="B">Baja</option>
          </select>
        </div>

        <div class="col-md-12">
          <label class="form-label" for="txtDescripcion">Descripcion</label>
          <textarea class="form-control" name="descripcion" id="txtDescripcion" placeholder="Ingrese la descripción del evento" rows="4"></textarea>
        </div>

        <div class="col-md-6">
          <label class="form-label d-block">Notificar</label>

          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="notificar" id="radioSi" value="S">
            <label class="form-check-label" for="radioSi">Sí</label>
          </div>

          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="notificar" id="radioNo" value="N" checked>
            <label class="form-check-label" for="radioNo">No</label>
          </div>
        </div>

        <div class="col-md-6">
          <label class="form-label" for="txtEmail">E-mail a notificar</label>
          <input type="email" name="email" id="txtEmail" class="form-control" placeholder="Ingrese e-mail a notificar" disabled>
        </div>

        <div class="col-12 text-start">
          <button type="submit" class="btn btn-primary px-4">Agendar</button>
          <button type="reset" class="btn btn-warning px-4">Limpiar</button>
        </div>
      </div>
    </form>
  </div>
</div>

<div id="contenedorTabla">
  <jsp:include page="tablaEventos.jsp" />
</div>

<script src="js/agendador.js"></script>
</body>
</html>