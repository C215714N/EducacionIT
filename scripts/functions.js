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
function parseMyNumber(a, b){
    this.a = parseInt(a);
    this.b = parseInt(b);
}

let numeroA = d.querySelector('#numeroA');
let numeroB = d.getElementById('numeroB');
let resultado = d.querySelector('#result')
let btnSumar = d.querySelector('button#sum');

// elemento.evento = accion(funcion asociada al evento)
btnSumar.onclick = function (){
    a = numeroA.value;
    b = numeroB.value;
    parseMyNumber;
    resultado.innerHTML = sumar(a, b)
}

let cuentas = d.querySelectorAll('.cuentas');

function operaciones(a,b,index){
    let res;
    switch(index){
        case 0: // sumar
            res = a + b
        break;
        case 1: // restar
            res = a - b
        break;
        case 2: // multiplicar
            res = a * b
        break;
        case 3:
            if(b == 0){
                res = 'no se puede dividir por cero'
            } else {
                res = a / b
            }
        break;
        case 4:
            res = a ** b
    }
    return res;
}
// forEach extrae de un array cada elemento individual
// (elemento, indice) => debe devolver los elementos para su uso
cuentas.forEach( (button, i) =>
//  elemento.escuchador( "evento", accion(funcion asociada al evento) )
    button.addEventListener(
        'click', function () {
            let a = numeroA.value;
            let b = numeroB.value;
            parseMyNumber(a,b);
            result.innerHTML = (operaciones(a, b, i));
        }
    )
)