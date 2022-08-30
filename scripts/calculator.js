let d = document;
let result = d.querySelector('#result');
let action = d.querySelector('#actions');
let numbers = d.querySelector('#numbers');
let operators = d.querySelector('#operators');
let simbols = ['=','+','-','x','/'];
let letters = ['CE','C','DEL'];
let account = [];
let check = false;

function clearAll (){
    result.value = '';
    account = [];
}

function renderElements (tag, array = [], limit = 10) {
    for (i = 0; i < limit; i++){
        tag.innerHTML += `<input type="button" value="${ array[i] ? array[i] : i}">`
}   }

function renderAction(tag){
    let buttons = tag.querySelectorAll('input');
    buttons.forEach( btn => btn.onclick = () => callAction(btn.value)
)   }

function addNumber (x){
    if (account[3] && result.value) {
        clearAll()
    }
    result.value = parseInt(result.value + x);
}

function setNumber (){
    if (check == false){ 
        account[0] = result.value;
    } else {
        account[2] = result.value;
    }
}

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

function callAction(x){
    if ( x >= 0 && x <= 9 ){
        addNumber(x);
    } 
    else if ( x == 'CE' || x == 'C' ){
        clearAll();
    } 
    else if ( x == 'DEL' ){
        result.value = result.value.slice(0, -1);
    } 
    else {
        setNumber()
        callOperation(x);
    }
}

renderElements(numbers);
renderElements(operators, simbols, simbols.length);
renderElements(actions, letters, letters.length);
renderAction(actions);
renderAction(numbers); 
renderAction(operators);
