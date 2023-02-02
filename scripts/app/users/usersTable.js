/** Tabla de Usuarios
 *  usersTable: crea la estructura y mapea datos
 *  usersTableaHeadings: agrega la fila de encabezados
 *  usersTableRows: devuelve las celdas de cada fila 
*/
import { d } from "../global.js";
import userLogin from "./userLogin.js";
import usersTableHeadings from "./usersTableHeading.js";
import usersTableRows from "./usersTableRow.js";
import Storage from "../storage.js";

function usersTable(users){
    const theme = Storage({key: 'mode', type: true, action: 'LOAD'});
    const table = d.createElement('table');
    Object.assign(table, {
        className: `table table-${ theme == "CUSTOM" ? 'warning' : theme} table-striped`,
        id: 'users_table',
        innerHTML: `
            ${ usersTableHeadings() } 
            <tbody>
            ${ users.map(user => usersTableRows(user)) }
            </tbody>`
    })
    root.appendChild(table);
    userLogin();
}

export default usersTable;