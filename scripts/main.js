// Declaraciones
	const d = document
	const pBar = d.querySelector('.progress progress')
	const pIn = d.querySelector('.progress input')

	pIn.oninput = () => pBar.value = pIn.value 