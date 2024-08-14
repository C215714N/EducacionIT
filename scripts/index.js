/* Declaraciones */
const 
    d = document,
    navBtn = d.querySelector('#nav button'),
    navMenu = d.querySelector('#nav .menu'),
    mapBtn = d.querySelector('#footer button.map');
    mapFrame = d.querySelector('#footer iframe.map');
;
/* Funciones */
const toggle = (element, className = "active") => {
    return element.classList.toggle(className)
}
/* Eventos */
navBtn.addEventListener('click', () => toggle(navMenu))
mapBtn.addEventListener('click', () => toggle(mapFrame))