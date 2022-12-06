// Declaraciones: Ver en events.js
let images = ['osx-mavericks','osx-monterrey','osx-mojave']
const 
    btnGallery = d.querySelector('#btnGallery'),
    slides = d.getElementsByClassName('carrousel')
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

// implementacion