// Declaraciones
const d = document;
const textoTarea = d.querySelector("#tareas input");
const listaTareas = d.querySelector("#tareas ul");
const agregarTarea = d.querySelector("#tareas button");

const tareas = [];

// Funciones

// Eventos
textoTarea.addEventListener("keyup", (event) => {
    if (event.keyCode == 13) agregarTarea.click()
})
agregarTarea.addEventListener("click", () => {
    const valor = textoTarea.value;
    if (valor.length > 3){
        tareas.push(valor);
        textoTarea.value = "";
        listaTareas.innerHTML = "";
        for(let elemento of tareas){
            listaTareas.innerHTML+=`
                <li>
                    ${elemento}
                    <button class="btn-edit">Editar</button>
                    <button class="btn-delete">Eliminar</button>
                </li>`
        }
        textoTarea.focus();
    }
})