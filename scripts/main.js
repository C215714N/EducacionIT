/*Declarations*/
	const d = document
	const pBar = d.querySelectorAll('.progress progress')
	const pIn  = d.querySelectorAll('.progress input') 

	pIn.forEach( (cmd,i) => cmd.addEventListener( 
		'input', () => pBar[i].value = cmd.value 
	)	)
/*Functions*/

