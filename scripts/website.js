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
    copy = d.querySelector('#footer .copy'),
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

/* Eventos */