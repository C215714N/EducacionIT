// Declaraciones
const tareas = [];
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

botonAgregarTarea.addEventListener("click", function(){
    alert(agregarTarea(textoTarea.value));
    crearLista();
})

crearLista()