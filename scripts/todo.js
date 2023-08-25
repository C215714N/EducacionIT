const 
    d = document,
    tareas = [
        'aprender HTML en 2 simples pasos',
        'dominar CSS y no morir en el intento',
        'Crear Hojas de estilos increiblemente largas con SASS',
        'Aprender Javascript y no dormirme en el intento',
        'Morfosis amigos'
    ],
    div = d.querySelector('.container'),
    todoInput = d.getElementById('todoInput'),
    todoList = d.getElementById('todoList'),
    addButton = d.getElementById('addButton'),
    delFirstButton = d.createElement('button'),
    delLastButton = d.createElement('button');
/* Metodos de Array
    array.push('elemento') -> agrega un elemento al final del array
    array.unshift('elemento') -> agrega un elemento al inicio del array
    array.pop() -> elimina el ultimo elemento del array
    array.shift() -> elimina el primer elemento del array
    array.slice(start, end) -> devuelve un nuevo array con los elementos seleccionados
    array.splice(indice, cantidad) -> modifica el array original, extrayendo elementos y/o agregando nuevos elementos
*/

delFirstButton.innerText= 'Eliminar Primero';
delLastButton.innerText= 'Eliminar Ultimo';

delFirstButton.setAttribute('class','btn btn-warning');
delLastButton.setAttribute('class','btn btn-danger');

div.append(delFirstButton, delLastButton);

// Funciones y Eventos
addButton.onclick = function () {
    if (todoInput.value.length >= 4){
        tareas.unshift(todoInput.value);
        printList(tareas);
        todoInput.value = ''
    }
}
delFirstButton.onclick = function() {
    tareas.shift();
    printList(tareas);
}
delLastButton.onclick = function() {
    tareas.pop();
    printList(tareas);
}
// Carga la lista dentro de UL
function printList(array){
    todoList.innerHTML = '';
    for(let item of array){
        todoList.innerHTML += '<li class="list-group-item">' + item + '</li>'
    }
}

printList(tareas);
