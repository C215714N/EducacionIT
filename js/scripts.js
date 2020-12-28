// Menu Hamburguesa
	btnMenu = document.querySelector('nav button');
	ulMenu = document.querySelector('nav .menu');

	btnMenu.addEventListener(
		'click', () => {
			ulMenu.classList.toggle('open');
			ulMenu.classList.contains('open') ? 
				btnMenu.innerHTML = '&times;' : 
				btnMenu.innerHTML = '&equiv;'
		}
	)