const
    d = document,
    w = window,
    // contact map
    mapBtn = d.querySelector('#footer [class*="map-"]');
    mapFrm = d.querySelector('#footer .map'),

mapBtn.addEventListener('click', (e) => toggle(
    e.target, mapFrm, 'map-open', 'map-close'
) );

/* Funciones */
function toggle(btn, target, a, b){
    target.classList.toggle('active') ?
    btn.classList.replace(a, b) :
    btn.classList.replace(b, a)
}