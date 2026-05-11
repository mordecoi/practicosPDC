<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Practicos PDC">
    <meta name="author" content="Gomez Geneiro Facundo Nehuén">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Practicos PDC</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <link href="css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="bg-light">

<%-- 2. Llamada al JavaBean (Lo crearemos en el siguiente paso) --%>
<%-- El ID 'explorador' es el que usaremos en los bucles --%>
<jsp:useBean id="explorador" class="ubp.pdc.pdcpracticos.explorador.ExploradorProyectosBean" scope="page" />
<jsp:setProperty name="explorador" property="basePath" value="${pageContext.servletContext.getRealPath('/')}" />

<header class="bg-primary text-white py-5 mb-5 shadow">
    <div class="container">
        <h1 class="display-4 fw-bold">Mis Laboratorios Web</h1>
        <p class="lead">Índice dinámico de trabajos prácticos - Ingeniería Informática</p>
    </div>
</header>

<main class="container">
    <div class="row g-4" id="gridProyectos">

        <%-- 3. Bucle dinámico con JSTL --%>
        <%-- Recorremos la lista 'proyectos' que vive dentro del bean 'explorador' --%>
        <c:forEach var="proy" items="${explorador.proyectos}">
            <div class="col-md-6 col-lg-4">
                <article class="card h-100 card-project border-0 shadow-sm">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title text-primary fw-bold">
                                <%-- Imprimimos el nombre del proyecto con EL --%>
                                ${proy.nombre}
                        </h5>
                        <p class="card-text text-muted small mb-4">
                            Última modificación:
                                <%-- Formateamos la fecha al estilo argentino --%>
                            <fmt:formatDate value="${proy.fechaModificacion}" pattern="dd/MM/yyyy HH:mm" />
                        </p>

                        <div class="mt-auto">
                                <%-- El enlace se construye dinámicamente con la ruta relativa --%>
                            <a href="${proy.rutaRelativa}/index.jsp"
                               class="btn btn-outline-primary w-100 fw-bold"
                               aria-label="Abrir el proyecto ${proy.nombre}">
                                Abrir Proyecto
                            </a>
                        </div>
                    </div>
                </article>
            </div>
        </c:forEach>

        <%-- Mensaje por si no hay proyectos (Uso de c:if) --%>
        <c:if test="${empty explorador.proyectos}">
            <div class="col-12 text-center py-5">
                <p class="text-muted italic">No se encontraron proyectos en la carpeta raíz.</p>
            </div>
        </c:if>

    </div>
</main>

<footer class="text-center py-4 mt-5 border-top text-muted">
    <small>&copy; 2026 - Facundo Nehuén Gomez Geneiro</small>
</footer>
</html>