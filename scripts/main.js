//VARIABLES
	let slideList = document.querySelectorAll('.slide li');
	let sections = document.querySelectorAll('main section');
	let footers = document.querySelectorAll('main .preview');
	let backward = document.querySelectorAll('main .prev');
	let forward = document.querySelectorAll('main .next');
//GALERIA SLIDE
	document.querySelector('#header .prev').addEventListener(
		'click', () => changeItem(slideList, false)
	)
	document.querySelector('#header .next').addEventListener(
		'click', () => changeItem(slideList, true)
	)
//SECTION SLIDE
	backward.forEach( (prev , i) => { prev.addEventListener(
		'click', () => {
			changeItem(sections[i].querySelectorAll('article'), false)
			changeItem(footers[i].querySelectorAll('li'), false)
	}
	)})
	forward.forEach( (next , i) => { next.addEventListener(
		'click', () => {
			changeItem(sections[i].querySelectorAll('article'), true)
			changeItem(footers[i].querySelectorAll('li'), true)
	}
	)})
//FUNCION CAMBIAR
	function changeItem (itemList, type){
		for (i = 0 ; i < itemList.length ; i++){
			if(itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active');
			switch (type){
				case false:
					if(i > 0){ nextItem = itemList[i - 1]; }
					else{ nextItem = itemList[itemList.length - 1];	}
				default:
					if(i < itemList.length - 1){ nextItem = itemList[i + 1]; }
					else{ nextItem = itemList[0]; }	
		}	}	}
		nextItem.classList.add('active');
	}