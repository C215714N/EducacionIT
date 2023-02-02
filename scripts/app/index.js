import {d, w, server, root} from "./global.js";
import fetchData from "./fetchData.js";
import Storage from "./storage.js";
import modeSelect from "./config/modeSelect.js";
import usersTable from "./users/usersTable.js";
import userPost from "./posts/usersPosts.js";
import userAlbum from "./albums/usersAlbums.js";
import mapContent from "./mapContent.js";
import userLogin from "./users/userLogin.js";

d.addEventListener('DOMContentLoaded', () => {
    let callback, params;
    let mode = Storage({
        key: 'mode',
        type: 1,
        action: 'LOAD',
    })
    modeSelect({ mode } );
/** API de Eventos
 *  Metodos
 *  preventDefault(): evita el comportamiento por defecto (generalmente refresh)
 *  stopPropagation(): evita la fase de captura de eventos
 */
d.addEventListener('click', async(e) => {
    e.preventDefault();
    e.stopPropagation();
    // Acciones para los hipervinculos
    if (e.target.tagName == 'A'){
        const link = ( e.target.href.split('#')[1].toUpperCase())
        const type = link.includes("MODE") || link.includes("FAVS");

        type ? null : 
        e.target.href.includes('mailto') ?
        window.open(): 
        root.innerHTML = '';

        // Solicitudes al servidor BACKEND
        let fetchtype = e.target.attributes['fetch-type'].value || false;
        if(fetchtype == 'server'){
            const page = e.target.href.split('#')[1];
            const results = await fetchData({url: `${server}/${page}`})
            // Elemento a renderizar por enlace
            page == 'users' ?
                usersTable(results) :
            page == 'posts' ?
                mapContent(results, root, userPost) :
                mapContent(results, root, userAlbum)
        }
        // Solicitudes al Storage del Navegador
        else if(fetchtype == 'storage'){
            const key = ( type ? 'mode' : 'currentUser' )
            callback = ( type ? modeSelect : userLogin )
            // Consulta de datos
            switch(key){
                case 'mode':
                    Storage({
                        key, 
                        value: link.split('-')[0].toUpperCase(),
                        type: true,
                        action: 'SAVE',
                    });
                    params = {mode: link.split('-')[0].toUpperCase()}
                break;  
                case 'currentUser':
                    params = Storage({
                        key,
                        type: false,
                        action: 'LOAD'
                    })
                    console.log(params);
                break;
            }
            callback(params);
        }
    }
} )
} )

w.onbeforeunload = () => 'no me quiero ir señor navegador'