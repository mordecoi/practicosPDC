function hacerPing(event) {
    event.preventDefault();

    fetch("ping.jsp")
        .then(function (response) {return response.text();})
        .then(function (html) {
            let contenedor = document.getElementById("resultadoPing");
            contenedor.innerHTML = html;
        })
    .catch(function (error) {
        console.error("Hubo un problema con la petición:", error);
    })
}

function calcularImpacto(event) {
    event.preventDefault();

    // 1. Leer el número que el operador escribió en la caja de texto
    let nivel = document.getElementById('inputSeveridad').value;

    // 2. Disparar el fetch hacia el JSP, pegándole el parámetro en la URL
    fetch(`calculadora.jsp?severidad=${nivel}`)
        .then(function(response) {
            return response.text();
        })
        .then(function(html) {
            // 3. Inyectar el fragmento en pantalla
            document.getElementById('resultadoImpacto').innerHTML = html;
        })
        .catch(function(error) {
            console.error("Hubo un problema con el cálculo:", error);
        });
}

function cargarAlarmas(event) {
    event.preventDefault();

    fetch("alarmas.jsp")
        .then(function (response) {return response.text();})
        .then(function (html) {
            let contenedor = document.getElementById("tablaAlarmas");
            contenedor.innerHTML = html;
        })
        .catch(function (error) {
            console.error("Hubo un problema con la petición:", error);
        })
}