const 
/* Elementos del DOM */
    d = document,
    // Cabecera de Pagina
    galleryList = d.querySelector('#header .gallery-list'),
    controls = d.querySelector('#header .controls'),
    prev = d.querySelector('#header .icon-prev'), 
    next = d.querySelector('#header .icon-next'),
    // Navegacion
    navigation = d.querySelector('#nav .navigation'),
    // Contenido
    root = d.getElementById('root'),
    // Pie de Pagina
    social = d.querySelector('#footer .social'),
    copy = d.querySelector('#footer .icon-copy'),
/* Declaraciones Globales  */
    // Galeria
    path = "assets/bg/",
    images = [
        "osx-el-capitan.jpg",
        "osx-high-sierra.jpg",
        "osx-mavericks.jpg",
        "osx-mojave.jpg",
        "osx-mountain-lion.jpg",
        "osx-sierra.jpg",
        "osx-snow-leopard.jpg",
        "osx-yosemite.jpg"
    ],
    // Navegacion
    links = [
        {text: 'inicio',    link: '#' }, 
        {text: 'nosotros',  link: 'arrays.html' }, 
        {text: 'servicios', link: 'methods.html' }, 
        {text: 'contacto',  link: 'index.html' }
    ],
    // Redes sociales
    socialLinks = [
        'facebook',
        'instagram',
        'twitter',
        'github'
    ],
    // Derechos de Autor
    today = new Date();

/* Funciones  */
function createGallery(array, element){
    for (let item of array){
        let a = '';
        // EL primer elemento tiene la clase active
        if (array.indexOf(item) === 0) a ='active';
        // Agrega el elemento a la lista
        element.innerHTML += 
        '<li class="gallery-item '+a+'">'+
            '<img src='+path+item+' alt="Imagen de Galeria">'+
        '</li>' 
} }
function addButtons(n, element){
    for(let i = 0; i < n; i++){
        let button = d.createElement('button');
        if(i == 0) button.setAttribute('class', 'active');
        button.onclick = function(){
            const list = galleryList.querySelectorAll('li');
            const buttons = controls.querySelectorAll('button');
            setActiveElement(i, list)
            setActiveElement(i, buttons)
        }
        element.append(button)
    }
}
function addLinks(array, element){
    for (let item of array){
        if (typeof item === 'string'){
            element.innerHTML += '<a class='+item+' href="https://'+item+'.com" target="_blank"></a>';
        }
        else {
            element.innerHTML +='<li>'+'<a href='+item['link']+'>'+item['text']+'</a>'+'</li>'
        }
    }
}

function getActiveElement(array, className){
for (let element of array){
if (element.classList.contains(className)){
    element.classList.remove(className);
    return element;
} } }
function setActiveElement(type, array, className = "active"){
    let element = getActiveElement(array, className);
    switch(type){
        case 'next':
            element = element.nextElementSibling || array[0]
        break;
        case 'prev':
            element = element.previousElementSibling ?? array[array.length - 1]
        break;
        default:
            element = array[type]
    }
    element.classList.add(className);
}

createGallery(images, galleryList);
addButtons(images.length, controls);
addLinks(links, navigation);
addLinks(socialLinks, social);
copy.prepend(today.getFullYear()+' ');

/* Eventos */
next.onclick = function(){
    const list = galleryList.querySelectorAll('li');
    const buttons = controls.querySelectorAll('button');

    setActiveElement('next', list)
    setActiveElement('next', buttons)
}
prev.onclick = function(){
    const list = galleryList.querySelectorAll('li');
    const buttons = controls.querySelectorAll('button');

    setActiveElement('prev', list)
    setActiveElement('prev', buttons)
}