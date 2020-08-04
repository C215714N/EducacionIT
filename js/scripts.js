/*Menu desplegable*/
document.querySelector('#menu').addEventListener(
	'click', () => document.querySelector('.menu').classList.toggle('activado')
)
/*Abrir Formulario con Boton Flotante*/
document.querySelector('#contactButton').addEventListener(
	'click', () => document.querySelector('.modal').classList.add('modal-open')
)
/*Cerrar Formulario con Boton Absoluta*/
document.querySelector('#cerrarForm').addEventListener(
	'click', () => document.querySelector('.modal').classList.remove('modal-open')
)