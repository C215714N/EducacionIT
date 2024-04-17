// Declaraciones
const d = document;
const textoTarea = d.querySelector("#tareas input");
const listaTareas = d.querySelector("#tareas ul");
const agregarTarea = d.querySelector("#tareas button");

const tareas = [];

// Funciones

// Eventos
agregarTarea.addEventListener("click", () => {
    const valor = textoTarea.value;
    if (valor.length > 3){
        tareas.push(valor);
        textoTarea.value = "";
        listaTareas.innerHTML = "";
        for(let elemento of tareas){
            listaTareas.innerHTML+=`<li>${elemento}</li>`
        }
        textoTarea.focus();
    }
})