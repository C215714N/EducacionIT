// Declaraciones
const symbols = ["=","+","-","*","/"];
const actions = ["C","CE"];
const calc = {
    a: "",
    operator: "",
    b: "",
    result: ""
}
const calculator = d.getElementById('calculadora');

// Funciones
const numbers = () => {
    const container = d.createElement("div");
    for(let i = 9; i >= 0; i--){
        container.innerHTML+= `<button>${i}</button>`;
    }
    calculator.appendChild(container);
}
const renderElements = (array) =>{
    const container = d.createElement("div");
    array.forEach(btn => container.innerHTML+= `<button>${btn}</button>`)
    calculator.appendChild(container);
}
renderElements(actions);
numbers();
renderElements(symbols);