// Menu Desplegable	
	menuBtn = document.querySelector('nav .button');
	menuLst = document.querySelector('nav .menu');

	menuBtn.onclick = () => {
		/* condicion ? valor V : valor F */
		menuLst.classList.toggle('active') ? 
			menuBtn.innerHTML = '&times;' :
			menuBtn.innerHTML = '&equiv;' 
	}