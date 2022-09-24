const d = document;

const menuButton = d.querySelector('nav .btn');
const menuList = d.querySelector('nav .menu');

menuButton.onclick = () => menuList.classList.toggle('active');