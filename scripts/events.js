const
    d = document,
    className = 'active',
    menuBtn = d.getElementById('menu'),
    menuList = d.querySelector('nav .menu'),
    mapBtn = d.getElementById('map'),
    mapFrm = d.querySelector('#footer > .map')

// Evento click
menuBtn.onclick = (e) => toggle({
    btn: e.target, 
    target: menuList,
    val: ['menu-close', 'menu-open']
} )
mapBtn.onclick = (e) => toggle( {
    val: ['map-close', 'map-open'],
    target: mapFrm, 
    btn: e.target
} )

// Funcion toggle
function toggle(obj) {
    obj.target.classList.toggle(className) ?
    obj.btn.classList.replace(obj.val[1],obj.val[0]) :
    obj.btn.classList.replace(obj.val[0],obj.val[1])
}

