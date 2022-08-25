let d = document;
let whileParagraph = d.querySelector('#while');


/** WHILE: 
 *  Repite el bloque de codigo mientras se cumpla la condicion 
 *  se debe utilizar un factor de iteracion (a++) para evita que el bucle se haga infinito
 *  Las instrucciones no se ejecutan si no se cumple la condicion
*/

let count = 0;
let limit = 10;

while(count < limit){
    count++ // incremento en 1
    whileParagraph.innerHTML += count + ' '; // asignacion y concatenacion al parrafo
}


// Array (Arreglo): Lista de elementos que pueden pertenecer a diferentes tipos de datos. Cada elemento posee un indice
let doList = d.querySelector('#do');
let seasons = ['verano','otoño','invierno','primavera'];
let n = 0;
/**
 *  DO WHILE: 
 *  Repite el bloque de codigo mientras se cumpla la condicion 
 *  se debe utilizar un factor de iteracion (a++) para evitar un bucle infinito
 *  Las instrucciones se ejecutan al menos una vez
*/

do {
    doList.innerHTML += '<li>' + seasons[n] + '</li>';
    n++
} while(n < seasons.length)

/**
 *  FOR
 *  Repite un bloque de codigo dadas determinadas condiciones
 *  El factor de iteracion se encuentra definido en los parametros de la condicion
 *  Las instrucciones se repetiran siempre y cuando se cumpla lo anterior
 */ 
let forList = d.querySelectorAll('#for li');
// declaracion; condicion; modificacion
for(i = 0; i < forList.length; i++){
    let listItem = forList[i]; // captura el elemento actual
    let number = listItem.innerText; // obtiene su texto(numero)
    let message; // defino la variable para el mensaje
    if( number % 2 == 0){
        message = ' es un numero par';
    } else if( number % 2 == 1){
        message = ' es un numero impar';
    } else {
        message = ' es un string';
    }
    listItem.innerHTML += message
}