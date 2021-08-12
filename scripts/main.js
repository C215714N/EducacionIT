/* Navigation */
	menuBtn = document.querySelector('nav .btn')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => menuLst.classList.toggle('active') 
/* Progress Bar */
	pBar = document.querySelector('.progress progress')
	pIn  = document.querySelector('.progress input')

	pIn.addEventListener('input', () => pBar.value = pIn.value )
/* Animation Start */
	aniDiv = document.querySelector('.progression div')
	aniBtn = document.querySelector('.progression button')

	aniBtn.onclick = () => aniDiv.style.animationPlayState == 'paused' ? 
		(aniDiv.style.animationPlayState = 'running', aniBtn.innerHTML = 'PAUSE' ): 
		(aniDiv.style.animationPlayState = 'paused', aniBtn.innerHTML = 'PLAY' )
/* Video Player*/
	playTag = document.querySelector('.bg-vid')
	playBtn = document.querySelector('.bg-vid .btn')
	playVid = document.querySelector('.bg-vid video')

	playTag.onclick = () => playVid.paused ? 
		(playVid.play(), playBtn.classList.replace('icon-play', 'icon-pause')) : 
		(playVid.pause(), playBtn.classList.replace('icon-pause', 'icon-play'))
/* Contact Map */
	mapBtn = document.querySelector('#footer .btn.opacity')
	mapFrm = document.querySelector('#footer iframe.cover')

	mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('icon-max', 'icon-min') : mapBtn.classList.replace('icon-min', 'icon-max') 
/* Gallery */
	const changeItem = (array, type) => {
		for(i = 0; i < array.length; i++){
			if (array[i].classList.contains('active')){
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
		}	}	}	newItem.classList.add('active')
	}
	window.setInterval( () => forwards[0].click() , 30000)
	/*obtener todas las galerias*/
		counters = document.querySelectorAll('.slide_count') 
		galleries = document.querySelectorAll('.slide')
	/*obtener todos los botones*/
		backwards = document.querySelectorAll('.icon-prev')
		forwards  = document.querySelectorAll('.icon-next')
	/*eventos por cada boton*/
		backwards.forEach( (a, i) => { a.onclick = () => {
			let g = galleries[i].querySelectorAll('li')
			let c = counters[i].querySelectorAll('span')
			changeItem(g)
			changeItem(c)
		}	}	)
		forwards.forEach( (s,i) => { s.onclick = () => {
			let g = galleries[i].querySelectorAll('li')
			let c = counters[i].querySelectorAll('span')
			changeItem(g, true)
			changeItem(c, true)
		}	}	)