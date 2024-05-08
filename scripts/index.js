// Declaraciones
const menuBtn = document.getElementById('menu-icon');
const menuList = document.querySelector('nav .menu');
const mapBtn = document.querySelector('button.map');
const mapFrame = document.querySelector('iframe.map');
// Funciones
function toggle(element, className = "active"){
    return element.classList.toggle(className);
}
function swap(element,[a,b]){
    element.classList.replace(a,b);
}
function alt({target, button, list:[a,b]}){
    if (toggle(target)) swap(button,[a,b])
    else swap(button,[b,a])
}
// Eventos
menuBtn.onclick = () => alt({
    target: menuList,
    button: menuBtn,
    list: ["icon-menu","icon-close"],
});
mapBtn.onclick = (e) => alt({
    target: mapFrame,
    button: e.target,
    list: ["icon-max", "icon-min"],
});