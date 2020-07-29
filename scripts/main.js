//Maquetado Avanzado
	//Menu Desplegable
		let mostrar = true;
		document.querySelector('#menu').addEventListener(
			'click', () => {
				document.querySelector('.menu').classList.toggle('show')
				if (mostrar) {
					document.querySelector('#menu').innerHTML = '&times;'
					mostrar = false;
				} else {
					document.querySelector('#menu').innerHTML = '&equiv;'
					mostrar = true;
				}
			}
		)
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
			ctx.fillRect(10, 10, 50, 50); //(x, y, width, height)
		//Circulo
			ctx.fillStyle = 'rgba(30, 80, 150, .5)';
			ctx.arc(60,60,25,25,100);//(x, y, rWidth, rHeight, arc)
			ctx.fill();
		//Texto
			ctx.font = '16px arial';
			ctx.strokeText('Canvas', 10, 100); //(Text, x, y)
	//Rango de Formulario
		document.querySelector('#contactRange').addEventListener(
			'change', () => {
				document.querySelector('#rValue span').innerHTML = document.querySelector('#contactRange').value
			}
		)
//Autor: Cristian Racedo
