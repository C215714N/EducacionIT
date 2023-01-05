import {d} from "../global.js";

const userComment = (data) =>
    `<div class="alert alert-light shadow | col-md-10 | mx-auto">
        <addres>
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