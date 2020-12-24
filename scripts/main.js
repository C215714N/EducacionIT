//Menu hamburguesa
	btnMenu = document.querySelector('#menu');
	ulMenu = document.querySelector('.menu');
	btnMenu.addEventListener(
		'click', () => { ulMenu.classList.toggle('open')
			if(ulMenu.classList.contains('open')){
				btnMenu.innerHTML = '&times;';
			} else {
				btnMenu.innerHTML = '&equiv;';
	}	}	)
//Elementos Populares
	trendingArea = document.querySelector('#trending')
	url = 'https://api.giphy.com/v1/gifs/trending?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&limit=3&rating=g'
	window.addEventListener( 'load', () => {	
		fetch(url).then( resultado => resultado.json()
			.then( giphy => { giphy.data.forEach( item => { trendingArea.innerHTML +=  
				`<article>
					<video autoplay muted loop
						src="${item.images.fixed_height.mp4}" 
						alt="${item.title}">
					</video>
						<div class="hidden">
							<div class="social">
								<button>Link</button>
								<button>Like</button>
								<button>Share</button>
							</div>
							<p>
								${item.username === undefined ? 'undefined': item.username}
								<br />
								<strong>${item.title === undefined ? 'unknown': item.title}</strong>
							</p>
						<div>
				</article>`
	}	)	}	)	)	}	)
//Resultados de Busqueda
	btnSearch = document.querySelector('#search')
	inputSearch = document.querySelector('#search input')
	gifsArea = document.querySelector('#results')
	pageArea = document.querySelector('#pagination')
	limit = 10
	offset = 0
	btnSearch.addEventListener( 'submit', (e) => {
		e.preventDefault()
		termino = inputSearch.value
		url = `https://api.giphy.com/v1/gifs/search?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&q=${termino}&limit=${limit>=1?limit:10}&offset=${offset=NaN?0:offset}&rating=g&lang=es`
		pageArea.innerHTML = ``
		gifsArea.innerHTML = ``
			fetch(url).then( resultado => resultado.json()
				.then( giphy => { giphy.data.forEach( item => { 
					if(item != ""){
						gifsArea.innerHTML +=  
						`<article>
							<video autoplay muted loop
								src="${item.images.fixed_height.mp4}" 
								alt="${item.title}">
							</video>
							<div class="hidden">
								<p>
									${item.username === undefined ? 'undefined': item.username}
									<br />
									<strong>${item.title === undefined ? 'unknown': item.title}</strong>
								</p>
							<div>
						</article>`
					} else return null
	}	)	}	)	)	}	)
//Sugerencias de Busqueda
	sugArea = document.querySelector('#search input')
	dataList = document.querySelector('#suggestion')
	optionList = []
	inputSearch.addEventListener(
		'input', (e) => {
			if(inputSearch.checkValidity()){
				url = `https://api.giphy.com/v1/tags/related/${inputSearch.value}?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&lang=es`
				dataList.innerHTML = ''
				fetch(url).then( resultado => resultado.json()
					.then( giphy => { giphy.data.forEach( item => {
						dataList.innerHTML +=  
							`<option value="${item.name}">
								${item.name}
							</option>`
	}	)	}	)	)	}	}	)
	dataList.addEventListener(
		'click', () => {
			inputSearch.value = dataList.value 
			inputSearch.focus()
	}	)