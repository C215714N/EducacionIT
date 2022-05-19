// Declaraciones
    const d = document
    const menuList = d.querySelector('#header .menu');
    const menuButton = d.querySelector('#header .btn');
    const mapFrame = d.querySelector('#footer .map iframe');
    const mapButton = d.querySelector('#footer .map .btn');
    let cName = 'active';

// Eventos
/* Menu Hamburguesa */
    menuButton.addEventListener('click', () => 
        menuList.classList.toggle(cName) ?
            menuButton.innerHTML = '&times;' :
            menuButton.innerHTML = '&equiv;'
    )
/* Mapa de Contacto */
    mapButton.onclick = () => {
        // Operador Ternario condicion ? valor V : valor F
        mapFrame.classList.toggle(cName) ? 
        // codicion (se agrego la clase active)
            mapButton.classList.replace('icon-max','icon-min') : 
            // si se cumple (se reemplaza icon-max por icon-min)
            mapButton.classList.replace('icon-min','icon-max') 
            // de lo contrario (se reemplaza icon-min por icon-max)
    }