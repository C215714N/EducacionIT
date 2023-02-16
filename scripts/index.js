// Declaraciones
const 
    d = document,
    className = 'active',
    // Navegacion
    nav = d.getElementById('nav'),
    menuButton = d.querySelector('#nav .btn'),
    menuList = d.querySelector('#nav .menu'),
    // Galeria
    prev = d.querySelector('.gallery .icon-prev'),
    next = d.querySelector('.gallery .icon-next'),
    gallery = [
        d.querySelectorAll('.gallery .item'), 
        d.querySelectorAll('.gallery .controls .btn')
    ],
    // Mapa de contacto
    mapFrame = d.querySelector('iframe.map')
;

// Funciones
function toggle(object){
    const { btn, target, list, className } = object;
    // ternario: condicion ? valor V : valor F
    target.classList.toggle(className) ?
    btn.classList.replace(list[0], list[1]) :
    btn.classList.replace(list[1], list[0])
}
function remove(object){
    const { el, className } = object;
    el.classList.remove(className);
}
function getItem(object){
    const { array, className } = object;
    for (let el of array){
        if (el.classList.contains(className)){
            el.classList.remove(className);
            return el;
} } }

function setItem(object){
    let item = getItem(object);
    item = (
        object.type == 'next' ?
        ( item.nextElementSibling || item.parentNode.firstElementChild ) :
        object.type == 'prev' ?
        ( item.previousElementSibling || item.parentNode.lastElementChild ) :
        item[object.type]
    );
    item.classList.add(className);
}

// Eventos
prev.addEventListener('click', () => gallery.forEach((array) => setItem({
    type: 'prev',
    array,
    className
})) );

next.addEventListener('click', () => gallery.forEach((array) => setItem({
    type: 'next',
    array,
    className
})));

d.onclick = (e) => {
    let btn = e.target, target, list;
    const action = btn.attributes['action-js'].value;
    const type = btn.classList;
    // verificacion de propiedad action-js
    if(action == 'toggle'){
        // Verificacion de clases
        if (type.contains('nav-toggle')){
            btn = menuButton;
            target = menuList;
            list = ['icon-open', 'icon-close'];
        }
        if (type.contains('map')){
            target = mapFrame;
            list = ['icon-plus', 'icon-less'];
        }
        // Ejecucion de funcion alternadora
        toggle({
            btn,
            target,
            className,
            list,
        })
    }
    if(action == 'select'){
        console.log(e)
    }
    else{
        console.log('no hay action');
    }
}

nav.onmouseleave = () => setTimeout( 
    () => remove({ el: menuList, className }), 15000 
)
/*
    PRIMITIVOS
    string = 'cristian'
    number = 31
    boolean = true

    OBJETO
    object = { name: 'cristian', age: 31, teacher: true }
    array = ['cristian', 31, true, ['a', 'b', 'c'] ]

    object[name] // cristian
    array[0] // cristian
    array[3][2] // c
    array[3][0] // a
*/