// Declaraciones
    const 
    d = document,
    className = 'active',
    menuButton = d.querySelector('nav .btn'),
    menuList = d.querySelector('nav .menu'),
    mapButton = d.querySelector('#footer > .btn.top-5.right-5'),
    mapFrame = d.querySelector('#footer .map.cover')
// Eventos
    menuButton.onclick = (e) => toggler({
        btn: e.target,
        target: menuList,
        val: ['menu-open','menu-close'],
    } )
    mapButton.onclick = (e) => toggler({
        btn: e.target,
        target: mapFrame,
        val: ['map-open','map-close'],
    } )
// Funciones
    function toggler(object){
        const { target, btn, val } = object;

        target.classList.toggle(className) ?
        btn.classList.replace(val[0], val[1]) :
        btn.classList.replace(val[1], val[0]) 
    }
