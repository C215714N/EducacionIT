/*Navigation*/
	menuBtn = document.querySelector('nav .btn')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => menuLst.classList.toggle('active') 
/* Progress Bar */
	pBar = document.querySelector('.progress progress')
	pIn  = document.querySelector('.progress input')

	pIn.addEventListener('input', () => pBar.value = pIn.value )