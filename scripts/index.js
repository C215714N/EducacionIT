// Declaraciones
    const 
    d = document,
    menuButton = d.querySelector('nav .btn'),
    menuList = d.querySelector('nav .menu');
// Eventos
    menuButton.onclick = () => menuList.classList.toggle('active')
// Funciones

