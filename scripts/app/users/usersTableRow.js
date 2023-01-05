function usersTableRows(user){
    return`
        <tr>
            <td class="ps-3">${user.name || 'nombre'}</td>
            <td>${user.username || 'usuario'}</td>
            <td>${user.email.toLowerCase() || 'correo'}</td>
            <td>${user.phone || 'telefono'}</td>
            <td>${user.website || 'website'}</td>
            <td class="pe-3">
                <button userId="${user.id}" class="btn btn-outline-light">elegir</button>
            </td>
        </tr>`
}

export default usersTableRows;