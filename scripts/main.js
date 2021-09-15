/*Declarations*/
	const d = document
	const menuBtn = d.querySelector('nav .btn')
	const menuLst = d.querySelector('nav .menu')
	const pBar = d.querySelectorAll('.progress progress')
	const pIn  = d.querySelectorAll('.progress input') 

// Navigation Bar
	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'

// Progress Bar
	pIn.forEach( (cmd,i) => cmd.addEventListener( 
		'input', () => pBar[i].value = cmd.value 
	)	)
/*Functions*/

