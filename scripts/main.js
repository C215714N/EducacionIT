// Declaraciones
	const d = document
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')
	const ctx = d.querySelector('#canvas').getContext('2d')
//progress bar
	pIn.oninput = () => pBar.value = pIn.value 
//canvas
/*Rectangulo*/
	ctx.fillStyle = "hsl(240, 30%, 40%)"
	ctx.fillRect(50,50,100,100) /*x,y,width,height*/
/*Circulo*/
	ctx.fillStyle = "hsla(0, 50%, 50%, .5)"
	ctx.arc(150, 150, 50, 0, Math.PI * 2) /*cx, cy, r, start, end*/
	ctx.fill()
/*Poligono*/
	ctx.beginPath()
	ctx.fillStyle = "hsla(120, 50%, 50%, .5)"
	ctx.moveTo(150,50)
	ctx.lineTo(150,150)
	ctx.lineTo(225,100)
	ctx.fill()
/*Texto*/
	ctx.font = "bold 1rem calibri, sans-serif"
	ctx.strokeText("JAVASCRIPT CANVAS", 50, 250) /*text, x, y*/