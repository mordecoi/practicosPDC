const nuevoArticulo = document.getElementById("nuevoArticulo");
const botonAgregar = document.getElementById("botonAgregar");
const listaArticulos = document.getElementById("listaArticulos");

let listaLocal;
if (localStorage.getItem("listaArticulosLS") == null) {
    listaLocal = [];
}
else {
    listaLocal = JSON.parse(localStorage.getItem("listaArticulosLS"));

    for (const articulo of listaLocal) {
        createLI(articulo);
    }
}

function createLI(texto) {
    const newLI = document.createElement('li');
    newLI.className = "list-group-item d-flex justify-content-between align-items-center";

    newLI.innerHTML = `
        <span class="textoArea">${texto}</span>
            <div>
                <button class="btn btn-warning btn-eliminar" aria-label="Eliminar articulo de la lista">Eliminar</button>
            </div>
    `;

    listaArticulos.appendChild(newLI);
    nuevoArticulo.value = "";

    const btnEliminar = newLI.querySelector('.btn-eliminar');

    btnEliminar.addEventListener('click', function () {
        newLI.remove();

        let indice = listaLocal.indexOf(texto);
        listaLocal.splice(indice, 1);
        localStorage.setItem("listaArticulosLS", JSON.stringify(listaLocal))
    })
}

botonAgregar.addEventListener('click', function (e){
    e.preventDefault();

    const texto = nuevoArticulo.value;

    if (texto == ""){
        return
    }

    createLI(texto);
    listaLocal.push(texto);
    localStorage.setItem("listaArticulosLS", JSON.stringify(listaLocal))
})