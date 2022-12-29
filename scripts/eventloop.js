/* Bucle de eventos
    La pila de ejecucion verifica si existen eventos pendientes, luego los intervalos que hayan cumplido su periodo de tiempo y por ultimo, se revisa si existen promesas que se hayan cumplido.

    events ()
    Interval()
    promises()
*/

console.log('action 1') // se ejecuta primero
setTimeout( () => console.log('action 2'), 1000 ) // queda en espera y se ejecuta quinto
setTimeout( () => console.log('action 3'), 500  ) // queda en espera y se ejecuta cuarto
setTimeout( () => console.log('action 4'), 200  ) // queda en espera y se ejecuta tercero
console.log('action 5') // se ejecuta segundo

/**
 * resultado
 * action 1
 * action 5
 * action 4
 * action 3
 * action 2
 */

// AJAX (Asynchronous Javascript AND XML)
function AJAX(req){
    // 0 - Instancia de la clase XHR
    const xhr = new XMLHttpRequest;
    // 1 - Carga de la solicitud
    xhr.open(req.method || 'get', req.url);
    // 2 - envio la solicitud
    xhr.send();
    // 4 - solicitud finalizada
    xhr.addEventListener('readystatechange', () => {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = (
                req.responseType == 'json' ?
                JSON.parse(xhr.response) :
                req.responseType == 'blob' ?
                URL.createObjectURL(xhr.response) :
                xhr.response
            )
            req.callBack(response)
        }
        if(xhr.status == 404){
            req.callBack(`
                <h2>Error 404:</h2>
                <p>Archivo No Encontrado</p>`
            )
        }
    })
    xhr.addEventListener('progress', (e) => {
        if(e.lengthComputable){
            req.callBack(e.loaded / e.total);
        }
    })
}

// Botones de Accion
const ajaxButtons = d.querySelector('#xhr')
const xhrResponse = d.getElementById('xhrResponse')

ajaxButtons.addEventListener('click', (e) => {
    if (e.target.classList.contains('ajax')){
        const url = e.target.attributes['data-target'].value;
        const id = e.target.id;
        AJAX({
            url: `${url}/${id}${e.target.attributes['format'].value}`,
            responseType: e.target.classList.contains('remote') ? 'json': '',
            callBack: (res) => {
                if (e.target.classList.contains('local-doc')) {
                    xhrResponse.innerHTML = res
                }
                else {
                    xhrResponse.innerHTML = '';
                    let ul = d.createElement('ul')
                    res.forEach(r => {
                        ul.innerHTML += `<li id="element_${r.id}">${r.name || r.title}</li>`
                    })
                    xhrResponse.appendChild(ul);
                }
            }
        })
    }
});

const server = 'https://jsonplaceholder.typicode.com';
// callback HELL || Pyramid of DOOM
AJAX({
    url: `${server}/users`,
    // Consultamos todos los usuarios
    callBack: (allUsers) => {
        allUsers.forEach(user => {
            AJAX({
                url:`${server}/posts?userId=${user.id}`,
                // Consultamos las publicaciones de cada usuario 
                callBack: (userPosts) => {
                    userPosts.forEach(post => {
                        AJAX({
                            url: `${server}/comments?postId=${post.id}`,
                            // Consultamos los comentarios de cada publicacion
                            callBack: (userComments) => {
                                userComments.forEach(comment => {
                                    console.log(
                                        `usuario: ${user.name}
                                        posts N°: ${post.id}
                                        publicacion: ${post.title}
                                        comment N°: ${comment.id}
                                        comentario: ${comment.name }
                                        `
                                    )
                                })
                            }
                        })
                    })
                }
            })
        })
    }
})

function getUsers(){
    AJAX({
        url: `${server}/users`,
        callBack: (allUsers) => getPosts(allUsers) 
}) }

function getPosts(allUsers){
    allUsers.forEach(user => {
        const 
            userId = user.id,
            userName = user.name
        AJAX({
            url:`${server}/posts?userId=${userId}`,
            callBack: (userPosts) => getComments(userPosts, userId, userName)   
}) } ) }

function getComments(userPosts, userName){
    userPosts.forEach(post => {
        const
            postId = post.id,
            title = post.title
        AJAX({
            url: `${server}/comments?postId=${postId}`,
            callBack: (userComments) => response(userComments, userName, postId, title)
}) } ) }

function response(userComments, userName, postId, title){
    userComments.forEach(comment => 
        console.log(
            `usuario: ${userName}
            posts N°: ${postId}
            publicacion: ${title}
            comment N°: ${comment.id}
            comentario: ${comment.name }
            `
        )
    )
}