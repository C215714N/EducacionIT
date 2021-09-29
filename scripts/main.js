/*Declarations*/
	const d = document
	const menuBtn = d.querySelector('nav .btn')
	const menuLst = d.querySelector('nav .menu')
	const pBar = d.querySelectorAll('.progress progress')
	const pIn  = d.querySelectorAll('.progress input') 
	const slideLst = d.querySelectorAll('.slide li')
	const prev = d.querySelector('.icon-prev')
	const next = d.querySelector('.icon-next')

// Navigation Bar
	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'

// Progress Bar
	pIn.forEach( (cmd,i) => cmd.addEventListener( 
		'input', () => pBar[i].value = cmd.value 
	)	)
/*Gallery*/
	prev.onclick = () => changeItem(slideLst)
	next.onclick = () => changeItem(slideLst)

	const changeItem = (array, type, className = 'active') => {
		for(i = 0; i < array.length; i++){
			if(array[i].classList.contains(className)){
				getDir('encontrado');
			}
		}
	}
	const getDir = (type) => {
		alert(type);
	}