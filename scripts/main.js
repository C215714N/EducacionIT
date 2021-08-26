/*Mostrar elementos*/
	showBtn = document.querySelectorAll('.show')
	layouts = document.querySelectorAll('.layout')
	showSpn = document.querySelectorAll('.show span')

	showBtn.forEach( (btn, i) => { btn.onclick = () => layouts[i].classList.toggle('active') ? showSpn[i].innerHTML = '(ocultar)' : showSpn[i].innerHTML = '(mostrar)'
	} )