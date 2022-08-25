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

/**
 *  DO WHILE: 
 *  Repite el bloque de codigo mientras se cumpla la condicion 
 *  se debe utilizar un factor de modificacion (a++) para evitar un bucle infinito
 *  Las instrucciones se ejecutan al menos una vez
*/