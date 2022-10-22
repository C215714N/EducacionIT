// Declaraciones
    let className = 'active';
    const d = document,
    // Navegacion
    menuButton = d.querySelector('#nav .btn'),
    menuList = d.querySelector('#nav .menu'),
    // Cabecera
    gallery = d.querySelectorAll('.slide li'),
    prev = d.querySelector('.icon-prev'),
    next = d.querySelector('.icon-next')
    ;

// Menu Hamburguesa
menuButton.addEventListener('click', (e) => toggle({
    tag: menuList,
    trigger: e.target,
    a: 'menu-open',
    b: 'menu-close'
} ) )

// Galeria de Presentacion
prev.addEventListener('click', () => getItem(gallery, 'prev'))
next.addEventListener('click', () => getItem(gallery, 'next'))

// Funciones
// Alternar Clases
function toggle(config){
    config.tag.classList.toggle(className) ?
    config.trigger.classList.replace(config.a,config.b) :
    config.trigger.classList.replace(config.b,config.a)
}
// Buscar Elementos
function getItem(array, type){
    let nextItem;
    for(let item of array){
        if (item.classList.contains(className)){
            item.classList.remove(className);
            if(type === 'next'){
                nextItem = item.nextElementSibling || item.parentNode.firstElementChild
            }
            else if (type === 'prev'){
                nextItem = item.previousElementSibling || item.parentNode.lastElementChild
            }
            else{
                nextItem = item
            }
        }
    }
    nextItem.classList.add(className);
}