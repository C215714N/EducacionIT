/*MENU PRINCIPAL*/
	document.querySelector('#menu').addEventListener(
		'click', () => {
			document.querySelector('nav .menu').classList.toggle('active')
			if(document.querySelector('nav .menu').classList.contains('active')){
				document.querySelector('#menu').innerHTML = '&times;';
			}else{
				document.querySelector('#menu').innerHTML = '&equiv;';
			}
		}
	)
/* VIDEOS */
	//VARIABLES
		position = 0;
		videoItem = document.querySelector('.example video');
		videoList = [
			'assets/media/californication.mp4',
			'assets/media/by-the-way.ogv',
			'assets/media/cant-stop.webm'
		];	
	//FUNCION RUTAS
		function changePath (){
			switch(type){
				case 'prev':
					if(i > 0){  }
					else{  }
					break;
				case 'next':
					if(i < itemList.length - 1){  }
					else{  }	
					break;
				default: itemList[i];
			}
		}
	//BOTON ANTERIOR
		document.querySelector('#vidPrev').addEventListener(
			'click', () =>
		)
		document.querySelector('#vidPlay').addEventListener(
			'click', () => 
		)
		document.querySelector('#vidNext').addEventListener(
			'click', () => 
		)
/*Cambio de Temas*/
	//VARIABLES
		let slideList = document.querySelectorAll('.slide li');
		let sectionList = document.querySelectorAll('main section');
		let footerList = document.querySelectorAll('main .preview');
	//FUNCION CAMBIAR
		function changeItem (itemList, type){
			for (i = 0 ; i < itemList.length ; i++){
				if(itemList[i].classList.contains('active')){
					itemList[i].classList.remove('active');
				switch (type){
					case false:
						if(i > 0){ nextItem = itemList[i - 1]; }
						else{ nextItem = itemList[itemList.length - 1];	}
						break;
					case true:
						if(i < itemList.length - 1){ nextItem = itemList[i + 1]; }
						else{ nextItem = itemList[0]; }	
						break;
			}	}	}
			nextItem.classList.add('active');
		}
	//GALERIA SLIDE
		document.querySelector('#header .prev').addEventListener(
			'click', () => changeItem(slideList, false)
		)
		document.querySelector('#header .next').addEventListener(
			'click', () => changeItem(slideList, true)
		)
	//SECTION SLIDE
		document.querySelectorAll('main .prev').forEach( (prev , i) => { prev.addEventListener(
			'click', () => {
				changeItem(sectionList[i].querySelectorAll('article'), false)
				changeItem(footerList[i].querySelectorAll('li'), false)
		}
		)})
		document.querySelectorAll('main .next').forEach( (next , i) => { next.addEventListener(
			'click', () => {
				changeItem(sectionList[i].querySelectorAll('article'), true)
				changeItem(footerList[i].querySelectorAll('li'), true)
		}
		)})
	

