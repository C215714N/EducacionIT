// Importaciones
const d = document;
const menuBtn = d.querySelector('nav .btn');
const menuList = d.querySelector('nav .menu');
const prev = d.querySelector('.control.icon-prev');
const next = d.querySelector('.control.icon-next');
const gallery = d.querySelectorAll('.slide li');

menuBtn.addEventListener('click', (e) => {
    if ( menuList.classList.toggle('active') ) {
        e.target.classList.replace('menu-open', 'menu-close') 
    } else {
        e.target.classList.replace('menu-close', 'menu-open')
    }
})

prev.addEventListener('click', () => getItem('prev'))
next.addEventListener('click', () => getItem('next'))

function getItem(type) {
    let nextElement;
    for(let img of gallery){
        if(img.classList.contains('active')){
            img.classList.remove('active');
            if (type == 'next'){
                nextElement = img.nextElementSibling || img.parentNode.firstElementChild
            }
            else if (type == 'prev'){
                nextElement = img.previousElementSibling || img.parentNode.lastElementChild
            }
        }
    }
    nextElement.classList.add('active')
}
// Autor: Cristian Racedo