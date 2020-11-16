// galeria slide
	let galeria = document.querySelectorAll('.galeria li');
	//boton anterior
	document.querySelector('#prev').addEventListener(
		'click', () => {
			for(i = 0 ; i < galeria.length ; i++){
				if(galeria[i].classList.contains('active')){
					galeria[i].classList.remove('active');
					if(i > 0){
						nextItem = galeria[i - 1];
					} else{
						nextItem = galeria[galeria.length - 1]
					}
				}
			}
			nextItem.classList.add('active');
		}
	)
	//boton siguiente
	document.querySelector('#next').addEventListener(
		'click', () => {
			for(i = 0 ; i < galeria.length ; i++){
				if (galeria[i].classList.contains('active')){
					galeria[i].classList.remove('active');
					if(i < galeria.length - 1){
						nextItem = galeria[i + 1];
					} else {
						nextItem = galeria[0];
					}
				}
			}
			nextItem.classList.add('active');
		}
	)