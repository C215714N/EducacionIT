/* Variables: Espacio reservado para almacenar distintos valores */
// Menu de Navegacion
var menuButton = document.getElementById('menu-btn');
var menuList = document.getElementById('menu-list');

/* Funciones: Bloques de codigo que se van a reutilizar */
// Funcion alternadora
function toggle(target, className){
    if (target.classList.contains(className)){
        target.classList.remove(className)
    } else {
        target.classList.add(className)
    }
}

/* Eventos: Acciones realizadas por el usuario */
// Boton de Navegacion
menuButton.onclick = function () {
    toggle(menuList, 'active');
}