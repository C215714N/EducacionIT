/*Mapa de contacto*/
	mapBtn 	= document.querySelector('#footer .map')
	mapFrm 	= document.querySelector('#footer .cover')

	mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('max', 'min') : mapBtn.classList.replace('min', 'max') 
/*Mostrar elementos*/
	showBtn = document.querySelectorAll('.show')
	layouts = document.querySelectorAll('.layout')
	showSpn = document.querySelectorAll('.show span')

	showBtn.forEach( (btn, i) => { btn.onclick = () => layouts[i].classList.toggle('active') ? showSpn[i].innerHTML = '(ocultar)' : showSpn[i].innerHTML = '(mostrar)'
	} )