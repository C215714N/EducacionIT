 const navBtn =	document.querySelector('nav .button');
 const navMenu = document.querySelector('nav .menu');

 navBtn.onclick = () => { 
 	navMenu.classList.toggle('active') ? navBtn.innerHTML = '&times;' : navBtn.innerHTML = '&equiv;'
 }