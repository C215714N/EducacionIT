var camposForm = [
	'contactName',
	'contactLastname',
	'contactEmail',
	'contactTel',
	'contactConsult'
]

camposForm.map( campoForm => {
	document.getElementById(campoForm).addEventListener(
		'change', () => {
			if(document.getElementById(campoForm).checkValidity()){
				document.getElementById(campoForm).classList.add('is-valid')
				document.getElementById(campoForm).classList.remove('is-invalid')
			} else {
				document.getElementById(campoForm).classList.add('is-invalid')
				document.getElementById(campoForm).classList.remove('is-valid')	
			}
		}
	)
})