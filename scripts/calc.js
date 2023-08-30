/** ¿Como usar una calculadora? 
 * herramienta para realizar operaciones matematicas
 * numeros (DEC: 0-9) => button
 * signos (+ - * / =) => button
 * visor => campo de texto (input)
 * 
 * Paso 1: presionamos los botones correspondientes a los digitos que componen el numero inicial
 * Paso 2: Presionar el signo correspondiente a la operacion a realizar (*)
 * Paso 3: presionar nuevamente nos botones que corresponden a los digitos del 2do numero.
 * Paso 4: presionar el boton de igual (=) para obtener el resultado de la operacion (*)
 * PD: En caso de haber ingresado incorrectamente los digitos, presionar la tecla "C" para eliminar de a uno los numeros.
*/

const 
    d = document,
    root = d.getElementById('root'),
    resultScreen = d.createElement('input'),
    actionsContainer = d.createElement('div'),
    simbolsContainer = d.createElement('div'),
    numbersContainer = d.createElement('div'),
    simbols = ['+', '-', '*', '/', '='],
    actions = ['C', 'CE']
;
let x = 0, o = "", r = 0, equal = false;

Object.assign(resultScreen, {
    id: 'result',
    value: x
} )
actionsContainer.id= "actions";
simbolsContainer.id = 'simbols';
numbersContainer.setAttribute('id', 'numbers');  

// Seccion de Numeros
const numberActions = (selector) => selector.forEach( (n) => { 
    n.addEventListener('click', (e) => {
        equal == false ? x = x : x = 0;
        x = parseInt(x + e.target.value);
        equal = false;
        showXValue();
    } ) 
} )
const numberSection = (n) => {
    numbersContainer.innerHTML +=`
        <input class="number" type="button" value=${n}>`
    root.append(numbersContainer);
    numberActions(d.querySelectorAll('.number'));
}

// Seccion de Simbolos
const simbolSection = (s) => {
    let simbol = document.createElement('button');
    simbol.innerHTML = s;
    
    simbol.addEventListener('click', (e) => {
        if (e.target.innerText != "=") {
            o = e.target.innerText;
            r = x;
            x = 0;
            equal = false;
            showResult();
        }
        else {
            r = eval(r + o + x);
            equal = true;
            showResult();
        }
    } )
    simbolsContainer.append(simbol)
    root.append(simbolsContainer)
}

// Seccion de Eliminacion
const del = (action) =>{
    action === "C" ? 
        x = x.toString().slice(0, -1) : 
        (x = 0, r = 0);
    showXValue();
}

const actionSection = (i) => {
    const delButton = d.createElement('button');
    delButton.innerHTML = i;
    actionsContainer.append(delButton);
    root.append(actionsContainer)
    delButton.addEventListener('click', () => {del(i)})
}

root.append(resultScreen);

create("array", [actions], actionSection);
create("array", [simbols], simbolSection );
create("number", [, 0, 9], numberSection );

function create(type, [array, ini, fin], callBack){
    switch(type){
        case "array":    
            for(let el of array){ 
                callBack(el); 
            }
        break;
        case "number":
            for(let i=ini; i <= fin; i++){ 
                callBack(i) 
            }
        break;
} }

function showXValue(){
    resultScreen.value = x;
    console.log(r, o, x)
}
function showResult(){
    resultScreen.value = r;
    console.log(r,o,x)
}