// Declaraciones
const menuBtn = document.getElementById('menu-icon');
const menuList = document.querySelector('nav .menu');
const mapBtn = document.querySelector('button.map');
const mapFrame = document.querySelector('iframe.map');
// Funciones
function toggle(element, className = "active"){
    return element.classList.toggle(className);
}
// Eventos
menuBtn.onclick = () => toggle(menuList);
mapBtn.onclick = () => toggle(mapFrame);