/*Navegacion Principal*/
	menuBtn = document.querySelector('nav .btn')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => 
		menuLst.classList.toggle('active') ? 
			menuBtn.innerHTML = '&times;' : 
			menuBtn.innerHTML = '&equiv;'
/*Galeria de Imagenes*/
	prev = document.querySelector('#header .icon-prev')
	next = document.querySelector('#header .icon-next')
	slide = document.querySelectorAll('.slide li')

	prev.onclick = () => changeItem(slide)
	next.onclick = () => changeItem(slide, true)

	const changeItem = (array, type) => {
		for(i = 0; i < array.length; i++){
			if( array[i].classList.contains('active')){
				array[i].classList.remove('active')
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
				}	
			}
		} newItem.classList.add('active')
	}
/*Modo*/
	modeBtn = document.querySelector('#tema')
	modeEls = document.querySelectorAll('.mode')
	modeBtn.onclick = () => modeEls.forEach( el => el.classList.contains('light') ? el.classList.replace('light','dark') : el.classList.replace('dark', 'light'))