icons = 'assets/icons'
//Menu hamburguesa
	btnMenu = document.querySelector('#menu');
	ulMenu = document.querySelector('.menu');
	btnMenu.addEventListener(
		'click', () => { ulMenu.classList.toggle('open')
			if(ulMenu.classList.contains('open')){
				btnMenu.style.backgroundImage = `url(${icons}/close.svg)`;
			} else {
				btnMenu.style.backgroundImage = `url(${icons}/burger.svg)`;
	}	}	)
//Gif Populares
	trendingArea = document.querySelector('#trending')
	url = 'https://api.giphy.com/v1/gifs/trending?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&limit=3&rating=g'
	window.addEventListener( 'load', () => {	
		fetch(url).then( resultado => resultado.json()
			.then( giphy => { giphy.data.forEach( item => { trendingArea.innerHTML +=  
				`<article>
					<video autoplay muted loop
						key="${item.id}"
						src="${item.images.downsized_small.mp4}" 
						alt="${item.title}">
					</video>
				</article>`
	}	)	}	)	)	}	)
//Resultados de Busqueda
	gifsArea = document.querySelector('#results')
	btnSearch = document.querySelector('#search')
	inputSearch = document.querySelector('#search input')
	limit = 10
	offset = 0
	btnSearch.addEventListener( 'submit', (e) => {
		e.preventDefault()
		termino = inputSearch.value
		url = `https://api.giphy.com/v1/gifs/search?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&q=${termino}&limit=${limit>=1?limit:10}&offset=${offset=NaN?0:offset}&rating=g&lang=es`
		gifsArea.innerHTML = ``
			fetch(url).then( resultado => resultado.json()
				.then( giphy => { giphy.data.forEach( item => { 
					gifsArea.innerHTML +=  
					`<article>
						<video autoplay muted loop
							key="${item.id}"
							src="${item.images.downsized_small.mp4}" 
							alt="${item.title}">
						</video>
					</article>`
	}	)	}	)	)	}	)