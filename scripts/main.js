/* Menu Desplegable */
	menuButton 	= document.querySelector('#menu')
	menuList 	= document.querySelector('nav .menu')

	menuButton.onclick = () => menuList.classList.toggle('active') ? menuButton.innerHTML = `&times;` : menuButton.innerHTML = `&equiv;`

/* Galeria de Elementos */
	prev	= document.querySelector('#header .prev')
	next	= document.querySelector('#header .next')
	imageList	= document.querySelectorAll('#header li')
	spanList	= document.querySelectorAll('#header span')
	// Eventos 
		prev.onclick = () => changeItem()
		next.onclick = () => changeItem()
	// Obtener el elemento activo y cambiar
