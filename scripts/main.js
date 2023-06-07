const 
    d = document,
    controls = d.querySelectorAll('.form-control'),
    isText = /^\D{1,}$/

function check(action, element, className){
    switch (action){
        case 'ADD':
            element.classList.add(className);
        break;
        case 'REMOVE':
            element.classList.remove(className)
        break;
        case 'REPLACE':
            element.classList.add(className[0])
            element.classList.remove(className[1])
        break;
    }
}

controls.forEach( control => control.addEventListener('input', (e) => {
    const feedback = ['is-valid', 'is-invalid'];
    if(e.target.value.length >= 3){
        control.checkValidity() ? 
            check('REPLACE', control, feedback) : 
            check('REPLACE', control, feedback.reverse())
    } else {
        feedback.forEach(cN => check('REMOVE', control, cN));
    }
}))