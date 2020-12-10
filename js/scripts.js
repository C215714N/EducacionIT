/* Menu Hamburguesa */
	let btnMenu = document.querySelector('#menu');
	let ulMenu = document.querySelector('nav .menu');
	btnMenu.addEventListener(
		'click', () => {
			ulMenu.classList.toggle('open');
			if(ulMenu.classList.contains('open')){
				btnMenu.innerHTML = '&times;'
			}else{
				btnMenu.innerHTML = '&equiv;'
			}
		}
	);
/* Galeria Slide */
	let prev = document.querySelector('#header .prev');
	let next = document.querySelector('#header .next');
	let itemList = document.querySelectorAll('.slide li');

	/* SIGUIENTE */
		next.addEventListener(
			'click', () => {
				for(i = 0 ; i < itemList.length ; i++){
					if(itemList[i].classList.contains('active')){
						itemList[i].classList.remove('active')
						if(i < itemList.length - 1){
							nextItem = itemList[i + 1];
						}else{
							nextItem = itemList[0];
						}
					}
				}
				nextItem.classList.add('active');
			}
		)
		prev.addEventListener(
			'click', () => {
				for(i = 0 ; i < itemList.length ; i ++){
					if(itemList[i].classList.contains('active')){
						itemList[i].classList.remove('active');
						if(i > 0){
							nextItem = itemList[i - 1];
						}else{
							nextItem = itemList[itemList.length - 1];
						}
					}
				}
				nextItem.classList.add('active');
			}
		)