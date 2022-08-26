let d = document;
let body = d.querySelector('body');

// Navegacion
let links = [
    'Inicio',
    'Condicionales',
    'Bucles',
    'Funciones',
    'Extras'
];
let linksHref = [
    'index.html',
    'conditions.html',
    'loops.html',
    '#',
    'more.html'
]
/** DOCUMENT OBJECT MODEL */
// Creacion de elementos HTML
    let nav = d.createElement('nav');
    let header = d.createElement('header');
    let main = d.createElement('main');
    let footer = d.createElement('footer');

    let menu = d.createElement('ul');
    body.appendChild(nav);
    nav.appendChild(menu);
    menu.setAttribute('class','menu');

for(i = 0; i < links.length; i++){
    // variables locales
    let li = d.createElement('li');
    let a = d.createElement('a');
    // Atributos y contenido del <a>
    a.setAttribute('href', linksHref[i]); // atributos
    a.append(links[i]); // texto interno
    // Anidacion de hijos
    menu.appendChild(li); // nodos (etiquetas validas)
    li.appendChild(a);
}

/** Funcion: 
 *  bloque que sera ejecutado cada vez que se invoque
 *  pueden ser primitivas (siempre devuelven lo mismo)
 *  pueden ser complejas (el resultado depende de condiciones)
 *  permite la reutilizacion de codigo y mejora la lectura
 *  pueden ser anonimas (deben estar asociadas a un evento) 
 *  pueden poseer un nombre para ser llamadas
*/

function sumar(a,b) {
    return a + b
}

let numeroA = d.querySelector('#numeroA');
let numeroB = d.getElementById('numeroB');
let resultado = d.querySelector('#result')
let btnSumar = d.querySelector('button#sum');

btnSumar.onclick = function (){
    a = parseInt(numeroA.value);
    b = parseInt(numeroB.value);
    resultado.innerHTML = sumar(a, b)
}