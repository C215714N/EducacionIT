//  Declaraciones
    const d = document
    const menuBtn = d.querySelector('#menu')
    const menuLst = d.querySelector('nav .menu')
    const mapBtn = d.querySelector('#footer .map .btn')
    const mapFrm = d.querySelector('#footer iframe')
//  menu hamburguesa
    menuBtn.onclick = () => {
        let text
        // condicion ? valor V : valor F
        menuLst.classList.toggle('active') ? text = '&times;' : text = '&equiv;'
        menuBtn.innerHTML = text
    }

//  mapa de contacto
    mapBtn.onclick = () => {
        mapFrm.classList.toggle('active') ? 
            mapBtn.classList.replace('icon-max','icon-min') : 
            mapBtn.classList.replace('icon-min', 'icon-max')
    }