
/*Elemento Progress*/
	pBar = document.querySelector('.progress progress')
	pIn  = document.querySelector('.progress input')
	
	pIn.addEventListener('input', () => pBar.value = pIn.value)