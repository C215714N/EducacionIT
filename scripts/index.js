//#Declaraciones
const d = document;
// Navegacion
const menuBtn = d.querySelector('nav .icon-toggle');
const menuLst = d.querySelector('nav .menu');
// Mapa de Contacto
const mapBtn = d.querySelector('button.map');
const mapBox = d.querySelector('iframe.map');

//#Declaraciones
//#Funciones
function toggle(element, className="active"){
    element.classList.toggle(className)
}

//#Funciones
//#Eventos
menuBtn.onclick = () => toggle(menuLst)
mapBtn.onclick = () => toggle(mapBox)
//#Eventos