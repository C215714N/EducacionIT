const root = document.getElementById("calculadora");
const operations = ["+", "-", "*", "/"];
const actions = ["CE", "C", "="];
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
function resetCalc(){
    Object.assign(calc,{
        n1: "",
        n2: "",
        operation: ""
    })
    return calc.n1;
}
function clearElement(){
    if (calc.operation) return calc.n2 = "";
    else return calc.n1 = "";
}
function setDigit(value){
    if(calc.operation) return calc.n2+=value;
    else return calc.n1+=value;
}
function setOperation(value){
    calc.operation = value;
    calc.n2 = "";
    return calc.n1
}
function calcResult(){
    if (calc.operation) 
    calc.n1 = eval(`${calc.n1}${calc.operation}${calc.n2}`);
    return calc.n1;
}
function showNumber(element, x){
    element.value = x
}
// manipulacion de eventos
function callActions(){
    const buttons = root.querySelectorAll("button");
    buttons.forEach((btn) =>{
        btn.addEventListener("click",(e) => {
            let x = calc.n1;
            const input = root.querySelector("input");
            const value = e.target.innerText;
            switch(value){
                case "=":
                    x = calcResult();
                break;
                case "CE":
                    x = clearElement();
                break;
                case "C": 
                    x = resetCalc();
                break;
                case "+":
                case "-":
                case "*":
                case "/":
                    x = setOperation(value)
                break;
                default:
                    x = setDigit(value);
            }
            showNumber(input, x);
            console.log(calc)
        })
    })
}
// Invocacion
resetCalc();
renderInput();
renderButtons(actions);
renderButtons(operations);
renderButtons(numbers().reverse());
callActions();