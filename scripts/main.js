// Declaraciones
	const d = document
	const menuBtn = d.querySelector('nav .btn')
	const menuLst = d.querySelector('nav .menu')
	const mapBtn = d.querySelector('.map .btn')
	const mapFrm = d.querySelector('.map iframe')
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')
	const ctx = d.querySelector('#canvas').getContext('2d')
	const prev = d.querySelectorAll('.icon-prev')
	const next = d.querySelectorAll('.icon-next')
	const slides = d.querySelectorAll('.slide')
	const controls = d.querySelectorAll('.controls')
	const animBtn = d.querySelector('.around button')
	const animDiv = d.querySelector('.around div')
//navigation bar
	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
//contact map
	mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('icon-max','icon-min') : mapBtn.classList.replace('icon-min','icon-max')
//animation play state
	animBtn.onclick = () => animDiv.style.animationPlayState == 'running' ? 
		(animDiv.style.animationPlayState = 'paused', animBtn.innerHTML = 'PLAY'): 
		(animDiv.style.animationPlayState = 'running', animBtn.innerHTML = 'PAUSE') 
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
	const changeItem = (array, type, className = 'active') => {
		for(const el of array){
			if(el.classList.contains(className)){
				el.classList.remove(className)
				getDir(el, type)
		}	}	newItem.classList.add(className)
	}
	const getDir = (el, type) => {
		newItem = ( type ? 
			el.nextElementSibling || el.parentNode.firstElementChild : 
			el.previousElementSibling || el.parentNode.lastElementChild
	)	}
	prev.forEach((p,i) => { p.onclick = () => {
		changeItem(slides[i].querySelectorAll('li'))
		changeItem(controls[i].querySelectorAll('span'))
	}	}	)
	next.forEach((n,i) => { n.onclick = () => {
		changeItem(slides[i].querySelectorAll('li'), true)
		changeItem(controls[i].querySelectorAll('span'), true)
	} 	} 	)
