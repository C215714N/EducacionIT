const d = document
const root = d.getElementById('root');
const structure = ['header','main','footer'];

let i = 0;
do {
    let element = d.createElement(structure[i]);
    root.appendChild(element)
    i++
} while (i < structure.length)

const 
    header = d.querySelector('header'),
    main = d.querySelector('main'),
    footer = d.querySelector('footer');

// Manipulacion
let 
    content = "<h1>Bienvenido a Javascript</h1>",
    n = 10,
    date = new Date(); // Instancia de Objeto

header.innerHTML = content;
// i llega con valor de 3 || n vale 10
do{
    let p = d.createElement('p');
    p.innerHTML = 'Caño de ' + n + "/" + i +"in";
    main.appendChild(p);
    //  sumamos 1 a i y restamos 1 a n
    i++
    n-= 3
} while (n >= i)

footer.setAttribute('class', 'set') // manipula directamente las propiedades del elemento HTML
footer.className += 'box' // asigna un valor a las propiedades del Nodo JS que pertenece al arbol DOM
footer.innerHTML = "<p>&copy;"+ date.getFullYear() +" Todos los derechos reservados</p>"

console.log(date.getDay(), date.getHours(), date.getMonth())