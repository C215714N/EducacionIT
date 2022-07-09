// Declaraciones
    const d = document;
    const menuBtn  = d.querySelector('nav .btn');
    const menuList = d.querySelector('nav .menu');

// Menu Hamburguesa
menuBtn.onclick = () => menuList.classList.toggle('active')