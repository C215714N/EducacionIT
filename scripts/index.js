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
const getActiveItem = (array, className='active') => {
    for(let item of array) // Buscamos el elemento
    if(item.classList.contains(className)){
        toggle(item) // Removemos la clase
        return item
    }
}
const setActiveItem = (array, type, className='active') => {
    const item = getActiveItem(array, className)
    // Identificamos al siguiente elemento
    const newItem = (
        type === 'next' ? 
        (item.nextElementSibling) : 
        type === "prev" ? 
        (item.previousElementSibling) : 
        array[type]
    )
    toggle(newItem); // Agregamos la clase
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
            setActiveItem(items, button);
            setActiveItem(controls, button);
        })
    })
    // Botones de control
    controls.forEach((ctrl,i) => ctrl.addEventListener('click', () => {
        setActiveItem(items,i);
        setActiveItem(controls,i);
    }))
})
