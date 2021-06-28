/* Navigation */
	menuBtn = document.querySelector('nav .button')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
/* Progress Bar */
	pBar = document.querySelector('.progress progress')
	pIn  = document.querySelector('.progress input')

	pIn.addEventListener('input', () => pBar.value = pIn.value )
/* Gallery */
	// Variables
	spanLst = document.querySelectorAll('#header span')
	slideLst = document.querySelectorAll('#header li')
	prev = document.querySelector('#header .icon-prev')
	next = document.querySelector('#header .icon-next')
	//Eventos
	prev.onclick = () => { changeItem(slideLst); changeItem(spanLst) }
	next.onclick = () => { changeItem(slideLst, true); changeItem(spanLst, true) }
	//Funciones
	const changeItem = (itemList, type) => {
		for(i = 0; i < itemList.length; i++){
			if(itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active')
				switch(type){
					case true:
						i < itemList.length - 1 ?
							newItem = itemList[i + 1] :
							newItem = itemList[0]
					break;
					default:
						i > 0 ?
							newItem = itemList[i - 1] :
							newItem = itemList[ itemList.length - 1]
		}	}	} newItem.classList.add('active')
	}
/* Animations */
	animBox = document.querySelector('.around div')
	playBtn = document.querySelector('.around button')

	playBtn.onclick = () => {
		if (animBox.style.animationPlayState == 'paused') {
			animBox.style.animationPlayState = 'running'
			playBtn.innerHTML = 'PAUSE'
		} else { 
			animBox.style.animationPlayState = 'paused'
			playBtn.innerHTML = 'PLAY'
		}
	}