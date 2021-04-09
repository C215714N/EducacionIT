// Menu Desplegable	
	menuBtn = document.querySelector('nav .button')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => {
	/* Ternario: condicion ? valor si V : valor si F */
	// consulta si se aplico la clase active
		menuLst.classList.toggle('active') ?
		// valor si se cumple 
			menuBtn.innerHTML = '&times;' :	
		// valor si NO se cumple
			menuBtn.innerHTML = '&equiv;'
	}