/*menu hamburguesa*/
	let btnMenu = document.querySelector('#menu');
	let ulMenu = document.querySelector('.menu');
	
	btnMenu.addEventListener(
		'click', () => {
			ulMenu.classList.toggle('openMenu');
			if(ulMenu.classList.contains('openMenu')){
				btnMenu.innerHTML = '&times;'
			}else{
				btnMenu.innerHTML = '&equiv;'
			}
		}
	)
/*Manipulacion elemento Progress*/
	let pBar = document.querySelector('#pBar');
	let pIn = document.querySelector('#pIn');

	pIn.addEventListener(
		'input', () => pBar.value = pIn.value
	)
/*Canvas*/
	let ctx = document.querySelector('#jsCanvas').getContext('2d');
	//Rectangulo
		ctx.fillStyle = "#248";
		ctx.fillRect(50,50,100,100);/*x, y, w, h*/
	//Circulo
		ctx.fillStyle = "rgba(192, 32, 64, .5)";
		ctx.arc(150,150, 50, 0, 2*Math.PI);
		ctx.fill();
/*Galeria Slide*/
	prev = document.querySelector('#prevSlide');
	next = document.querySelector('#nextSlide');
	itemList = document.querySelectorAll('#header .slide li');

	prev.addEventListener( 'click', () => {
		for(i = 0 ; i < itemList.length ; i++){
			if(itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active');
				if(i > 0){
					prevItem = itemList[i - 1]
				} else {
					prevItem = itemList[ itemList.length - 1 ]
				}
			}
		}
		prevItem.classList.add('active');
	})
	next.addEventListener( 'click', () => {
		for(i = 0; i < itemList.length; i++){
			if(itemList[i].classList.contains('active')){
				itemList[i].classList.remove('active');
				if(i < itemList.length - 1){
					nextItem = itemList[i + 1]
				} else {
					nextItem = itemList[0];
				}
			}
		}
		nextItem.classList.add('active');
	});
