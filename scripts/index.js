/* Declaraciones */
const
    d = document,
    w = window,
    // navigation
    menuBtn = d.querySelector('nav .btn'),
    menuLst = d.querySelector('nav .menu'),
    // contact map
    mapBtn = d.querySelector('#footer [class*="map-"]');
    mapFrm = d.querySelector('#footer .map'),
    // carrousel
    slides = d.querySelectorAll('.carrousel .slide'),
    indicators = d.querySelectorAll('.carrousel-indicators button'),
    prev = d.querySelector('.carrousel .icon-prev'),
    next = d.querySelector('.carrousel .icon-next'),

/* Eventos */
menuBtn.addEventListener('click', (e) => toggle(
    e.target, menuLst, 'menu-open', 'menu-close'
) );

mapBtn.addEventListener('click', (e) => toggle(
    e.target, mapFrm, 'map-open', 'map-close'
) );

prev.addEventListener('click', () => {
    setSlide(slides, 'prev');
    setSlide(indicators, 'prev')
} )

next.addEventListener('click', () => {
    setSlide(slides, 'next');
    setSlide(indicators, 'next')
} )

indicators.forEach( (btn, i) => btn.addEventListener('click', () => {
    setSlide(slides, i),
    setSlide(indicators, i)
} ) )

/* Funciones */
function toggle(btn, target, a, b){
    target.classList.toggle('active') ?
    btn.classList.replace(a, b) :
    btn.classList.replace(b, a)
}

function getSlide(array){
    for(el of array){
        if (el.classList.contains('active')){
            el.classList.remove('active')
            return el
} } }

function setSlide(array, type){
    let el = getSlide(array);
    el = ( 
        type == 'next' ? 
        el.nextElementSibling || array[0] :
        type == 'prev' ?
        el.previousElementSibling || array[array.length - 1] :
        array[type]
    )
    el.classList.add('active');
}