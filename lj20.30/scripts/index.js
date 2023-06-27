// Declaraciones
const 
    d = document,
    className = 'active',
    // Navegacion
    menuBtn     = d.querySelector('#nav .btn'),
    menuList    = d.querySelector('#nav .menu')
;

// Funciones
function toggle({target, btn, val = []}){
    target.classList.toggle(className) ?
    btn.classList.replace( val[0], val[1] ) :
    btn.classList.replace( val[1], val[0] )
}
// Eventos
menuBtn.addEventListener('click', (e) => toggle({
    target: menuList,
    btn: e.target,
    val: ['menu-open', 'menu-close']
} ) )