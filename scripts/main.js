// Declaraciones
const d = document
const mapBtn = d.querySelector('.map .btn')
const mapFrm = d.querySelector('.map iframe')

// Mapa de Contacto
mapBtn.onclick = () => mapFrm.classList.toggle('active') ? mapBtn.classList.replace('icon-max','icon-min') : mapBtn.classList.replace('icon-min','icon-max')