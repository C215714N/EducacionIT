const root = document.getElementById("calculadora");
const operations = ["+", "-", "*", "/"];
const actions = [["CE", "C", "="],["clearElement","resetCalc","calcResult"]];
const calc = {}
// Renderizado
function renderInput (){
    // Objeto
    const input = document.createElement('input');
    input.setAttribute("id", "form-control");
    input.setAttribute("class", "control");
    input.setAttribute("type", "number")
    root.appendChild(input);
    // Eventos
}
function renderButtons(array){
    const div = document.createElement("div");
    // iteracion
    array.forEach(item => {
        // Objeto
        const btn = document.createElement("button");
        btn.setAttribute("class", "btn")
        btn.innerText = item;
        div.appendChild(btn);
        // Eventos
    })
    root.appendChild(div);
}
function numbers(start=0, end=10, step=1){
    const numbersArray = []
    for(let i = start; i < end; i+= step){
        numbersArray.push(i);
    }
    return numbersArray;
}
// Control de Objetos
const resetCalc = () => {
    Object.assign(calc,{
        n1: "",
        n2: "",
        operation: ""
    })
    return calc.n1;
}
const clearElement = () => calc.operation ? calc.n2 = "" : calc.n1 = "";
const setDigit = (value) => calc.operation ? calc.n2+=value : calc.n1+=value;
const setOperation = (value) => {
    calc.operation = value;
    calc.n2 = "";
    return calc.n1
}
const calcResult = () => {
    if (calc.operation)
    calc.n1 = eval(`${calc.n1}${calc.operation}${calc.n2}`)
    return calc.n1;
}
const setAction = (value) => {
    for(let i = 0; i < actions[1].length; i++) if (value == actions[0][i]) return eval(`${actions[1][i]}()`)
    for(let op of operations) if(value == op) return setOperation(value)
    return setDigit(value)
}
const showNumber = (element, x) => element.value = x
// manipulacion de eventos
function callActions(){
    const input = root.querySelector("input");
    const buttons = root.querySelectorAll("button");
    buttons.forEach((btn) => btn.addEventListener("click",(e) => {
        showNumber(input, setAction(e.target.innerText));
    }))
    input.addEventListener("input", () => calc.operation ? calc.n2 = input.value : calc.n1 = input.value )
}
// Invocacion
resetCalc();
renderInput();
[actions[0],operations,numbers().reverse()].forEach(array => renderButtons(array));
callActions();