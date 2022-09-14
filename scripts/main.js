const d = document;
const mapButton = d.querySelector('#footer .map');
const mapFrame = d.querySelector('#footer .cover');
const menuButton = d.querySelector('nav .btn');
const menuList = d.querySelector('nav .menu');

mapButton.onclick = () => alterClass(mapButton, mapFrame, 'icon-max', 'icon-min');

menuButton.addEventListener('click', () => {
    alterClass(menuButton, menuList, 'open','close')
}   )

function alterClass(el, tag, a, b){
    tag.classList.toggle('active') ?
    el.classList.replace(a,b) :
    el.classList.replace(b,a)
}

// fotos = [
//     'bart',
//     'lisa',
//     'maggie',
//     'marge'
// ]
// const tag = d.querySelector('.css-grid.dynamic.masonry');

// for(foto of fotos){
//     tag.innerHTML += `<img src="assets/gallery/${foto}.png" alt="foto de ${foto}">
//     `
// }