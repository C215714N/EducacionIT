// Navigation Menu
	menuBtn = document.querySelector('nav .button')
	menuLst = document.querySelector('nav .menu')
	
	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'

// Progress bar
	pBar = document.querySelector('.progress progress')
	pIn  = document.querySelector('.progress input')
	pIn.addEventListener('input', () => pBar.value = pIn.value)

// Google Maps
	map = document.querySelector('#footer iframe')
	mapBtn = document.querySelector('#footer .button.opacity')

	mapBtn.onclick= () => map.classList.toggle('active') ? mapBtn.classList.replace('icon-max', 'icon-min') : mapBtn.classList.replace('icon-min', 'icon-max')