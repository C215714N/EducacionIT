/* Declaraciones */
	const d = document
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')
	const ctx = d.querySelector('#canvas').getContext('2d')
	const prev = d.querySelectorAll('.icon-prev')
	const next = d.querySelectorAll('.icon-next')
	const slide = d.querySelectorAll('.slide')
	const control = d.querySelectorAll('.control')
	const mapBtn = d.querySelector('#footer .icon')
	const mapFrm = d.querySelector('#footer .map')
/* 	Galeria de imagenes	*/
	const getItem = (array = [], dir = false, className = 'active') => {
		for(el of array){
			if(el.classList.contains(className)){
				el.classList.remove(className)
				newItem = dir ? (el.nextElementSibling || el.parentNode.firstElementChild) : (el.previousElementSibling || el.parentNode.lastElementChild)
		}	}	newItem.classList.add(className)
	}
/*	Multiples galerias	*/
	prev.forEach((p,i) => p.addEventListener('click', () => {
		getItem(slide[i].querySelectorAll('li'))
		getItem(control[i].querySelectorAll('span'))
	}	)	)
	next.forEach((n,i)=> n.addEventListener('click', () => {
		getItem(slide[i].querySelectorAll('li'),true	)
		getItem(control[i].querySelectorAll('span'),true)
	}	) 	)
	window.setInterval(() => next[0].click(), 15000)
/* Progress Bar */
	pIn.addEventListener('input',() => pBar.value = pIn.value)
/* Canvas*/
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
		ctx.font = 'normal 1.2rem sans-serif'
		ctx.strokeText('Bitmap Canvas (JS)', 50, 250)
/* Mapa de contacto */
	mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('icon-add','icon-rem') : mapBtn.classList.replace('icon-rem', 'icon-add')