/*Navigation*/
	menuBtn = document.querySelector('nav .button')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () =>	menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
/*Progress bar*/
	pBar = document.querySelector('.progress progress')
	pIn = document.querySelector('.progress input')

	pIn.addEventListener('input', () => pBar.value = pIn.value)
/*Images Gallery*/
	slideLst = document.querySelectorAll('#header li')
	spanLst = document.querySelectorAll('#header span')
	prev = document.querySelector('#header .icon-prev')
	next = document.querySelector('#header .icon-next')

	window.setInterval(() => next.click(), 15000)
	prev.onclick = () => {
		changeItem(slideLst, false); 
		changeItem(spanLst, false)	}
	next.onclick = () => {
		changeItem(slideLst, true); 
		changeItem(spanLst, true)	}

	const changeItem = (itemList, type) => {
		for (i = 0; i < itemList.length; i++){
			if (itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active')
				switch (type){
					case false:
						i > 0 ?
							newItem = itemList[i - 1] :
							newItem = itemList[ itemList.length - 1 ]
					break;
					default:
						i < itemList.length - 1 ?
							newItem = itemList[i + 1] :
							newItem = itemList[0]
		}	}	}	
		newItem.classList.add('active')
	}