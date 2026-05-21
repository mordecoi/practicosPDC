<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:useBean id="abmVideos" class="ubp.pdc.pdcpracticos.abmvideos.GestorVideosBean" scope="session" />
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agendador de Eventos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="container py-4">
    <h2 class="mb-4">Video</h2>
    <div class="row g-3">
        <div class="col-md-5">
            <form action="procesarVideo.jsp" method="post" id="formVideo">

                <input type="hidden" name="id" value="${empty param.idEditar ? '-1' : param.idEditar}">


                <label class="form-label">Categoria</label>
                <select name="categoria" id="selCategoria" class="form-select">
                    <option value="">Selecciona una categoria</option>
                    <c:forEach var="c" items="${abmVideos.listaCategorias}">
                        <option value="${c.key}" ${not empty param.idEditar and abmVideos.listaVideos[param.idEditar].categoria == c.key ? 'selected' : ''}>${c.value}</option>
                    </c:forEach>
                </select>

                <label for="textTitulo" class="form-label">Titulo</label>
                <input type="text" class="form-control" id="textTitulo" name="titulo"
                       value="${empty param.idEditar ? '' : abmVideos.listaVideos[param.idEditar].titulo}">

                <label for="textAutor" class="form-label">Autor</label>
                <input type="text" class="form-control" id="textAutor" name="autor"
                       value="${empty param.idEditar ? '' : abmVideos.listaVideos[param.idEditar].autor}">

                <label for="textURL" class="form-label">URL</label>
                <input type="text" class="form-control" id="textURL" name="url"
                       value="${empty param.idEditar ? '' : abmVideos.listaVideos[param.idEditar].url}">

                <div class="col-12 text-start">
                    <button type="submit" class="btn btn-primary px-4">Aceptar</button>
                    <a type="reset" class="btn btn-warning px-4" href="index.jsp">Cancelar</a>
                </div>

            </form>
        </div>
        <div class="col-md-7">
            <p><b>Video</b></p>
            <c:forEach var="v" items="${abmVideos.listaVideos}" varStatus="status">
                <div class="row bg-light border p-2 mb-2 align-items-center">
                    <div class="col-md-7">
                        <a href="javascript:abrirVideo('${v.url}', '${v.titulo} - ${v.autor}')">${v.titulo}</a>
                        <span class="d-block text-dark">${v.autor}</span>
                    </div>
                    <div class="col-md-5 text-end">
                        <a type="submit" class="btn btn-primary px-4" href="index.jsp?idEditar=${status.index}">Editar</a>
                        <a type="reset" class="btn btn-success px-4" href="javascript:confirmarEliminacion(${status.index})">Eliminar</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="modal fade" id="modalReproductor" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tituloModal"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-0">
                    <iframe id="iframeVideo" width="100%" height="450" src="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>

    <script src="js/abmVideos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
