const elementNT = document.getElementById("nuevaTarea");
const elementBA = document.getElementById("botonAgregar");
const elementUL = document.getElementById("listaTareas");

elementBA.addEventListener('click', function (e) {
    e.preventDefault();

    const texto = elementNT.value;

    if (texto == ""){
        return
    }

    const newLI = document.createElement('li');

    newLI.className = "list-group-item d-flex justify-content-between align-items-center";

    newLI.innerHTML = `
        <span class="textoArea">${texto}</span>
            <div>
                <button class="btn btn-info btn-editar">Editar</button>
                <button class="btn btn-warning btn-eliminar">Eliminar</button>
            </div>
    `;

    elementUL.appendChild(newLI);
    elementNT.value = "";

    const btnEliminar = newLI.querySelector('.btn-eliminar');
    const btnEditar = newLI.querySelector('.btn-editar')

    btnEliminar.addEventListener('click', function () {
        newLI.remove();
    })
    btnEditar.addEventListener('click', function () {
        const textoNuevo = prompt("Ingrese el nuevo texto");
        if (textoNuevo !== null && textoNuevo.trim() !== ""){
            const spanTexto = newLI.querySelector('.textoArea');

            spanTexto.textContent = textoNuevo;
        }
    })

})