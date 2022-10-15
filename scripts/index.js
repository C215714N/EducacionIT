// Importaciones
const d = document;
const menuBtn = d.querySelector('nav .btn');
const menuList = d.querySelector('nav .menu');

menuBtn.addEventListener('click', (e) => {
    if ( menuList.classList.toggle('active') ) {
        e.target.classList.replace('menu-open', 'menu-close') 
    } else {
        e.target.classList.replace('menu-close', 'menu-open')
    }
})

// Autor: Cristian Racedo