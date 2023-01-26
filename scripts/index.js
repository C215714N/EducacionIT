// Declaraciones
const 
    d = document,
    // Navegacion
    nav = d.getElementById('nav'),
    menuButton = d.querySelector('#nav .btn'),
    menuList = d.querySelector('#nav .menu')
;

// Funciones


// Eventos
d.onclick = (e) => {
    if(
        e.target.tagName === 'BUTTON' ||
        e.target.tagName === 'A' 
    ){
    menuList.classList.toggle('active')
} }

nav.onmouseleave = () => setTimeout( 
    () => menuList.classList.remove('active'), 5000 
)