// Declaraciones
const tareas = ["html", "css", "js"];
const textoTarea = document.getElementById("textoTarea");
const botonAgregarTarea = document.getElementById("agregarTarea");
const listaTareas = document.getElementById("listaTareas");

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
    for(let t of tareas){
        listaTareas.innerHTML += "<li>"+t+"</li>"
    }
}
function agregarTarea(text){
    if(text.length >= 3){
        tareas.push(text)
        return "la tarea se agrego existosamente"
    }
    else return "debe ingresar como minimo 3 caracteres"
}
function eliminarTarea(index){
    const deleteTask = confirm("¿desea eliminar la tarea seleccionada?\n"+tareas[index]);
    if(deleteTask) tareas.splice(index,1)
}

function editarTarea(index){
    const editedTask = prompt("Escribe el nuevo valor para la tarea\n"+tareas[index])
    if (editedTask) tareas[index] = editedTask
}

botonAgregarTarea.addEventListener("click", function(){
    alert(agregarTarea(textoTarea.value));
    crearLista();
})

crearLista()