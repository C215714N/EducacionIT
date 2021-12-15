/*Declaraciones*/
	const d = document
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')
	const ctx = d.querySelector('#canvas').getContext('2d')
	const prev = d.querySelector('.icon-prev')
	const next = d.querySelector('.icon-next')
	const slideLst = d.querySelectorAll('#header .slide li')
	const spanLst = d.querySelectorAll('#header .control span')
/*Progress Bar*/
	pIn.addEventListener('input', () => pBar.value = pIn.value)
/*Canvas*/
	// Rectangulo
		ctx.fillStyle = '#448'
		ctx.fillRect(50, 50, 100, 100) // x y width height
	// Circulo
		ctx.fillStyle = 'hsla(0, 50%, 50%, .5)'
		ctx.arc(150, 150, 50, 0, Math.PI * 2) // cx cy r ini fin
		ctx.fill()
	// Triangulo
		ctx.beginPath()
		ctx.fillStyle = 'rgba(15,204,68,.5)'
		ctx.moveTo(150, 50)
		ctx.lineTo(150,150)
		ctx.lineTo(240,100)
		ctx.fill()
	// Texto
		ctx.font = 'bold 1rem sans-serif'
		ctx.strokeText('Rasters (Canvas)', 50, 250)
/*Galeria*/
	prev.onclick = () => (getItem(slideLst), getItem(spanLst))
	next.onclick = () => (getItem(slideLst, true), getItem(spanLst, true))

	const getItem = (array = [], dir = false, className = 'active') => {
		for(el of array){
			if(el.classList.contains(className)){
				el.classList.remove(className)
				newItem = (dir ? (el.nextElementSibling || el.parentNode.firstElementChild) : (el.previousElementSibling || el.parentNode.lastElementChild))
		}	} 	newItem.classList.add(className)
	}