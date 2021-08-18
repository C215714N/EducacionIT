/*Navegacion Principal*/
	menuBtn = document.querySelector('nav .btn')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => menuLst.classList.toggle('active')