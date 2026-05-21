function confirmarEliminacion(id) {
    if (confirm("Estas seguro que quieres elminiar este video?"))
        window.location.href = "eliminarVideo.jsp?id=" + id;
}

function abrirVideo(url, tituloCompleto) {
    // 1. Truco para convertir URLs normales de YouTube a URLs de iframe (embed)
    let urlFinal = url;
    if (url.includes("watch?v=")) {
        urlFinal = url.replace("watch?v=", "embed/");
    }

    // 2. Inyectamos los datos en el HTML de la Modal
    document.getElementById("tituloModal").innerText = tituloCompleto;
    document.getElementById("iframeVideo").src = urlFinal;

    // 3. Le decimos a Bootstrap que muestre la ventana
    let modal = new bootstrap.Modal(document.getElementById('modalReproductor'));
    modal.show();
}

// 4. Extra: Cuando el usuario cierre la modal, vaciamos el iframe para que el video no siga sonando de fondo
document.getElementById('modalReproductor').addEventListener('hidden.bs.modal', function () {
    document.getElementById("iframeVideo").src = "";
});