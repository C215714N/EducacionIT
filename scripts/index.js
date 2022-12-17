/* Declaraciones */
const
    d = document,
    w = window,
    // navigation
    menuBtn = d.querySelector('nav .btn'),
    menuLst = d.querySelector('nav .menu'),
    // contact map
    mapBtn = d.querySelector('#footer [class*="map-"]');
    mapFrm = d.querySelector('#footer .map'),

/* Eventos */
menuBtn.addEventListener('click', (e) => toggle(
    e.target, menuLst, 'menu-open', 'menu-close'
) );

mapBtn.addEventListener('click', (e) => toggle(
    e.target, mapFrm, 'map-open', 'map-close'
) );

/* Funciones */
function toggle(btn, target, a, b){
    target.classList.toggle('active') ?
    btn.classList.replace(a, b) :
    btn.classList.replace(b, a)
}