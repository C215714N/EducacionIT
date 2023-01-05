import {d, server} from "../global.js";
import fetchData from "../fetchData.js";

const userComment = (data) =>
    `<div class="bg-light shadow-lg | col-md-10 | mx-auto rounded-top rounded-start p-3">
        <img class="bg-secondary float-start me-2 rounded-circle p-2" alt=${data.id}>
        <addres class="d-grid">
            <strong>${data.name}: </strong>
            <a class="link-info" href="mailto:${data.email}">
                ${data.email.toLowerCase()}
            </a>
        </addres>
        <p>${data.body}</p>
    </div>`

async function usersComments(id){
    let data = '';
    let comments = await fetchData({url: `${server}/comments?postId=${id}`});
    const footer = d.querySelector(`.card-footer#footer_${id}`);
    comments.map(c => data += userComment(c) )
    footer.innerHTML = data;
}

export default usersComments;