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

/*Autor: Cristian Racedo*/