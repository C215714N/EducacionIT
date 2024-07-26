const root = document.getElementById("calculadora");
const operations = ["+", "-", "*", "/"];
const actions = ["CE", "C", "="];
const calc = {
    n1: "", 
    n2: "",
    result: "",
    operation: "",
}
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
function callActions(){
    const buttons = root.querySelectorAll("button");
    buttons.forEach((btn) =>{
        btn.addEventListener("click",(e) => {
            const input = root.querySelector("input");
            const value = e.target.innerText;
            switch(value){
                case "=":
                    if (calc.operation) 
                    calc.n1 = (eval(`${calc.n1} ${calc.operation} ${calc.n2}`))
                    input.value = calc.n1
                break;
                case "CE":
                    if (calc.operation){
                        calc.n2 = "";
                        input.value = calc.n2
                    }
                    else{
                        calc.n1 = "";
                        input.value = calc.n1
                    }
                break;
                case "C":
                    calc.n1 = "";
                    calc.n2 = "";
                    calc.operation="";
                    input.value = calc.n1;
                break;
                case "+":
                case "-":
                case "*":
                case "/":
                    calc.operation = value;
                break;
                default:
                    if(calc.operation) {
                        calc.n2+=value;
                        input.value = calc.n2
                    }
                    else {
                        calc.n1+=value;
                        input.value = calc.n1;
                    }
            }
        })
    })
}
// Invocacion
renderInput();
renderButtons(actions);
renderButtons(operations);
renderButtons(numbers().reverse());
callActions();