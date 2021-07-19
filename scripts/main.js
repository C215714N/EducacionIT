/*Navigation Bar*/
	menuBtn = document.querySelector('nav .btn')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
/*Elemento Progress*/
	pBar = document.querySelector('.progress progress')
	pIn  = document.querySelector('.progress input')
	
	pIn.addEventListener('input', () => pBar.value = pIn.value)
/*Galeria de Imagenes*/
	prev = document.querySelector('#header .icon-prev');
	next = document.querySelector('#header .icon-next');
	slideLst = document.querySelectorAll('#header .slide li')
	spanLst = document.querySelectorAll('#header .header span')

	window.setInterval( () => next.click() , 30000)
	prev.onclick = () => { changeItem(slideLst); changeItem(spanLst) }
	next.onclick = () => { changeItem(slideLst, true); changeItem(spanLst, true) }

	const changeItem = (array, type, className = 'active') => {
		for(i = 0; i < array.length ; i++){
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
							newItem = array[array.length - 1]
		}	}	}	newItem.classList.add(className)	
	}