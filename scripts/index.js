// Declaraciones
const menuBtn = document.getElementById('menu-icon');
const menuList = document.querySelector('nav .menu');
const mapBtn = document.querySelector('button.map');
const mapFrame = document.querySelector('iframe.map');
const galleries = document.querySelectorAll('.gallery');
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
function getItem(array, className = "active"){
    for(let item of array){
        if(item.classList.contains(className)){
            toggle(item);
            return item;
        }
    }
}
function setItem(array, type){
    let el = getItem(array);
    switch(type){
        case "next":
            el = el.nextElementSibling || el.parentNode.firstElementChild;
        break;
        case "prev":
            el = el.previousElementSibling || el.parentNode.lastElementChild;
        break;
        default:
            el = array[type]
    }
    toggle(el);
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
galleries.forEach( g => {
    const items = g.querySelectorAll(".gallery-item");
    const controls = g.querySelectorAll(".control button");
    const prev = g.querySelector(".control-prev");
    const next = g.querySelector(".control-next");

    next.addEventListener("click", () => {
        setItem(items,"next");
        setItem(controls,"next");
    })
    prev.addEventListener("click", () => {
        setItem(items,"prev");
        setItem(controls,"prev");
    })
    controls.forEach((c,i) => c.addEventListener("click", (e) => {
        setItem(items, i);
        setItem(controls, i);
    }))
})