/* Bucle de eventos
    La pila de ejecucion verifica si existen eventos pendientes, luego los intervalos que hayan cumplido su periodo de tiempo y por ultimo, se revisa si existen promesas que se hayan cumplido.

    events ()
    Interval()
    promises()
*/

console.log('action 1') // se ejecuta primero
setTimeout( () => console.log('action 2'), 1000 ) // queda en espera y se ejecuta quinto
setTimeout( () => console.log('action 3'), 500  ) // queda en espera y se ejecuta cuarto
setTimeout( () => console.log('action 4'), 200  ) // queda en espera y se ejecuta tercero
console.log('action 5') // se ejecuta segundo

/**
 * resultado
 * action 1
 * action 5
 * action 4
 * action 3
 * action 2
 */


// AJAX (Asynchronous Javascript AND XML)

