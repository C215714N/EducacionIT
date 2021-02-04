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
		prev.onclick = () => {
			changeItem(imageList, false)
			changeItem(spanList,false)
		}
		next.onclick = () => {
			changeItem(imageList, true) 
			changeItem(spanList,true)
		}
	// Obtener el elemento activo y cambiar
		const changeItem = (itemList, type) => {
			for(i = 0 ; i < itemList.length; i++){
				if(itemList[i].classList.contains('active')){
					itemList[i].classList.remove('active')
					switch(type){
						case true:
							i < itemList.length - 1 ? 
								nextItem = itemList[i + 1] : 
								nextItem = itemList[0]
						break;
						case false:
							i > 0 ?
							nextItem = itemList[i - 1] :
							nextItem = itemList[itemList.length - 1]
						break;
			}	}	} 
			nextItem.classList.add('active')
		}