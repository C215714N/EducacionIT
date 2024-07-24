{
// Declaraciones
const tareas = ["html", "css", "js"];
const textoTarea = document.getElementById("textoTarea");
const botonAgregarTarea = document.getElementById("agregarTarea");
const listaTareas = document.getElementById("listaTareas");
let editTask = false;
let selected = null;
/**
 * Metodos de ARRAY
 * AGREGAR ELEMENTOS
 * array.push("elemento") | agregar un elemento al final del array |
 * array.unshift("elemento") | agregar un elemento al principio de un array |
 * 
 * ELIMINAR ELEMENTOS
 * array.pop() | elimina el ultimo elemento de un array
 * array.shift() | elimina el primer elemento de un array |
 * 
 * INTERVENCION
 * array.slice(ini,fin)    | corta los elementos de u array
 * array.splice(ini,n) | corta n cantidad de elementos de un array
 */
// Funciones Nombradas
function crearLista(){
    listaTareas.innerHTML='';
    for(let i = 0; i < tareas.length; i++){
        listaTareas.innerHTML += `
        <li class="flex center">
            <span class="tarea">${tareas[i]}</span>
            <button class="btn btn-primary"
                onclick="elegirTarea(${i})">
                Editar
            </button>
            <button class="btn btn-danger" 
                onclick="eliminarTarea(${i})">
                Eliminar
            </button>
        </li>`
    }
}
function agregarTarea(text){
    if(text.length >= 3){
        tareas.push(text)
        textoTarea.value = '';
        crearLista()
    }
    else return "debe ingresar como minimo 3 caracteres"
}
function eliminarTarea(index){
    const deleteTask = confirm("¿desea eliminar la tarea seleccionada?\n"+tareas[index]);
    if(deleteTask) tareas.splice(index,1)
    crearLista()
}
function editarTarea(index){
    tareas[index] = textoTarea.value
    editTask = false;
    selected = null;
    textoTarea.value = ""
    crearLista();
}
function elegirTarea(index){
    const listaTareas = document.querySelectorAll("span.tarea");
    listaTareas[index].classList.toggle("selected")
    for (let i = 0; i < listaTareas.length; i++){
        if (i!=index) listaTareas[i].classList.remove("selected")
        else listaTareas[i].classList.add("selected")
    }
    editTask = true;
    selected = index;
    textoTarea.value = tareas[index];
}
// Accion confirmar agregar o editar
botonAgregarTarea.addEventListener("click", function(){
    if (editTask) editarTarea(selected)
    else agregarTarea(textoTarea.value)
})
textoTarea.onkeyup = function(event){
    if(event.key == "Enter") botonAgregarTarea.click()
}
crearLista()
}