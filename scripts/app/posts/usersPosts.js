/** Publicaciones
 *  usersPosts: devuelve las publicaciones de los usuarios
 *  userPost: plantilla de publicacion
 *  usersComments: busca y devuelve los comentarios por publicacion
 *  userComment: plantilla de comentario
 */
import {root} from "../global.js";
import usersComments from "./usersComments.js";

function usersPosts(data){
    let content = '';
    data.map(d => content += userPost(d))
    root.innerHTML = content;
}

function userPost(data){
    return `
        <article class="col-lg-8 card my-2 mx-auto">
            <header class="card-header">
                <h2 class="h5">${data.title || data.name}</h2>
            </header>
            <p class="card-body"> 
                ${data.body} 
            </p>
            <footer id="footer_${data.id}" class="card-footer d-grid gap-3">
                ${ usersComments(data.id) }
            </footer>
        </article>`
}

export default usersPosts;