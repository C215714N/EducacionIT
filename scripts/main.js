//  Declaraciones
    const d = document
    const menuBtn = d.querySelector('#menu')
    const menuLst = d.querySelector('nav .menu')

//  menu hamburguesa
    menuBtn.onclick = () => {
        let text
        // condicion ? valor V : valor F
        menuLst.classList.toggle('active') ? text = '&times;' : text = '&equiv;'
        menuBtn.innerHTML = text
    }