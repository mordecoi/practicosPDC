<%--
  Created by IntelliJ IDEA.
  User: fgome
  Date: 5/29/2026
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>practicaAJAXfragHTML</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container">
  <a class="btn btn-primary btn-lg" href="#" onclick="hacerPing(event)">Verificar estado del CORE</a>
  <div id="resultadoPing" class="mt-3"></div>

  <hr class="my-5">
  <h3>Calculadora de Impacto</h3>
  <div class="input-group mb-3 w-50">
    <span class="input-group-text">Nivel de Severidad (1-5)</span>
    <input type="number" id="inputSeveridad" class="form-control" min="1" max="5" value="1">
    <button class="btn btn-warning" onclick="calcularImpacto(event)">Calcular</button>
  </div>
  <div id="resultadoImpacto"></div>

  <button class="btn btn-warning" onclick="cargarAlarmas(event)">Cargar alarmas</button>

  <table class="table table-dark table-striped">
    <thead>
      <tr>
        <th>Sistema / Servidor</th>
        <th>Estado de alerta</th>
      </tr>
    </thead>

    <tbody id="tablaAlarmas"></tbody>
  </table>

  <script src="script.js"></script>
</body>
</html>
