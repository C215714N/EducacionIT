//#Declaraciones
const d = document;
const menuBtn = d.querySelector('nav .icon-toggle');
const menuLst = d.querySelector('nav .menu');

//#Declaraciones
//#Funciones
function toggle(element, className="active"){
    element.classList.toggle(className)
}

//#Funciones
//#Eventos
menuBtn.onclick = () => toggle(menuLst)
//#Eventos