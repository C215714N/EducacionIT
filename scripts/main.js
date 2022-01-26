// Declaraciones
    const d = document
    const menuBtn = d.querySelector('nav .btn')
    const menuLst = d.querySelector('nav .menu')

// Navegacion
    menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
    /* condicion ? valor si V : valor si F */