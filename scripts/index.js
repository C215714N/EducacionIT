// Declaraciones
const
    d = document,
    cN = 'active',
    // Galeria
    heading = d.querySelector('#header h1'),
    slides = d.querySelectorAll('.gallery .item'),
    controls = d.querySelectorAll('.gallery [class*="icon-"]'),
    // Navegacion
    menuButton = d.querySelector('nav .btn'),
    menuList = d.querySelector('nav .menu'),
    // Scroll
    images = d.querySelectorAll('#promos li'),
    // Mapa de Contacto
    mapButton = d.querySelector('#footer .btn.map'),
    mapFrame = d.querySelector('#footer iframe.map')
;
// Funciones
    function toggle(object){
        const { target, btn, className, val } = object;
        target.classList.toggle(className) ?
        btn.classList.replace(val[0], val[1]) :
        btn.classList.replace(val[1], val[0])
    }
    function getItem(object){
        const { array, className } = object;
        for (el of array){
            if(el.classList.contains(className)){
                el.classList.remove(className);
                return el;
    } } }
    function setItem(object){
        const { array, className, type, callback } = object;
        let item = callback(object);
        item = (
            type == 'next' ?
            ( item.nextElementSibling || item.parentNode.firstElementChild ) :
            type === 'prev' ?
            ( item.previousElementSibling || item.parentNode.lastElementChild ) :
            array[type]
        )
        item.classList.add(className);
    }
    function shadowClone(element){
        let container = d.querySelector(element);
        container.innerHTML += container.innerHTML
    }
    shadowClone('#promos ul', images);
// Eventos
    heading.addEventListener('click', () => {
        slides.forEach(item => item.classList.toggle('show'));
    })
    // Galeria
    controls.forEach( btn => btn.addEventListener('click', () => {
        setItem( {
            array: slides,
            className: cN,
            type: btn.className.split('-')[1],
            callback: getItem
        } )
    } ) )
    // Navegacion 
    menuButton.addEventListener( 'click', (e) => toggle( {
        target: menuList,
        btn: e.target,
        className: cN,
        val: ['icon-open','icon-close']
    } ) )
    // Mapa de Contacto
    mapButton.addEventListener( 'click', (e) => toggle({
        target: mapFrame,
        btn: e.target,
        className: cN,
        val: ['icon-plus','icon-less']
    } ) )