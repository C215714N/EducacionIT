// Declaraciones: Ver en events.js
let images = ['osx-mavericks','osx-lion','osx-mojave']
const 
    btnGallery = d.querySelector('#btnGallery'),
    slides = d.getElementsByClassName('carrousel'),
    prev = d.querySelectorAll('.carrousel .prev'),
    next = d.querySelectorAll('.carrousel .next')

// Funciones y metodos
function addGallery(){
    let container = d.getElementById('gallery');
    for (let img of images){
        let card = d.createElement('div');
        card.className = 'card';
        card.innerHTML = `
            <img class="w-100" 
                src="assets/bg/${img}.jpg" 
                alt="${img}">
            <h3 class="card-header">${img}</h3>`;
        container.appendChild(card);
    }
}

function getCarrousel(array, callback){
    Array.from(array).forEach( el => {
        const buttons = el.querySelectorAll('button');
        const items = el.querySelectorAll('.item');
        callback(buttons, items)
    } )
}
function addEvents(buttons, items){
    buttons.forEach(btn => btn.addEventListener('click', () => console.log(btn.className)))
}

// metodo(evento, callback)
btnGallery.addEventListener('click', addGallery);
getCarrousel(slides, addEvents)

/* GALERIA CARROUSEL */
const searchElementInArray = function (array) {
    for(item of array){
        if(item.classList.contains('active')){
            item.classList.remove('active');
            console.log(item);
            return item;
} } }

const setActiveElement = (array, buttonType) => {
    let lastActiveItem = searchElementInArray(array);
    if(buttonType == 'prev'){
        lastActiveItem = lastActiveItem.previousElementSibling || lastActiveItem.parentNode.lastElementChild;
    } else if (buttonType == 'next'){
        lastActiveItem = lastActiveItem.nextElementSibling || lastActiveItem.parentNode.firstElementChild;
    } else {
        lastActiveItem = array[buttonType];
    }
    lastActiveItem.classList.add('active');
}

prev.forEach( (btn, i) => { btn.addEventListener('click', () => {
    let imageList = slides[i].querySelectorAll('.slide .item');
    setActiveElement(imageList,'prev');
} ) } )
next.forEach( (btn, i) => { btn.addEventListener('click', () => {
    let imageList = slides[i].querySelectorAll('.slide .item');
    setActiveElement(imageList,'next');
} ) } )
