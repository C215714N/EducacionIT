/* Declaraciones */
const 
    d = document,
    className = 'active',
    // Navegacion
    menuBtn     = d.querySelector('#nav .btn'),
    menuList    = d.querySelector('#nav .menu'),
    // Mapa de Contacto
    mapBtn      = d.querySelector('#footer button[class*="map-"]'),
    mapFrame    = d.querySelector('#footer iframe.map')
;

/* Funciones */
function toggle({target, btn, val = []}){
    target.classList.toggle(className) ?
    btn.classList.replace( val[0], val[1] ) :
    btn.classList.replace( val[1], val[0] )
}
/* Eventos */
// Navegacion
menuBtn.addEventListener('click', (e) => toggle({
    target: menuList,
    btn: e.target,
    val: ['menu-open', 'menu-close']
} ) )
// Mapa de Contacto
mapBtn.addEventListener('click', (e) => toggle({
    target: mapFrame,
    btn: e.target,
    val: ['map-open','map-close']
} ) )