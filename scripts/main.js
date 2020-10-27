/*Maquetado Avanzado*/
	//Manipulacion Elemento Progress
		document.querySelector('#pIn').addEventListener(
			'input', () => document.querySelector('#pBar').value = document.querySelector('#pIn').value
		);
	//Reproduccion Multimedia
		let playVid = true;
		document.querySelector('#vidPlay').addEventListener(
			'click', () => {
				if (playVid) {
					document.querySelector('#vidStart').play();
					document.querySelector('#vidPlay').innerHTML = 'PAUSE';
					playVid = false;
				} else {
					document.querySelector('#vidStart').pause();
					document.querySelector('#vidPlay').innerHTML = 'PLAY';
					playVid = true;
				}
			}
		)
	//Elemento Canvas
		let ctx = document.querySelector('#jsCanvas').getContext('2d');
		//Rectangulo
			ctx.fillStyle = '#248';
			ctx.fillRect(50,50,100,100); /*x, y, w, h*/
		//Circulo
			ctx.fillStyle = 'rgba(200,30,60,.5)';
			ctx.arc(150, 150, 50, 0, 2*Math.PI);/*x, y, r, start, end*/
			ctx.fill();
		//Triangulo
			ctx.beginPath();
				ctx.fillStyle = 'rgba(100,100,20,.5)';
				ctx.moveTo(150, 50);
				ctx.lineTo(100, 125);
				ctx.lineTo(200, 125);
				ctx.lineTo(150,50)
				ctx.fill();
			ctx.closePath();
		//Texto
			ctx.font = "16px century gothic";
			ctx.strokeText('JavaScript Canvas', 50, 250);
	//Menu Hamburguesa
		let openMenu = true;
		document.querySelector('#menu').addEventListener(
			'click', () => {
				if(openMenu){
					document.querySelector('.menu').classList.add('openMenu');
					document.querySelector('#menu').innerHTML = '&times;';
					openMenu = false;
				} else {
					document.querySelector('.menu').classList.remove('openMenu');
					document.querySelector('#menu').innerHTML = '&equiv;';
					openMenu = true;
				}
			}
		)
/*Autor: Cristian Racedo*/