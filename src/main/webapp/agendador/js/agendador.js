document.addEventListener("DOMContentLoaded", () => {
    const selPrioridad = document.getElementById("selPrioridad");
    const txtDescripcion = document.getElementById("txtDescripcion");
    const radioSi = document.getElementById("radioSi");
    const radioNo = document.getElementById("radioNo");
    const txtEmail = document.getElementById("txtEmail");
    const txtFecha = document.getElementById("txtFecha");

    // 1. Establecer fecha de hoy por defecto
    const hoy = new Date().toISOString().split('T')[0];
    txtFecha.value = hoy;

    // 2. Control de cambios en Prioridad
    selPrioridad.addEventListener("change", () => {
        if (selPrioridad.value === "A") {
            radioSi.disabled = true;
            radioNo.disabled = true;
            radioSi.checked = true;
            txtEmail.disabled = false;    // Habilita e-mail
        } else {
            radioSi.disabled = false;
            radioNo.disabled = false;
            // Al cambiar a Media/Baja, disparamos el control de Notificar
            actualizarEmail();
        }
    });

    // 3. Control de cambios en Notificar
    radioSi.addEventListener("change", actualizarEmail);
    radioNo.addEventListener("change", actualizarEmail);

    function actualizarEmail() {
        if (radioNo.checked) {
            txtEmail.value = "";          // Limpiar valor
            txtEmail.disabled = true;     // Deshabilitar
        } else {
            txtEmail.disabled = false;    // Habilitar
        }
    }

    // 4. Control de cambios en limpiar
    document.getElementById("formEvento").addEventListener("reset", (e) => {
        e.preventDefault();

        txtFecha.value = hoy;
        selPrioridad.value = "M";
        txtDescripcion.value = "";
        radioNo.checked = true;
        txtEmail.value = "";
        txtEmail.disabled = true;
        radioSi.disabled = false;
        radioNo.disabled = false;
    })

    // 4. Validación antes de enviar
    document.getElementById("formEvento").addEventListener("submit", (e) => {
        // Aseguramos que el campo deshabilitado (Notificar en Alta) se envíe
        radioSi.disabled = false;
        radioNo.disabled = false;
        // El navegador ya valida el 'required' de la fecha y el tipo 'email'
        // pero podrías agregar validaciones extra aquí si fuera necesario.
    });

});

function confirmarDescarte(indice) {
    if (confirm("¿Está seguro de que desea descartar este evento?")) {
        // Si acepta, redirigimos al procesador de estado
        window.location.href = "cambiarEstado.jsp?id=" + indice;
    }
}