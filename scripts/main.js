let menuBtn = document.querySelector('nav .button');
let menuLst = document.querySelector('nav .menu');

menuBtn.onclick = () => {
	menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'
}