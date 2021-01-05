/*	Constantes y Variables	*/
	//	URLs Conexion	
		const searchURL	= 'https://api.giphy.com/v1/gifs/search';
		const tagsURL	= 'https://api.giphy.com/v1/tags/related/'
		const trendURL 	= 'https://api.giphy.com/v1/gifs/trending';
		const uploadURL = 'https://upload.giphy.com/v1/gifs';
		const apiKey 	= 'LanYkWCgNLIRDm6XZOZWnYH9yZHOProA';
	// 	Parametros
		let url, limit  = 3, offset = 0;
		let total, pages, msg = 'favs';
		let m = 0, s = 0;
		let phase, nextItem;
		let likeHit, downHit, openHit;
/*	Areas de Eventos	*/
	//	Barra de Navegacion
		const menuBtn	= document.querySelector('#menu');
		const menuList	= document.querySelector('.menu');
		const menuItem	= document.querySelectorAll('.menu li');
	//	Formulario de Busqueda
		const frmSearch	= document.querySelector('#search')
		const textField = document.querySelector('#search input')
		const dataList 	= document.querySelector('#suggestion')
	//	Area de Resultados
		const titleArea = document.querySelector('section h1')
		const gifsArea 	= document.querySelector('#results')
		const pageArea 	= document.querySelector('#pagination')
		const trendArea = document.querySelector('#trending');
	//	Seccion de Grabacion
		const stageArea	= document.querySelectorAll('#crear_gifo .menu li');
		const gifBtn 	= document.querySelector('#crear_gifo button');
		const gifMedia 	= document.querySelector('#crear_gifo article video');
		const gifView	= document.querySelector('#crear_gifo article img');
		const recAgain	= document.querySelector('#crear_gifo .menu a');
	//	Seccion de Favoritos
		const favArea 	= document.querySelector('#favoritos div');
		const noFavs 	= document.querySelector('#favoritos .noItems')
/*	Funciones y Metodos	*/
	//	Consulta API Giphy
		async function fetchAPI(url, editArea, buildArea, type = true) { 
			await fetch(url)
				.then( resultado => resultado.json()
				.then( async giphy => { 
					giphy.pagination ? total = giphy.pagination.total_count : null;
					giphy.data.forEach( item => editArea.innerHTML += buildArea(item, type) )
					showPages(url, total);
					getItems();
					favLoad();
		}	)	)	};
	//	Constructores
		//	Resultados de Busqueda
			const showGifs = (item, type) => (
				`<article 
					id="${type ? item.id : 'fav_'+ item.id}" 
					class="${ type ? 'result' : 'favorite'}">
					<img class="${ type ? 'result' : 'favorite'}" 
						src="${ type ? item.images.fixed_height_downsampled.webp : item.img }" 
						alt="${ item.title }"
						title="${ item.username }"
					ismap />
					${showActions(item, type)}
				</article>`
			);
			const showActions = (item, type) => (
				`<div class="hidden">
					<p>
						${item.username ? item.username : 'anonymous'}
						<br />
						<strong>${item.title ? item.title : 'untitled'}</strong>
					</p>
					<div class="social">
						<a class="icon fav ${ !type ? 'active' : ''}"></a>
						<a href="${ item.img ? item.img : item.images.fixed_height_downsampled.webp }" class="icon download" target="_blank" download></a>
						<a class="icon max"></a>
					</div>
				</div>`
			)
			const showPages = (url, total) => {
				if (url.includes('search') && total >= 1) { 
					pageArea.innerHTML =
						`<ul>
							<li>
								<strong>Resultados</strong> 
								${total}
								</li>
							<li>
								<strong>Paginas</strong> 
								${ ( actual = (offset / 12) + 1 ) <= (pages = Math.ceil(total / 12)) ? actual : pages } 
								/ ${ pages }
							</li>
						</ul>
						<button class="button">
							${ offset + limit <= total ? `VER MAS...`: `NO HAY MAS RESULTADOS` }
						</button>`
				} else if (url.includes('search')){
					noResults(pageArea, 'results');
				}
			}
		//	Consejos y Sugerencias
			const showOptions = (item) => (
				`<option value="${item.name}">
					${item.name}
				</option>`
			);	
			const noResults = (editArea, icon) =>{
				let msg;
				switch(icon){
					case 'favs': 
						msg = `"¡guarda tu primer Gifo en favoritos <br/> para que se muestre aqui!"`; 
					break;
					case 'results': 
						msg = `"intenta con otra busqueda"`; 
					break; 
					case 'gifs': 
						msg = `"Animate a crear tu primer GIFO"`; 
					break;
				}
				editArea.innerHTML = `
					<img src="assets/icons/section_no_${icon}.svg" alt="ouch">
					<p class="notFound special">${msg}</p>`
			}
		//	Cronometro
			const timeStart = () => {
				clock();
				recTime = setInterval( clock , 999 );
			}
			const clock = () => {
			    var mAux, sAux;
			    s++;
			    if(s > 59){ m++; s=0 }
			    s < 10 ? sAux = "0" + s : sAux=s;
			    m < 10 ? mAux = "0" + m : mAux=m;
			    recAgain.innerHTML = `${mAux}:${sAux}`
			}
			const timeStop = () => {
				clearInterval(recTime);
				m = 0; s = 0;
			    recAgain.innerHTML = `Repetir Captura`
			}
		//	Creacion de Gif	
			const setPhase = (type) => {
				//	Etapas de Grabacion
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
							timeStart();
							break;
						case 3:
							stopGif(); 
							gifBtn.innerHTML = 'Subir';
							gifMedia.classList.toggle('show');
							gifView.classList.toggle('show');
							timeStop();
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
				//	Asignacion de Clases
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
	//	Barra de Navegacion	
		//	Menu hamburguesa
			menuBtn.addEventListener( 'click', () => { 
				menuList.classList.toggle('open');
				menuList.classList.contains('open')? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;';
			}	);
		//	Item Activo
			menuItem.forEach( (item, i) => item.addEventListener(
				'click', () => {
					for(li = 1 ; li < menuItem.length; li++){
						li === i ? menuItem[li].classList.toggle('active') : menuItem[li].classList.remove('active');
			}	}	)	)
	//	Definicion Cookies
		var setCookie = function(item){
			document.cookie = `${item.id} = ${item.images.fixed_height_downsampled.webp}; Max-Age=2600000; Secure`; 
		};
	//	Elementos Populares
		window.addEventListener( 'load', () => { 
			url = `${trendURL}?api_key=${apiKey}&limit=${limit}&rating=g`;
			fetchAPI(url, trendArea, showGifs);
		}	)
	// 	Elementos Favoritos
		const favLoad = () =>{
			if( localStorage.length == 0 ){
				noResults(noFavs, 'favs');
			} else {
				favArea.innerHTML = ``;
				for ( i = 0; i < localStorage.length; i++ ){  
		  			favGif = localStorage.key(i);
		  			item = JSON.parse(localStorage.getItem(favGif));
		 			favArea.innerHTML += showGifs(item, false);
		 			
				}		
			} 
		}
		//	Agregar Item
			const addToFav = () => {
				window.localStorage.setItem( id , JSON.stringify( {
					'id' : id,
					'img': item.src, 
					'username': item.title, 
					'title': item.alt
			}	)	)	} 
		//	Remover Item
			const removeFav = () => { 
				window.localStorage.removeItem( id ) 
			}
	//	Elementos del Usuario
	//	Sugerencias de Busqueda 
		textField.addEventListener(
			'input', () => {
				if(textField.checkValidity()){
					termino = textField.value;
					url = `${tagsURL}${termino}?api_key=${apiKey}&lang=es`;
					dataList.innerHTML = ``;
					fetchAPI(url, dataList, showOptions);
		}	}	)	;
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
	//	Cargar Paginas
		pageArea.onsubmit =  (e) => {
			e.preventDefault();
			offset += 12;
			url = `${searchURL}?api_key=${apiKey}&q=${termino}&limit=${limit}&offset=${offset}&rating=g&lang=es`
			fetchAPI(url, gifsArea, showGifs);
		}
	//	Creacion de Gifs
		recAgain.addEventListener( 'click', () => {
			phase = 1;
			setPhase(false);
		}	)
		gifBtn.addEventListener( 'click', () => {
			phase < 4 ? phase++ : phase = 1;
			setPhase(true);
		}	)
/*	Funciones Asincronas	*/
	// 	Consultar Webcam
		async function startGif() {
			const stream = await navigator.mediaDevices.getUserMedia({
				audio: false,
				video: { max: 480 }
			}	);
			gifMedia.srcObject = stream;
			await gifMedia.play();
		}
	//	Comenzar Grabacion
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
	// 	Detener Grabacion
		async function stopGif() {
		//	Carga de Contenido
			await videoRecorder.stopRecording();
			await gifRecorder.stopRecording();
			const videoBlob = await videoRecorder.getBlob();
			const gifBlob = await gifRecorder.getBlob();
		// 	Formato de Salida
			gifMedia.src = URL.createObjectURL(videoBlob);
			videoRecorder.stream.getTracks().forEach(t => t.stop());
			gifMedia.srcObject = null;
		// 	Reiniciar Parametros
			await videoRecorder.reset();
			await videoRecorder.destroy();
			await gifRecorder.reset();
			await gifRecorder.destroy();
		//	Limpieza de Contenido
			gifSrc = await gifBlob;
			gifView.src = URL.createObjectURL(await gifBlob);
			gifRecorder = null;
			videoRecorder = null;
		}
	//	Subir Gif Animado
		async function uploadGif() {
		//	Iniciando Carga
			console.log("***comenzando subida***");
			const formData = new FormData();
			formData.append("file", gifSrc, "myGif.gif");
				const params = {
					method: "POST",
					body: formData,
					json: true
			};
		// Consulta URL Subida
			const data = await fetchURL(`${uploadURL}?api_key=${apiKey}`, params);
			console.log(await data);
			console.log("***subida exitosa***");
			return await data;
		}
	//	Consulta API Giphy - UserId
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
			};
		};
/* 	Acciones del Usuario */
	//	Elementos Utilizables
		const getItems = () => {
			//	Resultados
			likeHit	= document.querySelectorAll('.result .fav');
			downHit = document.querySelectorAll('.result .download');
			openHit = document.querySelectorAll('.result .max');
			//	Favoritos
			favHit 	= document.querySelectorAll('.favorite .fav');
			favOpen	= document.querySelectorAll('.favorite .max')
			//	Mis Gifos

			userActions();
		}
	//	Botones de Accion
		const userActions = () => {
		//	Like Button
			likeButtons();
			openButtons();
		//	Download Button
			// downHit.forEach( (down , i) => down.addEventListener( "click", () => {
			// 	item = document.querySelectorAll('img.result')[i].src
			// 	a = document.createElement('a');
			// 	a.download = true;
			// 	a.target = '_blank';
			// 	a.href= item;
			// 	a.click();
			// }	)	)
		//	Open Button
		}
		const likeButtons = () => {
			likeHit.forEach( ( like , i ) => like.addEventListener( 'click', () => { 
				totalItems('result', i);
				like.classList.toggle('active');
				like.classList.contains('active') ? addToFav() : removeFav();
				favArea.innerHTML = ``;
				noFavs.innerHTML = ``;
				favLoad();
		}	)	)	}
		const openButtons = () => {
			openHit.forEach( ( open, i ) => open.addEventListener('click', () => {	
				totalItems('result', i);
				open.classList.toggle('max');
				open.classList.toggle('close')
				document.getElementById(id).classList.toggle('active');
		}	)	)	}
		const totalItems = (param, i) => { 
			id = document.querySelectorAll('article.'+param)[i].id;
			item = document.querySelectorAll('img.'+param)[i];
		}