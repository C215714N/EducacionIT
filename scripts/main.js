/* navigation Bar */
	let menuBtn = document.querySelector('nav .button');
	let menuLst = document.querySelector('nav .menu');

	menuBtn.onclick = () => {
		menuLst.classList.toggle('active') ? 
			menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
	}

/* gallery slide */
	let btnPrev = document.querySelector('main .icon-prev')
	let btnNext = document.querySelector('main .icon-next')
	let slideList = document.querySelectorAll('.slide li')
	let slideSpan = document.querySelectorAll('.slide span')
	/* eventos */
	btnPrev.onclick = () => { 
		changeItem(slideList, false)
		changeItem(slideSpan, false)
	}
	btnNext.onclick = () => { 
		changeItem(slideList, true)
		changeItem(slideSpan, true)
	}
	/* funcion de busqueda*/
		function changeItem(itemList, type) {
			for(i = 0; i < itemList.length; i++){
				if(itemList[i].classList.contains('active')){
					itemList[i].classList.remove('active')
					switch(type){
						case true:
							i < itemList.length - 1 ?
								nextItem = itemList[i + 1] :
								nextItem = itemList[0]
						break;
						case false:
							i > 0 ? 
								nextItem = itemList[i - 1] :
								nextItem = itemList[itemList.length - 1]
						break;
			}	}	} 	nextItem.classList.add('active');
		}