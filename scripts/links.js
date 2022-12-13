const links = d.querySelectorAll('.links a'),
    selectedLink = d.getElementById('selected');

links.forEach( link => {
    link.addEventListener( 'click', (e) => {
        e.preventDefault()
        selectedLink.innerText = e.target.innerText
        // Cambiar estilos directamente
        /* selectedLink.style.backgroundColor = '#002550' */
        // Cambiar clases de css
        if(selectedLink.classList.contains('selected')){
            selectedLink.classList.replace('selected', 'special')
        } else {
            selectedLink.classList.replace('special', 'selected')
        }
    } )
});