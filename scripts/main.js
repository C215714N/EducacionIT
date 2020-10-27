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
					document.querySelector('#videoControl').innerHTML = 'PAUSE';
				} else {
					document.querySelector('#videoTag').pause();
					playVideo = true;
					document.querySelector('#videoControl').innerHTML = 'PLAY';
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
		//Poligono
			ctx.beginPath()
			ctx.moveTo(0,100);
			ctx.lineTo(100, 100);
			ctx.lineTo(100,0);
			ctx.closePath();
			ctx.fill();
		//Texto
			ctx.font = '16px arial';
			ctx.strokeText('Canvas', 10, 100); //(Text, x, y)
	//Rango de Formulario
		document.querySelector('#contactRange').addEventListener(
			'change', () => {
				document.querySelector('#rValue span').innerHTML = document.querySelector('#contactRange').value
				if(document.querySelector('#contactRange').value < 18){
					document.querySelector('#contactRange + .validate').style.color = 'darkred';
					document.querySelector('#contactRange + .validate').style.backgroundColor = 'tomato';
				}else{
					document.querySelector('#contactRange + .validate').style.color = 'darkgreen';
					document.querySelector('#contactRange + .validate').style.backgroundColor = 'limegreen';
				}
			}
		)
//Autor: Cristian Racedo
