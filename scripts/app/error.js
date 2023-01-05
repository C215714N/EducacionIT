/** Mensajes de error
 *  100: Informacion
 *  200: Respuesta Exitosa
 *  300: Redireccionamiento
 *  400: Error de Cliente
 *  500: Error de Servidor
*/
import {d, root} from "./global.js";

function renderError(error){
    const errorMessage = d.createElement('div')
    Object.assign(errorMessage, {
        className: 'card',
        id: 'error_message',
        innerHTML: `
            <h2 class="card-header">${error}</h2>
            <p class="card-body">Lo sentimos, hubo un problema</p>`
    })
    root.appendChild(errorMessage);
}

export default renderError;