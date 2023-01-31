import {d, w, server} from "./global.js";
import fetchData from "./fetchData.js";
import usersTable from "./users/usersTable.js";
import userPost from "./posts/usersPosts.js";
import userAlbum from "./albums/usersAlbums.js";
import mapContent from "./mapContent.js";

d.addEventListener('DOMContentLoaded', () => {
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
        e.target.href.includes('mailto') ? window.open() : root.innerHTML = '';
        // Solicitudes al servidor BACKEND
        if(e.target.attributes['fetch-type'].value == 'server'){
            const page = e.target.href.split('#')[1];
            const results = await fetchData({url: `${server}/${page}`})
            // Elemento a renderizar por enlace
            page == 'users' ?
                usersTable(results) :
            page == 'posts' ?
                mapContent(results, root, userPost) :
                mapContent(results, root, userAlbum)
        }
    }
} )
} )


w.onbeforeunload = () => 'no me quiero ir señor navegador'