const btnIniciar = document.getElementById("botonIniciar");
const btnDetener = document.getElementById("botonDetener");
const textoSegundos = document.getElementById("textoSegundos");

let contador = 0;
let cronometro;

function sumar() {
    contador++;
    textoSegundos.textContent = contador;
}

btnIniciar.addEventListener('click', function () {
    clearInterval(cronometro);
    cronometro = setInterval(sumar, 1000)
})

btnDetener.addEventListener('click', function () {
    clearInterval(cronometro);
})