//Menu Hamburguesa
	let btnMenu = document.querySelector('#menu');
	let ulMenu = document.querySelector('.menu')

	btnMenu.addEventListener( 'click', () => { 
		//resultado de la funcion
			ulMenu.classList.toggle('openMenu'); 
			if(ulMenu.classList.contains('openMenu')){
				btnMenu.innerHTML = '&times;'
			} else {
				btnMenu.innerHTML = '&equiv;'
			}
	}	);