function habilitarEdicion(botonEditar) {
    let fila = botonEditar.closest('.row');

    botonEditar.classList.add('d-none');
    fila.querySelector('.btn-guardar').classList.remove('d-none');
    fila.querySelector('.btn-cancelar').classList.remove('d-none')

    let selectEstado = fila.querySelector('select[name="estado"]');
    selectEstado.removeAttribute('disabled');

    evaluarEstado(selectEstado);
}

function evaluarEstado(selectEstado) {
    let fila = selectEstado.closest('.row');
    let estadoActual = selectEstado.value;

    let inputDominio = fila.querySelector('input[name="dominio"]');
    let inputCuil = fila.querySelector('input[name="cuil"]');

    inputDominio.setAttribute('disabled', 'true');
    inputCuil.setAttribute('disabled', 'true');

    switch (estadoActual) {
        case 'DE':
        case 'PE':
            inputDominio.removeAttribute('disabled');
            break;

        case 'ENT':
            inputCuil.removeAttribute('disabled');
            break

        case 'BA':
            break;
    }
}

function cancelarEdicion(botonCancelar) {
    let fila = botonCancelar.closest('.row');

    // 1. Restaurar visibilidad de botones
    botonCancelar.classList.add('d-none');
    fila.querySelector('.btn-guardar').classList.add('d-none');
    fila.querySelector('.btn-editar').classList.remove('d-none');

    // 2. Atrapar los campos
    let selectEstado = fila.querySelector('select[name="estado"]');
    let inputDominio = fila.querySelector('input[name="dominio"]');
    let inputCuil = fila.querySelector('input[name="cuil"]');

    // 3. Restaurar valores originales usando las propiedades "default"
    inputDominio.value = inputDominio.defaultValue;
    inputCuil.value = inputCuil.defaultValue;

    for (let i = 0; i < selectEstado.options.length; i++) {
        if (selectEstado.options[i].defaultSelected) {
            selectEstado.selectedIndex = i;
            break;
        }
    }

    // 4. Volver a bloquear todo
    selectEstado.setAttribute('disabled', 'true');
    inputDominio.setAttribute('disabled', 'true');
    inputCuil.setAttribute('disabled', 'true');
}


function guardarEdicion(botonGuardar, chasis) {
    let fila = botonGuardar.closest('.row');
    let estado = fila.querySelector('select[name="estado"]').value;
    let dominio = fila.querySelector('input[name="dominio"]').value.trim();
    let cuil = fila.querySelector('input[name="cuil"]').value.trim();

    if ((estado === 'DE' || estado === 'PE') && dominio === ''){
        alert("Debes ingresar el Dominio");
        return;
    }

    if (estado === 'ENT' && cuil === '') {
        alert("Debes ingresar el CUIL del propietario");
        return;
    }

    window.location.href = `procesarVehiculo.jsp?chasis=${chasis}&estado=${estado}&dominio=${dominio}&cuil=${cuil}`;
}