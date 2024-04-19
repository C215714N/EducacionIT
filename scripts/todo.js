// Declaraciones
const d = document;
const textoTarea = d.querySelector("#tareas input");
const listaTareas = d.querySelector("#tareas ul");
const agregarTarea = d.querySelector("#tareas button");

const tareas = [];

// Funciones
const crearLista = () => {
    listaTareas.innerHTML = "";
    for(let elemento of tareas){
        listaTareas.innerHTML+=`
        <li>
            ${elemento}
            <button class="btn-edit">Editar</button>
            <button class="btn-delete">Eliminar</button>
        </li>`
    }
    editarTareas();
    eliminarTareas();
}
const editarTareas = () => {
    const buttons = d.querySelectorAll("#tareas .btn-edit");
    console.log(buttons);
}
const eliminarTareas = () => {
    const buttons = d.querySelectorAll("#tareas .btn-delete");
    // Recorremos el Array de Botones y extraemos cada elemento
    buttons.forEach( (btn,i) => 
    // Por cada boton asignamos una accion al evento Click
    btn.addEventListener( 'click', () => {
        const seguro = confirm("¿desea eliminar la tarea?");
        // Eliminamos de Tareas el elemento con el Indice Actual
        if(seguro) tareas.splice(i,1);
        crearLista();
    } ) );
}

// Eventos
textoTarea.addEventListener("keyup", (event) => {
    if (event.keyCode == 13) agregarTarea.click()
})
agregarTarea.addEventListener("click", () => {
    const valor = textoTarea.value;
    if (valor.length > 3){
        tareas.push(valor);
        textoTarea.value = "";
        crearLista();
        textoTarea.focus();
    }
})