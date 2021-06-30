/*Navigation*/
	menuBtn = document.querySelector('nav .btn')
	menuLst = document.querySelector('nav .menu')
	
	menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
/*Slide Gallery*/
	slideLst = document.querySelectorAll('.slide li')
	spanLst = document.querySelectorAll('.header span')
	prev = document.querySelector('#header .icon-prev')
	next = document.querySelector('#header .icon-next')

	prev.onclick = () => {changeItem(slideLst); changeItem(spanLst) }
	next.onclick = () => {changeItem(slideLst, true); changeItem(spanLst, true)}

	const changeItem = (itemList, type) => {
		for(i=0; i < itemList.length; i++){
			if(itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active')
				switch(type){
					case true:
						i < itemList.length - 1 ?
							newItem = itemList[i + 1] :
							newItem = itemList[0]
					break;
					default:
						i > 0 ?
							newItem = itemList[i - 1] :
							newItem = itemList[ itemList.length - 1]
			}	}	} newItem.classList.add('active')
	}