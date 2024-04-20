// Declaraciones
const d = document;
const textoTarea = d.querySelector("#app-tareas input");
const listaTareas = d.querySelector("#app-tareas ul");
const agregarTarea = d.querySelector("#app-tareas button");

const tareas = []; // tareas[0], tareas["1"]
const current = { index: null, edit: false}; // current["index"], current.edit

// Funciones
const crearLista = () => {
    listaTareas.innerHTML = "";
    for(let elemento of tareas){
        listaTareas.innerHTML+=`
        <li class="flex-row justify-between p-2">
            <span>
                <input type="checkbox" ${elemento.estado ? "checked": ""}>
                ${elemento.contenido ?? elemento}
            </span>
            <div>
            <button class="btn-edit">Editar</button>
            <button class="btn-delete">Eliminar</button>
            <div>
        </li>`
    }
    editarTareas();
    eliminarTareas();
}
const editarTareas = () => {
    const buttons = d.querySelectorAll("#app-tareas .btn-edit");
    buttons.forEach( (btn, i)  => 
    btn.addEventListener( 'click', () => {
        current.edit = true;
        current["index"] = i;
        textoTarea.value = tareas[i].contenido ?? tareas[i];
    } ) )
}
const eliminarTareas = () => {
    const buttons = d.querySelectorAll("#app-tareas .btn-delete");
    // Recorremos el Array de Botones y extraemos cada elemento
    buttons.forEach( (btn,i) => 
    // Por cada boton asignamos una accion al evento Click
    btn.addEventListener( 'click', () => {
        const seguro = confirm("¿desea eliminar la tarea?");
        // Eliminamos de Tareas el elemento con el Indice Actual
        if(seguro) tareas.splice(i,1);
        crearLista();
        current.edit = false;
    } ) );
}
const validarTarea = () => {
    const valor = textoTarea.value;
    if (current.edit){
        tareas[current.index] = valor;
        current.edit = false;
    }
    else tareas.push({contenido: valor, estado: false});
    textoTarea.value = "";
    textoTarea.focus();
}
const verificarTarea = () => {
    const checkbuttons = d.querySelectorAll('#app-tareas input[type="checkbox"]')
    checkbuttons.forEach( (chk, i) => 
    chk.addEventListener( "input", () => {
        tareas[i].estado = chk.checked;
        console.log(tareas[i]);
    } ) )

    const spans = d.querySelectorAll("#app-tareas li span");
    spans.forEach((item,i) => 
        item.addEventListener("click", () =>{
            item.classList.toggle("check");
        })
    )
}
// Eventos
d.addEventListener('DOMContentLoaded', () => crearLista());
textoTarea.addEventListener("keyup", (event) => {
    if (event.keyCode == 13) agregarTarea.click()
})
agregarTarea.addEventListener("click", () => {
    if (textoTarea.value.length > 3){
        validarTarea();
        crearLista();
    }
})