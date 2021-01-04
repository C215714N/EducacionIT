/* Constantes y Variables */
	//	URLs Conexion	
		const searchURL	= 'https://api.giphy.com/v1/gifs/search';
		const tagsURL	= 'https://api.giphy.com/v1/tags/related/'
		const trendURL 	= 'https://api.giphy.com/v1/gifs/trending';
		const uploadURL = 'https://upload.giphy.com/v1/gifs';
		const apiKey 	= 'LanYkWCgNLIRDm6XZOZWnYH9yZHOProA';
	// 	Parametros
		let url;
		let limit  = 3;
		let offset = 0;
		let total;
		let pages;
		let phase;
		let nextItem;
	// 	Areas Eventos
		const menuBtn	= document.querySelector('#menu');
		const menuList	= document.querySelector('.menu');
		
		const frmSearch	= document.querySelector('#search')
		const textField = document.querySelector('#search input')
		const dataList 	= document.querySelector('#suggestion')
		
		const titleArea = document.querySelector('section h1')
		const gifsArea 	= document.querySelector('#results')
		const pageArea 	= document.querySelector('#pagination')
		
		const trendArea = document.querySelector('#trending');
		const stageArea	= document.querySelectorAll('#createGif .menu li');
		
		const gifBtn 	= document.querySelector('#createGif button');
		const gifMedia 	= document.querySelector('#createGif article video');
		const gifView	= document.querySelector('#createGif article img');
		const recAgain	= document.querySelector('#createGif .menu a') 
/* Funciones y Metodos*/
	//	Menu hamburguesa
		menuBtn.addEventListener( 'click', () => { 
			menuList.classList.toggle('open');
			menuList.classList.contains('open')? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;';
		}	)
	// Rutas 

	//	Consulta API Giphy
		async function fetchAPI(url, editArea, buildArea) { 
			await fetch(url)
				.then( resultado => resultado.json()
				.then( async giphy => { 
					giphy.pagination ? total = giphy.pagination.total_count : null;
					giphy.data.forEach( item => editArea.innerHTML += buildArea(item) )
					searchResult(url, total);
		}	)	)	}
	//	Definicion Cookies
		function setCookie(cname, cvalue, extday){
			sameSite = lax;
			document.cookie += `${cname} = ${cvalue} ; ${extday} ; path = ${cvalue}` 
		}
	//	Gifs Mas Populares
		window.addEventListener( 'load', () => { 
			url = `${trendURL}?api_key=${apiKey}&limit=${limit}&rating=g`;
			fetchAPI(url, trendArea, showGifs);
		}	)
	//	Creacion de Gifs
		recAgain.addEventListener( 'click', () => {
			phase = 1;
			setPhase(false);
		}	)
		gifBtn.addEventListener( 'click', () => {
			phase < 4 ? phase = phase + 1: phase = 1;
			setPhase(true);
		}	)
		// Funciones asincronas
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
				gifView.src = URL.createObjectURL(await gifBlob);

				gifRecorder = null;
				videoRecorder = null;
			}
			async function uploadGif() {
				console.log("***comenzando subida***");
				const formData = new FormData();
				formData.append("file", gifSrc, "myGif.gif");
					const params = {
						method: "POST",
						body: formData,
						json: true
				};
				const data = await fetchURL(`${uploadURL}?api_key=${apiKey}`, params);
				console.log(await data);
				console.log("***subida exitosa***");
				return await data;
			}
			async function fetchURL(url, params = null) {
				try {
					const fetchData = await fetch(url, params);
					const response = await fetchData.json();
					return response;
				} catch (error) {
					if (error.name !== "AbortError") {
						console.log("Error al obtener resultados");
					}
					return error;
				}
			}
	//	Constructores Areas
		function showGifs(item){ return (
			`<article>
					<img class="result" autoplay muted loop
						id="${item.id}"
						src="${item.images.fixed_height_downsampled.webp}" 
						alt="${item.title}"
					/>
					<div class="hidden">
						<p>
							${item.username ? item.username : 'undefined'}
							<br />
							<strong>${item.title ? item.title : 'unknown'}</strong>
						</p>
						<div class="social">
							<a class="icon fav"></a>
							<a class="icon download"></a>
							<a class="icon max"></a>
						</div>
					<div>
				</article>`
		)	}
		function showOptions(item) { return (
			`<option value="${item.name}">
				${item.name}
			</option>`
		)	}
		function setPhase(type){
			switch(phase){
				case 1:
					startGif();	
					gifBtn.innerHTML = 'Grabar';
					gifMedia.classList.add('show'); 
					gifView.classList.remove('show'); 
					break;
				case 2:
					recGif(); 
					gifBtn.innerHTML = 'Finalizar';
					recAgain.innerHTML = `00:00`;
					break;
				case 3:
					stopGif(); 
					gifBtn.innerHTML = 'Subir';
					gifMedia.classList.toggle('show');
					gifView.classList.toggle('show');
					recAgain.innerHTML = `Repetir Captura`
					break;
				case 4:
					question = confirm('¿deseas subir el GIF?')
						question? uploadGif(): null 		
						gifBtn.innerHTML = 'Comenzar'
						gifMedia.classList.toggle('show'); 
						gifView.classList.toggle('show'); 
						phase = 1;
						type = false;
					break;
			}
			stageArea[phase - 1].classList.add('active')
			switch (type){
				case true:
					phase > 1 ? stageArea[phase - 2].classList.remove('active') : null
					break;
				case false:
					for(i = 0 ; i < stageArea.length; i++){
						stageArea[i].classList.remove('active');
					}
					stageArea[phase - 1].classList.add('active');
					break;
			}
		}
		function searchResult(url, total){
			if (url.includes('search') && total >= 1) { 
				pageArea.innerHTML =
					`<ul>
						<li><strong>Imagenes </strong> ${total}</li>
						<li><strong>Paginas </strong> ${pages = Math.ceil(total / 12)}</li>
						<li>
							<strong>Actual </strong>  
							${ ( actual = (offset / 12) + 1 ) <= pages ? actual : pages }
						</li>
						<li>
							<strong>Restantes </strong> 
							${ ( rest = pages - actual ) >= 0 ? rest : 0 }
						</li>
					</ul>
					<button class="button">
						${ offset + limit <= total ? `VER MAS...`: `NO HAY MAS RESULTADOS` }
					</button>`

			} else if (url.includes('search')){
				pageArea.innerHTML =
					`<img src="assets/icons/icon_no_results.svg" alt="ouch">
					<p class="notFound">intenta con otra busqueda</p>`
			}
		}
	//	Acciones USUARIO
		resultVideo = document.querySelectorAll('.result');
		likeHit = document.querySelectorAll('.like');
		downHit = document.querySelectorAll('.download');
		openHit = document.querySelectorAll('.open');
		
		likeHit.forEach( like => like.addEventListener(
			'click', () => alert('vas a dar like')
		))
		downHit.forEach( down => down.addEventListener(
			'click', () => alert('vas a descargar')
		))
		openHit.forEach( open => open.addEventListener(
			'click', () => alert('vas a maximizar')
		))
	//	Sugerencias de Busqueda
		textField.addEventListener(
			'input', () => {
				if(textField.checkValidity()){
					termino = textField.value;
					url = `${tagsURL}${termino}?api_key=${apiKey}&lang=es`;
					dataList.innerHTML = '';
					fetchAPI(url, dataList, showOptions);
		}	}	)	
		dataList.addEventListener(
			'click', () => {
				textField.value = dataList.value 
				textField.focus()
		}	)
	//	Resultados Busqueda
		frmSearch.addEventListener( 'submit', (e) => {
			e.preventDefault();
			limit = 12;
			offset = 0;
			termino = textField.value;
			url = `${searchURL}?api_key=${apiKey}&q=${termino}&limit=${limit}&offset=${offset}&rating=g&lang=es`
			gifsArea.innerHTML = ``;
			fetchAPI(url, gifsArea, showGifs);
			titleArea.innerHTML = termino;
		}	)
	//	Mas paginas
		pageArea.onsubmit =  (e) => {
			e.preventDefault();
			offset = offset + 12;
			url = `${searchURL}?api_key=${apiKey}&q=${termino}&limit=${limit}&offset=${offset}&rating=g&lang=es`
			fetchAPI(url, gifsArea, showGifs);

		}
