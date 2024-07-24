const root = document.getElementById("calculadora");
const operations = ["+", "-", "*", "/"];
const actions = ["CE", "C", "="];

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
// Invocacion
renderInput();
renderButtons(actions);
renderButtons(operations);
renderButtons(numbers().reverse())