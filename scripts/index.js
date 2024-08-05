/* Declaraciones */
const 
    d = document,
    navBtn = d.querySelector('#nav button'),
    navMenu = d.querySelector('#nav .menu')
;
/* Funciones */
const toggle = (element, className = "active") => {
    return element.classList.toggle(className)
}
/* Eventos */
navBtn.addEventListener('click', () => toggle(navMenu))