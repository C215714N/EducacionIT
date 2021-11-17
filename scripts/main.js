/* Declaraciones */
	const d = document
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')
/* Progress Bar */
	pIn.addEventListener('input',() => pBar.value = pIn.value)