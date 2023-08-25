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
        button.onclick = function(){
            console.log('soy el boton n' + i)
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

createGallery(images, galleryList);
addButtons(images.length, controls);
addLinks(links, navigation);
addLinks(socialLinks, social);
copy.prepend(today.getFullYear()+' ');
/* Eventos */