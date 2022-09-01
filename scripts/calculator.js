// Declaraciones
const d = document;
// Elementos del DOM
const calculator = d.querySelector('#calculator');
const result = d.querySelector('#result');
const action = d.querySelector('#actions');
const numbers = d.querySelector('#numbers');
const operators = d.querySelector('#operators');
// Valores de referencia
let simbols = ['=','+','-','x','/'];
let letters = ['CE','C','DEL'];
let account = [];
let check = false;

// Limpieza de Resultado
function clearAll(){
    result.value = '';
}
// Renderizacion de Elementos
function renderElements (tag, array = [], limit = 10) {
    for (i = 0; i < limit; i++){
        tag.innerHTML += `<input type="button" value="${ array[i] ? array[i] : i}">`
}   }
// Asignacion de Funciones
function renderAction(tag){
    let buttons = tag.querySelectorAll('input[type="button"]');
    buttons.forEach( btn => btn.onclick = () => callAction(btn.value) )   
}
// Carga de Valor Numerico
function addNumber (x){
    if (account[3] && result.value) {
        clearAll()
    }
    return result.value = parseInt(result.value + x);
}
// Almacenamiento del Numero
function setNumber (){
    if (check == false){ 
        account[0] = result.value;
    } else {
        account[2] = result.value;
    }
}
// Asignacion de Operacion
function callOperation(x){
    if ( x != '=') {
        x == 'x' ? account[1] = '*' : account[1] = x;
        result.value = '';
        check = !check;
    } else {
        result.value = eval(`${account[0]}${account[1]}${account[2]}`);
        account[3] = result.value;
        check = false;
}   }
// Funcion derivadora
function callAction(x){
    if ( x >= 0 && x <= 9 ){
        addNumber(x);
    } 
    else if ( x == 'CE' || x == 'C' ){
        clearAll();
        account = [];
    } 
    else if ( x == 'DEL' ){
        result.value = result.value.slice(0, -1);
    } 
    else {
        setNumber()
        callOperation(x);
    }
}
// Renderizacion
renderElements(numbers);
renderElements(operators, simbols, simbols.length);
renderElements(actions, letters, letters.length);
// Asignacion
renderAction(calculator);