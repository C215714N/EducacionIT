// Declaraciones
    const 
    d = document,
    className = 'active',
    menuButton = d.querySelector('nav .btn'),
    menuList = d.querySelector('nav .menu'),
    mapButton = d.querySelector('#footer > .btn.top-5.right-5'),
    mapFrame = d.querySelector('#footer .map.cover'),
    gallery = d.querySelectorAll('.gallery li'),
    prev = d.querySelectorAll('button.gallery-prev'),
    next = d.querySelectorAll('button.gallery-next'),
    indicators = d.querySelectorAll('.indicators button')

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

    prev.forEach( b => b.addEventListener('click', () => {
        setElement(gallery,'prev')
        setElement(indicators,'prev')
    } ))
    next.forEach( b => b.addEventListener('click', () => {
        setElement(gallery,'next')
        setElement(indicators,'next')
    } ))
// Funciones
    function toggler(object){
        const { target, btn, val } = object;

        target.classList.toggle(className) ?
        btn.classList.replace(val[0], val[1]) :
        btn.classList.replace(val[1], val[0]) 
    }

    function getElement(array){
        let newItem;
        for(el of array){
            if(el.classList.contains(className)){
                el.classList.remove(className)
                newItem = el;
        } }
        return newItem;
    }

    function setElement(array, type){
        let el = getElement(array);
        let newItem = ( 
            type == 'prev' ? 
            (el.previousElementSibling || el.parentNode.lastElementChild) :
            type == 'next' ? 
            (el.nextElementSibling || el.parentNode.firstElementChild) :
            (el)
        )
        newItem.classList.add(className)
    }