// Declaraciones
const 
    d = document,
    className = 'active',
    // Navegacion
    nav = d.getElementById('nav'),
    menuButton = d.querySelector('#nav .btn'),
    menuList = d.querySelector('#nav .menu'),
    // Mapa de contacto
    mapFrame = d.querySelector('iframe.map')
;

// Funciones
function toggle(object){
    const { btn, target, list, className } = object;
    // ternario: condicion ? valor V : valor F
    target.classList.toggle(className) ?
    btn.classList.replace(list[0], list[1]) :
    btn.classList.replace(list[1], list[0])
}

// Eventos
d.onclick = (e) => {
    let btn = e.target, target, list;
    const action = btn.attributes['action'].value;
    const type = btn.classList;

    if(action == 'toggle'){
        if (type.contains('nav-toggle')){
            btn = menuButton;
            target = menuList;
            list = ['icon-open', 'icon-close'];
        }
        if (type.contains('map')){
            target = mapFrame;
            list = ['icon-plus', 'icon-less'];
        }
        toggle({
            btn,
            target,
            className,
            list,
        })
    }
    else if(action == 'select'){
        console.log(e)
    }
    else{
        console.log('no hay action');
    }
}

nav.onmouseleave = () => setTimeout( 
    () => menuList.classList.remove('active'), 15000 
)