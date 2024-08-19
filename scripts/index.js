/* Declaraciones */
const 
    d = document,
    navBtn = d.querySelector('#nav button'),
    navMenu = d.querySelector('#nav .menu'),
    mapBtn = d.querySelector('#footer button.map'),
    mapFrame = d.querySelector('#footer iframe.map'),
    galleries = d.querySelectorAll('.gallery')
;
/* Funciones */
const toggle = (element, className = "active") => {
    return element.classList.toggle(className)
}
const setActiveItem = (array, type, className='active') => {
    // Encontrar el elemento activo
    let newItem;
    for(let i = 0; i < array.length; i++){
        if(array[i].classList.contains(className)){
            toggle(array[i]) // Quitar la clase active
            // Determinar el siguiente elemento
            switch(type){
            case 'next':
                newItem = (i < array.length - 1) ? array[i + 1] : array[0]
            break;
            case 'prev':
                newItem = (i > 0) ? array[i - 1] : array[array.length - 1];
            break;
            default:
                newItem = array[type]
            }
        }
    }
    toggle(newItem) // Agregar la clase active
}
/* Eventos */
navBtn.addEventListener('click', () => toggle(navMenu))
mapBtn.addEventListener('click', () => toggle(mapFrame))

galleries.forEach(gallery => {
    const buttons = ['prev', 'next']
    const items = gallery.querySelectorAll('.gallery-item')
    const controls = gallery.querySelectorAll('.gallery-controls button')

    // Botones de direccion
    buttons.forEach(button => {
        const btn = gallery.querySelector(`.icon-${button}`);
        btn.addEventListener('click', () => {
            setActiveItem(items, button)
            setActiveItem(controls, button)
        })
    })
    // Botones de control
    controls.forEach((ctrl,i) => ctrl.addEventListener('click', () => {
        setActiveItem(items, i)
        setActiveItem(controls, i)
    }))
})
