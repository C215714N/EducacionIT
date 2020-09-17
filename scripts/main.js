/*Responsive Web Design*/
	/*Menu Responsive*/
		let openMenu = true;
		document.querySelector('#menu').addEventListener(
			'click', () => {
				if(openMenu){
					document.querySelector('.menu').classList.add('openMenu');
					document.querySelector('#menu').innerHTML = '&times;'
					openMenu = false; 
				} else{
					document.querySelector('.menu').classList.remove('openMenu');
					document.querySelector('#menu').innerHTML = '&equiv;'
					openMenu = true;
				}
			}
		);
/*Autor: Cristian Racedo*/