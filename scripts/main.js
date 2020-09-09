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
/*Autor: Cristian Racedo*/