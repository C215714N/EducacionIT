//Maquetado Avanzado
	//Reproduccion VIDEO
		let playVideo = true
		document.querySelector('#videoControl').addEventListener(
			'click', () => {
				if (playVideo) {
					document.querySelector('#videoTag').play();
					playVideo = false;
					document.querySelector('#videoControl').innerHTML = 'pause';
				} else {
					document.querySelector('#videoTag').pause();
					playVideo = true;
					document.querySelector('#videoControl').innerHTML = 'play';
				}
			}
		)
	//Manipulacion PROGRESS
		document.querySelector('#pRange').addEventListener(
			'change', () =>	document.querySelector('#pTag').value = document.querySelector('#pRange').value
		)
	//Canvas
		let ctx = document.querySelector('#jsCanvas').getContext('2d');
		//Rectangulo Rojo
			ctx.fillStyle = 'tomato';
			ctx.fillRect(10, 10, 50, 50);
		//Circulo
			ctx.fillStyle = 'rgba(30, 80, 150, .5)';
			ctx.arc(60,60,25,25,100);
			ctx.fill()
//Autor: Cristian Racedo
