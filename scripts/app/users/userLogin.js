import { d } from '../global.js';
import Storage from '../storage.js';

function userLogin(){
    const buttons = d.querySelectorAll('#users_table button.btn');

    buttons.forEach(btn => btn.addEventListener('click', (e) => {
        const row = e.target.parentNode.parentNode;
        Storage( {
            key: "currentUser",
            value: {
                userId: e.target.attributes.userId.value,
                name: row.firstElementChild.innerHTML,
                email: row.childNodes[5].innerHTML
            },
            type: false,
            action: 'SAVE',
        } )
    } ) )
}

export default userLogin;