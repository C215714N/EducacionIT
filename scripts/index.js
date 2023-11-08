document.addEventListener('DOMContentLoaded', () => {
// Declaraciones
const formControls = document.querySelectorAll('.form-control');

// Funciones
const changes = ({classes = [], target}) => {
    target.classList.remove(classes[0]);
    target.classList.add(classes[1]);
}

const handleValidation = (target, a, b) =>
    target.checkValidity() ?
    changes({classes:[a,b], target}):
    changes({classes:[b,a], target});

// Eventos
    formControls.forEach(control => {
        control.addEventListener('input', (e) => handleValidation(e.target, "is-invalid", "is-valid"))
    } )

})