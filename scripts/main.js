/*Declaraciones*/
	const d = document
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')
	const ctx = d.querySelector('#canvas').getContext('2d')
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