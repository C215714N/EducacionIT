// Declaraciones
let d = document;
let menuBtn = d.querySelector('nav .btn');
let menuLst = d.querySelector('nav .menu');

// Navegacion
menuBtn.onclick = () => menuLst.classList.toggle('active');