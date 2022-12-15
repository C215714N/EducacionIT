/* 
    Comparadores
        \w : caracteres alfanuméricos 
        \d : solamente dígitos
        \s : caracteres separadores

        \W : todo excepto caracteres alfanumericos
        \D : todo excepto digitos
        \S : todo excepto espacios

    Cuantificadores
        {n}    : cantidad de caracteres fija
        {n, }  : a partir de tantos caracteres
        {n, m} : entre tantos caracteres
        +      : 1 o mas caracteres
        *      : cero o cualquier cantidad

    Posicion
        ^   : que comience con la expresion
        $   : que finalice con la expresion
        \b  : al principio o al final de algun grupo
*/

const formControls = d.querySelectorAll('#contact input');

formControls.forEach( input => {
    input.addEventListener('input', (e) => {
    console.log(
        `checkValidity(): ${e.target.checkValidity()}`, 
        `RegExp.test(): ${validation(e.target.value, e.target.type)}`)
    })
});


function validation(args, type){
    let regexp;
    switch(type){
        case 'text':
            regexp = /[a-z A-Z]+/;
            // solamente letras (1 o mas repeticiones)
        break;
        case 'number':
            regexp = new RegExp(/^\d+$/);
            // solamente digitos (1 o mas repeticiones)
        break;
        case 'password':
            regexp = /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/;
            // mayusculas minusculas numeros y simbolos (8 caracteres o mas)
        break;
        case 'date':
            regexp = new RegExp(/\d{1,2}\/\d{1,2}\/\d{2,4}/);
            // fomato de fecha d/m/yy | dd/mm/yyyy
        break;
        case 'tel':
            regexp = /\+*\(\d{2,5}\)(\d{2,4}\-){1,4}\d{4}/;
            // formato de telefono +(99)9999-9999 | (99999)99-99-99-99-9999
        break;
        case 'email':
            regexp = new RegExp(/\w{2,}@\w{2,}(\.[a-zA-Z]{2,})+/);
            // formato de correo usuario@dominio
        break;
    }
    return regexp.test(args)
}