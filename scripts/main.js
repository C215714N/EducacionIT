/*Barra de Navegacion*/
	menuButton 	= document.querySelector('#menu');
	menuList	= document.querySelector('.menu');
	menuButton.addEventListener(
		'click', () => {
			menuList.classList.toggle('active');
			menuList.classList.contains('active') ? menuButton.innerHTML = '&times;' : menuButton.innerHTML = '&equiv;'
	}	)
/*Galeria Slide*/
	prev = document.querySelector('#header .icon-prev');
	next = document.querySelector('#header .icon-next');
	itemList = document.querySelectorAll('#header li');

	prev.addEventListener('click', () => changeItem( itemList, false ) )
	next.addEventListener('click', () => changeItem( itemList, true ) )

	function changeItem (itemList, type){
		for(i = 0; i < itemList.length ; i++){
			if(itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active');
				switch(type){
					case true: // boton siguiente
						i < itemList.length - 1 ? 
							nextItem = itemList[i + 1] : 
							nextItem = itemList[0]
					break;
					case false:
						i > 0 ? 
							nextItem = itemList[i - 1] : 
							nextItem = itemList[itemList.length - 1]
					break;
		}	}	}
		nextItem.classList.add('active');
	}
// Progress Bar
	pIn	 = document.querySelector('#jsPbar input');
	pBar = document.querySelector('#jsPbar progress');
	pIn.addEventListener(
		'input', () => pBar.value = pIn.value
	)
// Canvas
	let ctx = document.querySelector('#jsCanvas').getContext('2d');
	//	rectangulo central
		ctx.fillStyle = 'darkslateblue';
		ctx.fillRect(50, 50, 100, 100); // x, y, w, h
	//	rectangulo esquina superior
		ctx.fillStyle = 'rgba(234, 68, 136, .5)';
		ctx.fillRect(137.5, 37.5, 25, 25);
	//	circulo esquina inferior
		ctx.fillStyle = '#2488'
		ctx.arc(50, 150, 30, 0, Math.PI * 2); // cx , cy, r, ini, fin
		ctx.fill();
