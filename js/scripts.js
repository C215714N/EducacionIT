/*Menu Hamburguesa*/
	let btnMenu = document.querySelector('nav #menu');
	let ulMenu = document.querySelector('nav .menu');
	// Escucha evento click
	btnMenu.addEventListener(
		'click', () => {
			ulMenu.classList.toggle('open')
			if(ulMenu.classList.contains('open')){
				btnMenu.innerHTML = '&times;'
			} else {
				btnMenu.innerHTML = '&equiv;'
			}
		}
	);
