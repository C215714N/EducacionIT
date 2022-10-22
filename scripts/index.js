// Declaraciones
    let className = 'active';
    const d = document,
    // Navegacion
    menuButton = d.querySelector('#nav .btn'),
    menuList = d.querySelector('#nav .menu'),
    // Cabecera
    h1 = d.querySelector('h1'),
    gallery = d.querySelectorAll('.slide li'),
    indicators = d.querySelectorAll('.indicators button'),
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
h1.addEventListener('click', autoMove )
prev.addEventListener('click', () => {
    getItem(gallery, 'prev');
    getItem(indicators, 'prev')
} )
next.addEventListener('click', () => {
    getItem(gallery, 'next');
    getItem(indicators, 'next')
} )
indicators.forEach( (btn, i) => { 
    btn.addEventListener('click', () => {
        getItem(gallery, i),
        getItem(indicators, i)
    } )
} )

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
                nextItem = array[type]
            }
        }
    }
    nextItem.classList.add(className);
}
// Consultar Tiempo de Galeria
function autoMove(){
    if ( window.confirm('¿desea que las imagenes se muevan automaticamente?') ){
        let time = window.prompt('ingrese los segundos que deben transcurrir para cambiar de imagen');
        while( isNaN(time) ) {
            time = window.prompt('ingrese un numero valido');
        }
        time = time * 1000; 
        window.setInterval( () => next.click(), time)
    }
}