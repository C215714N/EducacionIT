// Menu Desplegable	
	menuBtn = document.querySelector('nav .button')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => {
	/* Ternario: condicion ? valor si V : valor si F */
	// consulta si se aplico la clase active
		menuLst.classList.toggle('active') ?
		// valor si se cumple 
			menuBtn.innerHTML = '&times;' :	
		// valor si NO se cumple
			menuBtn.innerHTML = '&equiv;'
	}

// Galeria slide
	slideLst = document.querySelectorAll('.slide li')
	prev = document.querySelector('#header .icon-prev')
	next = document.querySelector('#header .icon-next')

	prev.onclick = () => changeItem(slideLst)
	next.onclick = () => changeItem(slideLst, true)

	const changeItem = (itemList, type) => {
		for (i = 0; i < itemList.length ; i++ ){
			if (itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active')
				switch (type){
					case true:
						( i < itemList.length - 1 ) ? 
						newItem = itemList[i + 1] :
						newItem = itemList[0] 
					break;
					default:
						( i > 0 ) ?
						newItem = itemList[i - 1] :
						newItem = itemList[itemList.length - 1]
		}	}	}
		newItem.classList.add('active')
	}