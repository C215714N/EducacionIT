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
        if (data.status >= 400) throw new Error(data.status)
        return data.json()
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
                <td class="ps-3">Nombre</td>
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
            <td class="ps-3">${user.name || 'nombre'}</td>
            <td>${user.username || 'usuario'}</td>
            <td>${user.email.toLowerCase() || 'correo'}</td>
            <td>${user.phone || 'telefono'}</td>
            <td>${user.website || 'website'}</td>
            <td class="pe-3">
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
/** Publicaciones
 *  userPost
 *  usersComments
 */
// Comentarios
const userComment = (data) =>
    `<div class="alert alert-light shadow | col-md-10 | mx-auto">
        <p>${data.body}</p>
        <addres>
            <strong>${data.name}: </strong>
            <a href="mailto:${data.email}">${data.email.toLowerCase()}</a>
        </addres>
    </div>`

async function usersComments(id){
    let data = '';
    let comments = await fetchData({url: `${server}/comments?postId=${id}`});
    const footer = d.querySelector(`.card-footer#footer_${id}`);
    comments.map(c => data += userComment(c) )
    footer.innerHTML = data;
}
// Publicacion
function userPost(data){
    return `
        <article class="col-lg-8 card my-2 mx-auto">
            <header class="card-header">
                <h2 class="h5">${data.title || data.name}</h2>
            </header>
            <p class="card-body">
                ${data.body}
            </p>
            <footer id="footer_${data.id}" class="card-footer">
                ${ usersComments(data.id) }
            </footer>
        </article>`
}
// Todas las Publicaciones
function usersPosts(data){
    let content = '';
    data.map(d => content += userPost(d))
    root.innerHTML = content
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
            <h2 class="card-header">${error}</h2>
            <p class="card-body">Lo sentimos, hubo un problema</p>`
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
        e.target.href.includes('mailto') ? window.open() : root.innerHTML = '';
        // Solicitudes al servidor BACKEND
        if(e.target.attributes['fetch-type'].value == 'server'){
            const page = e.target.href.split('#')[1];
            const results = await fetchData({url: `${server}/${page}`})
            // Elemento a renderizar por enlace
            page == 'users' ?
                usersTable(results) :
            page == 'posts' ?
                usersPosts(results) :
                console.log(results)
        }
    }
})
