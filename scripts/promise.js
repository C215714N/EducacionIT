// Promise
const promise = new Promise((resolve, reject) => {
    const value = Math.random() * 100;
    if(value >= 60){
        resolve(value)
    }
    else{
        reject(value)
    }
})

promise
.then(resultado => console.log('promesa cumplida: ' + resultado))
.catch(error => console.log('promesa rechazada: ' + error))

// Consultas JSONplaceholder
const
    d = document,
    w = window,
    server = 'https://jsonplaceholder.typicode.com',
    root = d.getElementById('root');

/** Funcion Asincrona 
 *  async: indica el tipo de funcion a utilizar
 *  await: debe esperar la resolucion para continuar
 *  try: bloque de codigo a ejecutar dentro de la funcion
 *  throw: mensaje de error contemplado en el codigo
 *  catch: bloque de codigo que captura mensajes de error
*/
async function fetchData(request){
    try {
        let data = await fetch(request.url);
        return await data.json();
    }
    catch (e){
        renderError(e)
    }        
}
/** Tabla de Usuarios
 *  usersTable: crea la estructura y mapea datos
 *  usersTableaHeadings: agrega la fila de encabezados
 *  usersTableRows: devuelve las celdas de cada fila 
*/
// Encabezados de Tabla
function usersTableHeadings(){
    return `
        <thead>
            <tr>
                <td>Nombre</td>
                <td>Usuario</td>
                <td>Correo</td>
                <td>Telefono</td>
                <td>Pagina</td>
                <td>Acciones</td>
            </tr>
        </thead>`
}
// Celdas por Fila
function usersTableRows(user){
    return`
        <tr>
            <td>${user.name}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.phone}</td>
            <td>${user.website}</td>
            <td>
                <button userId="${user.id}" class="btn btn-outline-light">elegir</button>
            </td>
        </tr>`
}
// Tabla de Usuarios
function usersTable(users){
    const table = d.createElement('table');
    Object.assign(table, {
        className: 'table table-dark table-striped',
        id: 'users_table',
        innerHTML: `
            ${ usersTableHeadings() } 
            <tbody>
            ${ users.map(user => usersTableRows(user)) }
            </tbody>`
    })
    root.appendChild(table);
}
/** Mensaje de error 
 *  100: Informacion
 *  200: Respuesta Exitosa
 *  300: Redireccionamiento
 *  400: Error de Cliente
 *  500: Error de Servidor
*/
// Resultado No encontrado
function renderError(error){
    const errorMessage = d.createElement('div')
    Object.assign(errorMessage, {
        className: 'card',
        id: 'error_message',
        innerHTML: `
            <h2 class="card-header">Lo sentimos, hubo un problema</h2>
            <p class="card-body">Error: ${error}</p>`
    })
    root.appendChild(errorMessage);
}
/** API de Eventos
 *  Metodos
 *  preventDefault(): evita el comportamiento por defecto (generalmente refresh)
 *  stopPropagation(): evita la fase de captura de eventos
 */
// Acciones del usuario
d.addEventListener('click', async(e) => {
    e.preventDefault();
    e.stopPropagation();
    // Acciones para los hipervinculos
    if (e.target.tagName == 'A'){
        root.innerHTML = '';
        // Solicitudes al servidor BACKEND
        if(e.target.attributes['fetch-type'].value == 'server'){
            const page = e.target.href.split('#')[1];
            const results = await fetchData({url: `${server}/${page}`})
            // Elemento a renderizar por enlace
            page == 'users' ?
                usersTable(results) :
            page == 'posts' ?
                console.log(results) :
                console.log(results)
        }
    }
})
