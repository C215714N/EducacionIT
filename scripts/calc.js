// Declaraciones
const calculator = d.getElementById('app-calculadora');
const symbols = ["=","+","-","*","/"];
const actions = ["C","CE"];
const calc = {
    a: "",
    operator: "",
    b: "",
    result: ""
}
// Funciones
const numbers = (start=0,end=9,step=1) => {
    const array = [];
    for(let i = start; i <= end; i+=step) array.push(i);
    return array;
}
const renderElements = (array, id) =>{
    const container = d.createElement("div");
    container.setAttribute("id",id);
    array.forEach(btn => container.innerHTML+= `<button>${btn}</button>`)
    calculator.appendChild(container);
}
const calcInput = () => {
    const input = d.createElement('input');
    Object.assign(input, {
        id: "viewer",
        className: "control",
        type: "number",
        placeholder: "realice un calculo"
    });
    calculator.appendChild(input);
}

calcInput();
renderElements(numbers(),"numbers");
renderElements(symbols,"symbols");
renderElements(actions,"actions");