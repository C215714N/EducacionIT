const newGallery = (array) => {
    container = d.createElement('div');
    container.className = 'gallery-alt d-grid auto medium';
    
    // Metodo que recorre y devuelve un nuevo elemento por cada item del array
    array.map(item => {
        container.innerHTML += `
        <div class="box-item">
            <img src=${path+item} alt="Imagen de Galeria">
            <button class="btn-lg icon-plus"></button>
        </div>` 
    } )
    // Anidacion de elementos en el DOM
    root.append(container);
    // Captura de elementos para asignacion de acciones
    buttons = d.querySelectorAll('.box-item button')
    buttons.forEach(btn => {
        // API de Eventos (Escuchador)
        btn.addEventListener('click', (ev) => {
            toggle(
                ev.target.parentNode,
                ev.target,
                ['icon-plus', 'icon-less']
            )
        } )
    } )
}

newGallery(images.reverse());