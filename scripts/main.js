/*Menu desplegable*/
	menuBtn = document.querySelector('nav .button');
	menuLst = document.querySelector('nav .menu');

	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
/*Galeria de Imágenes*/
	// Variables
	prev = document.querySelector('#header .prev');
	next = document.querySelector('#header .next');
	bgList = document.querySelectorAll('#header .slide li')
	spList = document.querySelectorAll('#header .slide span')
	// Intervalo de 25s
	window.setInterval(() => next.click(), 25000 )
	// Eventos
	prev.onclick = () => { 
		changeItem(bgList, false)
		changeItem(spList, false)  
	}
	next.onclick = () => { 
		changeItem(bgList, true)
		changeItem(spList, true)  
	}
	// Funcion de Cambio de elemento
	const changeItem = (itemList, type) => {
		for ( i = 0 ; i < itemList.length ; i++ ) {
			if(itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active')
				switch(type){
					case true:
						( i < itemList.length - 1 ) ? newItem = itemList[i + 1] : newItem = itemList[0]
					break;
					default:
						( i > 0) ? newItem = itemList[i - 1] : newItem = itemList[itemList.length - 1]
		}	}	} 
		newItem.classList.add('active')
	}
/* ProgressBar */
	ProIn  = document.querySelector('#jsProgress input')
	ProBar = document.querySelector('#jsProgress progress')

	ProIn.addEventListener( 'input', () => ProBar.value = ProIn.value )
/* Canvas */
	ctx = document.querySelector('#canvas').getContext('2d')
	// Rectangulo
		ctx.fillStyle = '#248'
		ctx.fillRect(20, 20, 150, 150) // (x, y, width, height)
	// Circulo (arco)
		ctx.fillStyle = 'hsla(0, 50%, 60%, .5)'
		ctx.arc(170, 170, 75, 0, 2*Math.PI) // (x, y, r, ini, fin)
		ctx.fill()
	// Poligono
		ctx.beginPath()
			ctx.fillStyle = 'rgba(0, 200, 50, .5)'
			ctx.moveTo(280, 90)
			ctx.lineTo(280, 280)
			ctx.lineTo(90, 280)
			ctx.fill()
		ctx.closePath()
	//Texto
		ctx.strokeStyle = '#333'
		ctx.font = '1.2rem Raleway, segoe ui, sans-serif'
		ctx.strokeText('Javascript Canvas', 20, 280) //(texto, x, y)
/* Contenido Multimedia */
	vidBox = document.querySelector('#video video')
	vidBtn = document.querySelector('#video button')

	vidBtn.onclick = () => {
		if (vidBox.paused){
			vidBox.play()
			vidBtn.innerHTML = 'PAUSE'
		} else {
			vidBox.pause()
			vidBtn.innerHTML = 'PLAY'
		}
	}