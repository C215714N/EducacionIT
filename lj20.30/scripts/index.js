/* Declaraciones */
const 
    d = document,
    className = 'active',
    // Navegacion
    menuBtn     = d.querySelector('#nav .btn'),
    menuList    = d.querySelector('#nav .menu'),
    // Mapa de Contacto
    mapBtn      = d.querySelector('#footer button[class*="map-"]'),
    mapFrame    = d.querySelector('#footer iframe.map'),
    // Galeria de imagenes
    slider      = d.querySelectorAll('.slider .item'),
    prev        = d.querySelector('.slider .icon-prev'),
    next        = d.querySelector('.slider .icon-next'),
    controls    = d.querySelectorAll('.slider .controls button')
;

/* Funciones */
// Alternar clases de un elemento y reemplazar clases en otro
function toggle({target, btn, val = []}){
    target.classList.toggle(className) ?
    btn.classList.replace( val[0], val[1] ) :
    btn.classList.replace( val[1], val[0] )
}
// Capturar un elemento dentro de un array
function getItem({array = [], className}){
for (let element of array){
    if (element.classList.contains(className)){
        element.classList.remove(className)
        return element
}   }   }
// Definir una clases a una elemento x
function setItem({array = [], type = "NEXT", className}){
    let item = getItem({array, className});
    item = (
    type == "NEXT" ? 
    (item.nextElementSibling || item.parentNode.firstElementChild) :
    type == "PREV" ? 
    (item.previousElementSibling || item.parentNode.lastElementChild) : 
    array[type]) 
    item.classList.add(className)
}
/* Eventos */
// Navegacion
menuBtn.addEventListener('click', (e) => toggle({
    target: menuList,
    btn: e.target,
    val: ['menu-open', 'menu-close']
} ) )
// Mapa de Contacto
mapBtn.addEventListener('click', (e) => toggle({
    target: mapFrame,
    btn: e.target,
    val: ['map-open','map-close']
} ) )
// Galeria de Imagenes
next.addEventListener('click', () => {
    setItem({array: slider, className })
    setItem({array: controls, className })
} )
prev.addEventListener('click', () => {
    setItem({array: slider, type: "PREV", className })
    setItem({array: controls, type: "PREV", className })
} )
controls.forEach((btn, i) => btn.addEventListener('click', () => {
    setItem({array: slider, type: i, className})
    setItem({array: controls, type: i, className})
} ) )
// Transicion automatica
window.setInterval(() => next.click(), 60000)