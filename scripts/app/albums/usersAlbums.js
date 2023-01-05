import { root } from "../global.js";

function userAlbum(data){
    root.classList.add('row');
    root.classList.add('justify-content-evenly');
    root.classList.add('gap-2')
    return `
        <div id="album_${data.id}" class="card col-lg position-relative pb-5 ${data.id % 3 == 0 ? 'text-light bg-dark': data.id % 2 == 0 ? 'bg-secondary' : 'bg-light'}">
            <h3 class="h5 pt-3 pb-4">${data.title}</h3>
            <button target_id="${data.id}" class="btn btn-outline-primary | position-absolute start-50 bottom-0 translate-middle | w-75">ver</button>
        </div>
        ${ data.id % 4 == 0 ? '<div class="w-100"></div>' : ''}
    `
}
export default userAlbum;