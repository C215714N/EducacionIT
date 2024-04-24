// Declaraciones
const menuBtn = document.getElementById('menu-icon');
const menuList = document.querySelector('nav .menu');
// Funciones
function toggle(element, className = "active"){
    element.classList.toggle(className);
}
// Eventos
menuBtn.onclick = () => toggle(menuList);