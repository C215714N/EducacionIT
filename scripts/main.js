// Declaraciones
    const d = document;
    const menuBtn = d.querySelector('nav .btn');
    const menuLst = d.querySelector('nav .menu');

// Navegacion
    menuBtn.onclick = () => menuLst.classList.toggle('active')