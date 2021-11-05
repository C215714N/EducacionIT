// Declaraciones
	const d = document
	const menuBtn = d.querySelector('nav .btn')
	const menuLst = d.querySelector('nav .menu')
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')
	const ctx = d.querySelector('#canvas').getContext('2d')
	const prev = d.querySelector('.icon-prev')
	const next = d.querySelector('.icon-next')
	const slideLst = d.querySelectorAll('.slide li')
	const slideSpn = d.querySelectorAll('.controls span')
//navigation bar
	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
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
//gallery
	prev.onclick = () => ( changeItem(slideLst), changeItem(slideSpn) )
	next.onclick = () => ( changeItem(slideLst, true), changeItem(slideSpn, true) )

	const changeItem = (array, type, className = 'active') => {
		for(i = 0; i < array.length ; i++){
			if(array[i].classList.contains(className)){
				array[i].classList.remove(className)
				switch(type){
					case true:
						i < array.length - 1 ? newItem = array[i + 1] : newItem = array[0]
					break;
					default:
						i > 0 ? newItem = array[i - 1] : newItem = array[array.length - 1]
		}	}	}	newItem.classList.add(className)
	}
