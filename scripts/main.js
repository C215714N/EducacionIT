/*Declaraciones*/
	const d = document
	const menuBtn = d.querySelector('nav .btn')
	const menuLst = d.querySelector('nav .menu')
	const mapBtn = d.querySelector('.map .btn')
	const mapFrm = d.querySelector('.map iframe')
/*Menu Hamburguesa*/
	menuBtn.onclick = () => menuLst.classList.toggle('active')

/*Mapa de Contacto*/
	mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('icon-max','icon-min') : mapBtn.classList.replace('icon-min','icon-max')