	menuButton = document.querySelector('#menu')
	menuList = document.querySelector('nav .menu')

	menuButton.onclick = () => {
		menuList.classList.toggle('active') ? 
			menuButton.innerHTML = `&times;` : 
			menuButton.innerHTML = `&equiv;`
	}