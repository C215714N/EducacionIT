/* Progress */
	ProIn  = document.querySelector('#jsProgress input')
	ProBar = document.querySelector('#jsProgress progress')

	ProIn.addEventListener(	'input', () => ProBar.value = ProIn.value )