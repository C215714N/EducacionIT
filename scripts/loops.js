let d = document;
let whileParagraph = d.querySelector('#while');


/** WHILE: 
 *  Repite el bloque de codigo mientras se cumpla la condicion 
 *  se debe utilizar un factor de modificacion (a++) para evita que el bucle se haga infinito
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
 *  se debe utilizar un factor de modificacion (a++) para evitar un bucle infinito
 *  Las instrucciones se ejecutan al menos una vez
*/

do {
    doList.innerHTML += '<li>' + seasons[n] + '</li>';
    n++
} while(n < seasons.length)