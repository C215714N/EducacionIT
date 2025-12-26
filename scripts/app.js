// IIFE (Inmediatly Invoked Function Expression)
(() => document.addEventListener('DOMContentLoaded', () => {
    // Funcion alternadora
    function toggle (tag, add, drop){
        tag.classList.add(add);
        tag.classList.remove(drop);
    }
    // Formulario de Contacto
    contact.addEventListener('input', (event) => {
        const ctrl = event.target;
        ctrl.checkValidity() ?
            toggle(ctrl, 'is-valid', 'is-invalid') :
            toggle(ctrl, 'is-invalid', 'is-valid');
    });
}))()