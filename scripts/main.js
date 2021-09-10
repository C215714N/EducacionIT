/*Navegacion Principal*/
	menuBtn  = document.querySelector('nav .btn')
	menuLst  = document.querySelector('nav .menu')

	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
/*Mostrar contenido*/
	showBtn  = document.querySelectorAll('.show')
	layouts  = document.querySelectorAll('.layout')
	showSpan = document.querySelectorAll('.show span')

	showBtn.forEach( (btn, i) => { 
		btn.onclick = () => layouts[i].classList.toggle('active') ? showSpan[i].innerHTML = '(ocultar)' : showSpan[i].innerHTML = '(mostrar)' 
	} )
/*Mapa de Contacto*/
	mapBtn  = document.querySelector('#footer .map')
	mapFrm  = document.querySelector('#footer .cover')

	mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('icon-max','icon-min') : mapBtn.classList.replace('icon-min', 'icon-max')
/*Galeria de Imagenes*/
	slide = document.querySelectorAll('.slide')
	prev = document.querySelectorAll('.icon-prev')
	next = document.querySelectorAll('.icon-next')

	prev.forEach( (p,i) => p.onclick = () => changeItem(slide[i].querySelectorAll('li') ))
	next.forEach( (n,i) => n.onclick = () => changeItem(slide[i].querySelectorAll('li'), true ))

	const changeItem = (array, type, className = 'active') => {
		for (i = 0; i < array.length; i++){
			if(array[i].classList.contains(className)){
				array[i].classList.remove(className)
				switch(type){
					case true:
						i < array.length - 1 ?
							newItem = array[i + 1] :
							newItem = array[0]
					break;
					default:
						i > 0 ?
							newItem = array[i - 1] :
							newItem = array[ array.length - 1 ]
		}	}	}	newItem.classList.add(className)
	}
