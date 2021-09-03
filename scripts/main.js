/*Navegacion Principal*/
	menuBtn  = document.querySelector('nav .btn')
	menuLst  = document.querySelector('nav .menu')

	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
/*Mostrar contenido*/
	showBtn  = document.querySelectorAll('.show')
	layouts  = document.querySelectorAll('.layout')
	showSpan = document.querySelectorAll('.show span')

	showBtn.forEach( (btn, i) => { 
		btn.onclick = () => layouts[i].classList.toggle('active') ? showSpan[i].innerHTML = '(ocultar)' : showSpan[i].innerHTML = '(mostrar)' 
	} )
/*Mapa de Contacto*/
	mapBtn  = document.querySelector('#footer .map')
	mapFrm  = document.querySelector('#footer .cover')

	mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('icon-max','icon-min') : mapBtn.classList.replace('icon-min', 'icon-max')
