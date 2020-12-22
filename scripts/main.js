icons = 'assets/icons'
btnMenu = document.querySelector('#menu');
ulMenu = document.querySelector('.menu');

//Menu hamburguesa
	btnMenu.addEventListener(
		'click', () => { ulMenu.classList.toggle('open')
			if(ulMenu.classList.contains('open')){
				btnMenu.style.backgroundImage = `url(${icons}/close.svg)`;
			} else {
				btnMenu.style.backgroundImage = `url(${icons}/burger.svg)`;
	}	}	)
//Gif Populares
	let trending = []
	const trendArea = document.querySelector('#trending')
	const url = 'https://api.giphy.com/v1/gifs/trending?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&limit=3&rating=g'
	window.addEventListener(
		'load', () =>{
			fetch(url).then( resultado => resultado.json().then( giphy => {
				trending = giphy.data;
				trending.forEach(
					item => {
					trendArea.innerHTML +=  
					`<section>
						<video autoplay muted loop
							key="${item.id}"
							src="${item.images.downsized_small.mp4}" 
							alt="${item.title}">
						</video>
					</section>`
					}
					)
				}))})