/*Mostrar contenido*/
	showBtn  = document.querySelectorAll('.show')
	layouts  = document.querySelectorAll('.layout')
	showSpan = document.querySelectorAll('.show span')

	showBtn.forEach( (btn, i) => { 
		btn.onclick = () => layouts[i].classList.toggle('active') ? showSpan[i].innerHTML = '(ocultar)' : showSpan[i].innerHTML = '(mostrar)' 
	} )