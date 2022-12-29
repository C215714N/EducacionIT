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
