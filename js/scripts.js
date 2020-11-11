/*Menu Hamburguesa*/
	document.querySelector('#menu').addEventListener(
		'click', () => {
			document.querySelector('.menu').classList.toggle('openMenu');
			if(document.querySelector('.menu').classList.contains('openMenu')){
				document.querySelector('#menu').innerHTML = '&times;'
			} else {
				document.querySelector('#menu').innerHTML = '&equiv;'
			}
		}
	)

	let gallery = ['slide-1', 'slide-2', 'slide-3'];
	gallery.map(item => document.getElementById(item).addEventListener(
		'click', () => document.getElementById(item).classList.toggle('fixed'))
	);