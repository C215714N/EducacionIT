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
//Consulta API Giphy
	async function fetchAPI(url, editArea, buildArea) {
		await fetch(url).then( resultado => resultado.json()
			.then( giphy => { giphy.data.forEach( item => { 
				if(item != ""){
					 editArea.innerHTML +=  buildArea(item)
				} else return null
	}	)	}	)	)	}
//Crear GIF
	gifBtn = document.querySelector('#createGif button');
	gifMedia = document.querySelector('#createGif article video');
	gifMediaOut = document.querySelector('#createGif article img');
	phase = 1;
	gifBtn.addEventListener(
		'click', () => {
			switch(phase){
				case 1:
					startGif()
					gifBtn.innerHTML = 'Grabar';
					phase = 2;
					break;
				case 2:
					recGif();
					gifBtn.innerHTML = 'Finalizar'
					phase = 3;
					break;
				case 3:
					stopGif()
					gifBtn.innerHTML = 'Subir'
					phase = 4;
					break;
				case 4:
					upGif()
					gifBtn.innerHTML = 'Comenzar'
					phase = 1
					break;
				default:
					gifBtn.innerHTML = 'Comenzar'
					phase = 1;
			}
		}
	)
	async function startGif() {
		const stream = await navigator.mediaDevices.getUserMedia({
			audio: false,
			video: { max: 480 }
		}	);
		gifMedia.srcObject = stream;
		await gifMedia.play();
	}
	async function recGif() {
		const stream = gifMedia.srcObject;
		videoRecorder = new RecordRTCPromisesHandler(stream, {
			type: "video",
			mimeType: "video/webm; codecs=vp8",
			disableLogs: true,
			videoBitsPerSecond: 128000,
			frameRate: 30,
			quality: 10,
			width: 480,
			hidden: 240
		});
		gifRecorder = new RecordRTCPromisesHandler(stream, {
			disableLogs: true,
			type: "gif",
			frameRate: 1,
			quality: 10,
			width: 360,
			hidden: 240
		});
		await videoRecorder.startRecording();
		await gifRecorder.startRecording();
		videoRecorder.stream = stream;
	}
	async function stopGif() {
		await videoRecorder.stopRecording();
		await gifRecorder.stopRecording();
		const videoBlob = await videoRecorder.getBlob();
		const gifBlob = await gifRecorder.getBlob();

		gifMedia.src = URL.createObjectURL(videoBlob);
		videoRecorder.stream.getTracks().forEach(t => t.stop());
		gifMedia.srcObject = null;

		// reset Recorder's state & clear the memory
		await videoRecorder.reset();
		await videoRecorder.destroy();
		await gifRecorder.reset();
		await gifRecorder.destroy();

		gifSrc = await gifBlob;
		gifMediaOut.src = URL.createObjectURL(await gifBlob);

		gifRecorder = null;
		videoRecorder = null;
	}

//constructorArea
	function showGifs(item){
		return (
			`<article>
				<video class="result" autoplay muted loop
					id="${item.id}"
					src="${item.images.fixed_height.mp4}" 
					alt="${item.title}">
				</video>
				<div class="hidden">
					<p>
						${item.username === undefined ? 'undefined': item.username}
						<br />
						<strong>${item.title === undefined ? 'unknown': item.title}</strong>
					</p>
					<div class="social">
						<button class="like">like</button>
						<button class="download">download</button>
						<button class="open">open</button>
					</div>
				<div>
			</article>`
	)	}
	function showOptions(item){
		return(
			`<option value="${item.name}">
				${item.name}
			</option>`
	)	}
//Acciones USUARIO
	resultVideo = document.querySelectorAll('.result');
	likeHit = document.querySelectorAll('.like');
	likeDown = document.querySelectorAll('.download');
	likeMax = document.querySelectorAll('.open');
	
	likeHit.forEach((btn,i) => btn.addEventListener('click', () => { alert('hiciste click en el item' + i)
	}	) 	)
//Elementos Populares
	trendArea = document.querySelector('#trending')
	trends = 'https://api.giphy.com/v1/gifs/trending?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&limit=3&rating=g'
	window.addEventListener( 'load', () =>  fetchAPI(trends, trendArea, showGifs)	)
//Resultados de Busqueda
	frmSearch = document.querySelector('#search')
	inputSearch = document.querySelector('#search input')
	gifsArea = document.querySelector('#results')
	pageArea = document.querySelector('#pagination')
	limit = 10
	offset = 0
	frmSearch.addEventListener( 'submit', (e) => {
		e.preventDefault()
		termino = inputSearch.value
		url = `https://api.giphy.com/v1/gifs/search?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&q=${termino}&limit=${limit>=1?limit:10}&offset=${offset=NaN?0:offset}&rating=g&lang=es`
		pageArea.innerHTML = ``
		gifsArea.innerHTML = ``
			fetchAPI(url, gifsArea, showGifs);
		}	)
//Sugerencias de Busqueda
	sugArea = document.querySelector('#search input')
	dataList = document.querySelector('#suggestion')
	optionList = []
	inputSearch.addEventListener(
		'input', (e) => {
			if(inputSearch.checkValidity()){
				url = `https://api.giphy.com/v1/tags/related/${inputSearch.value}?api_key=LanYkWCgNLIRDm6XZOZWnYH9yZHOProA&lang=es`;
				dataList.innerHTML = '';
				fetchAPI(url, dataList, showOptions);
	}	}	)	
	dataList.addEventListener(
		'click', () => {
			inputSearch.value = dataList.value 
			inputSearch.focus()
	}	)
