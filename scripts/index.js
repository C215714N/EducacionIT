// Declaraciones
const
    d = document,
    cN = 'active',
    // Navegacion
    menuButton = d.querySelector('nav .btn'),
    menuList = d.querySelector('nav .menu')
;
// Funciones
    function toggle(object){
        const { target, btn, className, val } = object;
        target.classList.toggle(className) ?
        btn.classList.replace(val[0], val[1]) :
        btn.classList.replace(val[1], val[0])
    }
// Eventos
    // Navegacion 
    menuButton.addEventListener( 'click', (e) => toggle( {
        target: menuList,
        btn: e.target,
        className: cN,
        val: ['icon-open','icon-close']
    } ) )