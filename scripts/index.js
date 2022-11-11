// Importaciones
const d = document;
const menuBtn = d.querySelector('nav .btn');
const menuList = d.querySelector('nav .menu');
const links = menuList.querySelectorAll('li');
const prev = d.querySelector('.control.icon-prev');
const next = d.querySelector('.control.icon-next');
const gallery = d.querySelectorAll('.slide li');
const indicators = d.querySelectorAll('.indicators button');

menuBtn.addEventListener('click', (e) => {
    if ( menuList.classList.toggle('active') ) {
        e.target.classList.replace('menu-open', 'menu-close') 
    } else {
        e.target.classList.replace('menu-close', 'menu-open')
    }
})
window.setInterval(() => next.click(), 30000);
prev.addEventListener('click', () => {
    getItem('prev', gallery)
    getItem('prev', indicators)
})
next.addEventListener('click', () => { 
    getItem('next', gallery)
    getItem('next', indicators)
})
indicators.forEach( (btn, i) => btn.addEventListener( 'click', () => {
    getItem(i, gallery)
    getItem(i, indicators)
}))

function getItem(type, array) {
    let nextElement;
    for(let img of array){
        if(img.classList.contains('active')){
            img.classList.remove('active');
            nextElement = (type == 'next' ?
            img.nextElementSibling || img.parentNode.firstElementChild :
            type == 'prev' ?
            img.previousElementSibling || img.parentNode.lastElementChild :
            array[type])
        }
    }
    nextElement.classList.add('active')
}

links.forEach( item => {
    item.addEventListener('mouseover', () => {
        let audio = d.createElement('audio');
        audio.src = 'assets/media/sound.mp3';
        audio.autoplay = true;
        item.appendChild(audio);
        audio.click();
        audio.play()
        setTimeout(() => item.removeChild(audio), 3000);
    })
} )
// Autor: Cristian Racedo