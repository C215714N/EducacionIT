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
function AJAX(req){
    // 0 - Instancia de la clase XHR
    const xhr = new XMLHttpRequest;
    // 1 - Carga de la solicitud
    xhr.open(req.method || 'get', req.url);
    // 2 - envio la solicitud
    xhr.send();
    // 4 - solicitud finalizada
    xhr.addEventListener('readystatechange', () => {
        if(xhr.readyState == 4 && xhr.status == 200){
            req.callBack(xhr.response)
        }
        if(xhr.status == 404){
            req.callBack(`
                <h2>Error 404:</h2>
                <p>Archivo No Encontrado</p>`
            )
        }
    })
}

// Botones de Accion
const ajaxButtons = d.querySelector('#xhr')
const xhrResponse = d.getElementById('xhrResponse')

ajaxButtons.addEventListener('click', (e) => {
    if (e.target.classList.contains('ajax')){
        AJAX({
            url: `${e.target.attributes['data-target'].value}/${e.target.id}${e.target.attributes['format'].value}`,
            callBack: (res) => {
                e.target.classList.contains('local-doc') ?
                    xhrResponse.innerHTML = res :
                    console.log(res)
            }
        })
    }
});