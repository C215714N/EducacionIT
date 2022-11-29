const
    d = document,
    menuBtn = d.getElementById('menu'),
    menuList = d.querySelector('nav .menu')

// Evento click
menuBtn.onclick = () => menuList.classList.toggle('active');