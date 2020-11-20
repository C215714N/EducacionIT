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
/*Galeria Slide*/
	//PREV
		let itemList = document.querySelectorAll('.slide li');
		document.querySelector('#prev').addEventListener(
			'click', () => {
				for (i = 0 ; i < itemList.length ; i++){
					if (itemList[i].classList.contains('active')){
						itemList[i].classList.remove('active');
						if (i > 0){
							nextItem = itemList[i - 1];
						} else {
							nextItem = itemList[itemList.length - 1];
						}
					}
				}
				nextItem.classList.add('active');
			}
		);
	//NEXT
		document.querySelector('#next').addEventListener(
			'click', () => {
				for (i = 0 ; i < itemList.length ; i++){
					if (itemList[i].classList.contains('active')){
						itemList[i].classList.remove('active');
						if (i < itemList.length - 1){
							nextItem = itemList[i + 1];
						} else {
							nextItem = itemList[0];
						}
					}
				}
				nextItem.classList.add('active');
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
/*ProgressBar*/
	document.querySelector('#pInput').addEventListener(
		'input', () => document.querySelector('#pBar').value = document.querySelector('#pInput').value
	);
/*Canvas*/
	let ctx = document.querySelector('#canDraw').getContext('2d');
	//rectangulo
		ctx.fillStyle = "#248";
		ctx.fillRect(50,50,100,100); //x y width height
	//circulo
		ctx.fillStyle = "rgba(240,32,64,.5)";
		ctx.arc(150, 150, 50, 0, 2*Math.PI); //cx, cy, r, start, end
		ctx.fill();
	//poligono
		ctx.fillStyle = "rgba(32,240,64,.5)";
		ctx.beginPath();
		ctx.moveTo(150,50);
		ctx.lineTo(150,150);
		ctx.lineTo(250, 100);
		ctx.fill();
	//texto
		ctx.font = "20px sans-serif";
		ctx.strokeText("JavaScript Bitmap", 50, 250);
/*Range input*/
	document.querySelector('#contactAge').addEventListener(
		'input', () => {
			document.querySelector('#contactAgeLbl span'). innerHTML = document.querySelector('#contactAge').value
			
		}
	);