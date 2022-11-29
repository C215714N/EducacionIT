// Tipos de datos
    /** primitivos (inmutables)
     *      number = entero
     *      float = coma 
     *      string = texto
     *      boolean = booleano
     *      null = sin valor
     *      undefined = no definido
     *  compuestos (mutables)
     *      array = [valor1, valor2 ]
     *      objetos = { attrib1: valor1, attrib2: valor2 }
    */

/** Constructores */
// redeclarable / resasignable / alcance global
    var name = 'c215714n';
    var name = 'Cristian Racedo';
// no redeclarable / reasignable / alcance local
    let year = 2020;
    year = 2022;
// no redeclarable / no reasignable / alcance local
    const d = document;

/** DOM (Document Object Model) */
const 
    header = d.getElementById("header"), // Unico por ID
    copyright = d.getElementsByClassName('copy'), // Lista por Class
    footer = d.getElementsByTagName('footer'), // Lista por Etiquetas
    copy = d.querySelector('#footer .copy'), // Unico por Selector
    links = d.querySelectorAll('nav a'); // Lista por Selector

function setDate(){
    copy.innerHTML = `&copy;${year} ${copy.innerHTML} | ${this.name} y compañia`; // String literal (template)
}
setDate();

const navBar = (limit = []) => {
    let nav = d.createElement('nav');
    let ul = d.createElement('ul');
    ul.className = 'menu';
    for(let link of limit){
        ul.innerHTML+= `<li><a>${link}</a></li>`;
    }
    nav.appendChild(ul)
    header.appendChild(nav)
}
navBar(['home','about','gallery','products','services','contact']);

document.addEventListener('click', (event) => {
    let point = event.target.tagName
    if (point == 'A'){
        event.preventDefault();
        window.location.hash = event.target.innerHTML;
    } else if (point == 'HEADER' || point == 'FOOTER'){
        alert('muchas gracias por contactarse')
    }
})