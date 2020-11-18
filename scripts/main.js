
/*Menu Hamburguesa*/
	document.querySelector('#menu').addEventListener(
		'click', () => {
			document.querySelector('.menu').classList.toggle('openMenu')
			if(document.querySelector('.menu').classList.contains('openMenu')){
				document.querySelector('#menu').innerHTML = '&times;';
			} else {
				document.querySelector('#menu').innerHTML = '&equiv;';
			}
		}
	);

/*videoSlide*/
	//PREV

	//PLAY
		let willPlay = true;
		document.querySelector('#vidPlay').addEventListener(
			'click', () => {
				if(willPlay){
					document.querySelector('video.active').play();
					document.querySelector('#vidPlay').innerHTML = 'PAUSE'
				}else {
					document.querySelector('video.active').pause();
					document.querySelector('#vidPlay').innerHTML = 'PLAY'
				}
				willPlay = !willPlay;
			}
		)
	//NEXT
