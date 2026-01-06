// IIFE (Inmediatly Invoked Function Expression)
(() => document.addEventListener('DOMContentLoaded', () => {
    // Funcion alternadora
    function toggle (tag, add, drop){
        tag.classList.add(add);
        tag.classList.remove(drop);
    }
    const checked = (condition, [a, b])  => condition ? a : b;
    const bodyCheck = () => document.body.dataset.bsTheme = themeGet();
    const labelCheck = (condition) => themeLabel.innerText = "Tema " + checked(condition, ['oscuro', 'claro']);
    const themeGet = () => localStorage.getItem('theme') || 'light';
    const themeSet = ({target:t}) => {
        labelCheck(t.checked);
        localStorage.setItem('theme', checked(t.checked, ['dark', 'light']))
        bodyCheck();
    }
    // Formulario de Contacto
    contact.addEventListener('input', (event) => {
        const ctrl = event.target;
        ctrl.checkValidity() ?
            toggle(ctrl, 'is-valid', 'is-invalid') :
            toggle(ctrl, 'is-invalid', 'is-valid');
    });
    themeSwitch.addEventListener('input', themeSet)

    bodyCheck()
    labelCheck(themeGet() === "dark")
}))()