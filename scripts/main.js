/*Maquetado Avanzado*/
	//Menu Desplegable
		let openMenu = true;
		document.querySelector('#menu').addEventListener(
			'click', () => {
				if (openMenu) {
					document.querySelector('.menu').classList.add('openMenu');
					document.querySelector('#menu').innerHTML = '&times;';
					openMenu = false;
				} else{
					document.querySelector('.menu').classList.remove('openMenu');
					document.querySelector('#menu').innerHTML = '&equiv;';
					openMenu = true;
				}
			}
		)
	//Reproduccion de contenido Multimedia
		let play = true;
		document.querySelector('#videoButton').addEventListener(
			'click' , () => {
				if (play) {
					document.querySelector('#videoTag').play();
					document.querySelector('#videoButton').innerHTML = "PAUSE";
					play = false;
				} else {
					document.querySelector('#videoTag').pause();
					document.querySelector('#videoButton').innerHTML = "PLAY";
					play = true;
				}
			}
		)
	//Manipulacion Barra de Progreso
		document.querySelector('#progressInput').addEventListener(
			'change', () => document.querySelector('#progressBar').value = document.querySelector('#progressInput').value
		)
	//Dibujando con Canvas
		let ctx = document.querySelector('#canvas').getContext('2d');
		//Circulo
			ctx.fillStyle = 'red';
			ctx.arc(60, 60, 50, 0, 2*Math.PI);
			ctx.fill();
		//Rectangulo
			ctx.fillStyle = 'rgba(0,0,255,.8)';
			ctx.fillRect(60, 60, 100, 100);
		//Texto
			ctx.fillStyle = 'black';
			ctx.font = '16px roboto';
			ctx.fillText('Canvas', 60, 180);
/*Autor: Cristian Racedo*/