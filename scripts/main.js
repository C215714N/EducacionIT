	const d = document
/*Navigation Bar*/
	menuBtn = d.querySelector('nav .btn')
	menuLst = d.querySelector('nav .menu')

	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
/*Progress Bar*/
	pBar = d.querySelector('.progress progress')
	pIn  = d.querySelector('.progress input')

	pIn.addEventListener( 'input', () => pBar.value = pIn.value )
/*Background Map*/
	mapFrm = d.querySelector('.map')
	mapBtn = d.querySelector('.map-btn')

	mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('icon-max', 'icon-min') : mapBtn.classList.replace('icon-min', 'icon-max')
/*Gallery*/
	prev = d.querySelectorAll('.icon-prev')
	next = d.querySelectorAll('.icon-next')
	spanLst = d.querySelectorAll('.control')
	slideLst = d.querySelectorAll('.slide')

	// prev.onclick = () => { changeItem(slideLst); changeItem(spanLst) }
	// next.onclick = () => { changeItem(slideLst, true); changeItem(spanLst, true) }
	window.setInterval( () => next[0].click(), 10000 )
	prev.forEach( (p,i) => p.onclick = () => {
		getArray(i)
		changeItem(spn)
		changeItem(img)
	}	)
	next.forEach( (n,i) => n.onclick = () => {
		getArray(i)
		changeItem(spn, true)
		changeItem(img, true)
	}	)	
	const getArray = (i) => {
		spn = spanLst[i].querySelectorAll('span')
		img = slideLst[i].querySelectorAll('li')
	}
	const changeItem = (array, type, className = 'active') => {
		for (i = 0; i < array.length; i++){
			if(array[i].classList.contains(className)){
				array[i].classList.remove(className)
				switch(type){
					case true:
						i < array.length - 1 ? newItem = array[i + 1] :	newItem = array[0]
					break;
					default:
						i > 0 ? newItem = array[i - 1] : newItem = array[array.length - 1]
		}	}	}	newItem.classList.add(className)
	}