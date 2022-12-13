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
        console.log(e.target.checkValidity())
    } )
});

let texto = /(\+*)[a-zA-Z]+/
let numero = new RegExp('[0-5]$','g')

console.log('string simple ' + texto.test('texto'))
console.log('numero ' + texto.test(14))
console.log('string compuesto ' + texto.test('esto es otro texto con mas de 20 caracteres'))

function isRegularNum(arg){
    numero.test(arg) ?
    (console.log('felicitaciones, pasaste la prueba'), console.log('ok')) :
    console.log('no es un numero valido para esta prueba');
}