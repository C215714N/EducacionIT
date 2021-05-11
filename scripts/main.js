// Navigation
	menuBtn = document.querySelector('nav .button')
	menuLst = document.querySelector('nav .menu')

	menuBtn.onclick = () => { 
		menuLst.classList.toggle('active') ? 
			menuBtn.innerHTML = '&times;' : 
			menuBtn.innerHTML = '&equiv;'
	}
// Gallery
	slideLst = document.querySelectorAll('#header .slide li')
	prev = document.querySelector('#header .icon-prev')
	next = document.querySelector('#header .icon-next')

	prev.onclick = () => changeItem(slideLst, false)
	next.onclick = () => changeItem(slideLst, true)

	const changeItem = (itemList, type) => {
		for(i = 0; i < itemList.length ; i++){
			if(itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active')
				switch(type){
					case true:
						// si type es true
						i < itemList.length - 1 ?
							newItem = itemList[i + 1] :
							newItem = itemList[0]
					break;
					default:
						// para todo lo demas
						i > 0 ?
							newItem = itemList[i - 1] :
							newItem = itemList[itemList.length - 1]
		}	}	}	newItem.classList.add('active')	
	}