/* Declaraciones */
	const d = document
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')
	const ctx = d.querySelector('#canvas').getContext('2d')
	const prevBtn = d.querySelector('.icon-prev')
	const nextBtn = d.querySelector('.icon-next')
	const slideLst = d.querySelectorAll('#header .slide li')
	const spanLst = d.querySelectorAll('#header .control span')
/* Galeria de imagenes*/
	const getItem = (array = [], dir = false, className = 'active') => {
		for(i = 0; i < array.length; i++){
			if(array[i].classList.contains(className)){
				array[i].classList.remove(className)
				switch(dir){
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
	prevBtn.onclick = () => ( getItem(slideLst), getItem(spanLst) )
	nextBtn.onclick = () => ( getItem(slideLst, true), getItem(spanLst, true) )

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
