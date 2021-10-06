/*Declarations*/
	const d = document
	const menuBtn = d.querySelector('nav .btn')
	const menuLst = d.querySelector('nav .menu')
	const pBar = d.querySelectorAll('.progress progress')
	const pIn  = d.querySelectorAll('.progress input') 
	const slideLst = d.querySelectorAll('.slide li')
	const spanLst = d.querySelectorAll('.control span')
	const prev = d.querySelector('.icon-prev')
	const next = d.querySelector('.icon-next')

// Navigation Bar
	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'

// Progress Bar
	pIn.forEach( (cmd,i) => cmd.addEventListener( 
		'input', () => pBar[i].value = cmd.value 
	)	)
/*Gallery*/
	window.setInterval( () => next.click(), 15000 )
	prev.onclick = () => ( changeItem(slideLst), changeItem(spanLst) )
	next.onclick = () => ( changeItem(slideLst, true), changeItem(spanLst, true) )

	const changeItem = (array, type, className = 'active') => {
		for(i = 0; i < array.length; i++){
			if(array[i].classList.contains(className)){
				array[i].classList.remove(className)
				getDir(array[i], type)
		}	}	newItem.classList.add(className)
	}
	const getDir = (el, type) => {
		switch(type){
			case true: newItem = el.nextElementSibling || el.parentNode.firstElementChild
			break;
			default: newItem = el.previousElementSibling || el.parentNode.lastElementChild
	}	}