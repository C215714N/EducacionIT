// Declaraciones
    const d = document;
    const menuBtn = d.querySelector('nav .btn');
    const menuLst = d.querySelector('nav .menu');
    const mapBtn = d.querySelector('#footer .btn.map');
    const mapFrm = d.querySelector('#map');
    let cN = 'active';

// Navegacion
    menuBtn.onclick = () => menuLst.classList.toggle(cN)

// Mapa de contacto
    mapBtn.addEventListener( 'click',() => { 
        // condicion ? valor V : valor F
        mapFrm.classList.toggle(cN) ?
            mapBtn.classList.replace('icon-max','icon-min') :
            mapBtn.classList.replace('icon-min','icon-max')
    } )