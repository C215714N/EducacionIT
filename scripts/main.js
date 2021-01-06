// Progress Bar
	pIn	 = document.querySelector('#jsPbar input');
	pBar = document.querySelector('#jsPbar progress');

	pIn.addEventListener(
		'input', () => pBar.value = pIn.value
	)

// Canvas
	let ctx = document.querySelector('#jsCanvas').getContext('2d');
	//	rectangulo
		ctx.fillStyle = 'darkslateblue';
		ctx.fillRect(50, 50, 100, 100); // x, y, w, h
	
		ctx.fillStyle = 'rgba(234, 68, 136, .5)';
		ctx.fillRect(137.5, 37.5, 25, 25);
	//	circle
		ctx.fillStyle = '#2488'
		ctx.arc(50, 150, 30, 0, Math.PI * 2); // cx , cy, rini, rfin, path
		ctx.fill();