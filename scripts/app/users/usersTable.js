/** Tabla de Usuarios
 *  usersTable: crea la estructura y mapea datos
 *  usersTableaHeadings: agrega la fila de encabezados
 *  usersTableRows: devuelve las celdas de cada fila 
*/
import { d } from "../global.js";
import usersTableHeadings from "./usersTableHeading.js";
import usersTableRows from "./usersTableRow.js";

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

export default usersTable;