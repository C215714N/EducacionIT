/** Funcion Asincrona 
 *  async: indica el tipo de funcion a utilizar
 *  await: debe esperar la resolucion para continuar
 *  try: bloque de codigo a ejecutar dentro de la funcion
 *  throw: mensaje de error contemplado en el codigo
 *  catch: bloque de codigo que captura mensajes de error
*/
import renderError from "./error.js";

async function fetchData(request){
    try {
        let data = await fetch(request.url);
        if (data.status >= 400) throw new Error(data.status)
        return data.json()
    } 
    catch (e){
        renderError(e)
    }        
}

export default fetchData;