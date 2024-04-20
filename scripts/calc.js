// Declaraciones
const symbols = ["=","+","-","*","/"];
const actions = ["C","CE"];
const calc = {
    a: "",
    operator: "",
    b: "",
    result: ""
}
const calculator = d.getElementById('app-calculadora');

// Funciones
const numbers = (start=0,end=9,step=1) => {
    const array = [];
    for(let i = start; i <= end; i=i+step) array.push(i);
    return array;
}
const renderElements = (array) =>{
    const container = d.createElement("div");
    array.forEach(btn => container.innerHTML+= `<button>${btn}</button>`)
    calculator.appendChild(container);
}
renderElements(actions);
renderElements(numbers());
renderElements(symbols);