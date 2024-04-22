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
//# Funciones 
const numbers = (start=0,end=9,step=1) => {
    const array = [];
    for(let i = start; i <= end; i+=step) array.push(i);
    return array;
}
// Acciones
const limpiar = () => {
    if (calc.result == "recalc"){
        calc.a = "";
        calc.operator = "";
        calc.b = "";
        calc.result = "";
} }
const getInput = () => d.querySelector("#app-calculadora input");
const getNumber = () => calc.operator == "" ? "a" : "b";

const setNumber = () => {
    const numbers = d.querySelectorAll("#numbers button");
    const input = getInput();
    // Asignar numero con Botones
    numbers.forEach( n => n.addEventListener('click', () => {
        limpiar();
        const i = getNumber();
        calc[i] += n.innerText;
        input.value = calc[i]
    }))
    // Asignar numero con Input
    input.addEventListener('input', (e) => {
        limpiar();
        const i = getNumber();
        calc[i] = e.target.value;
    })
}
const setOperator = () => {
    const symbols = d.querySelectorAll("#symbols button");
    const input = getInput();
    // Identificar operacion a realizar
    symbols.forEach( s => s.addEventListener('click', () => {
        const op = s.innerText;
        op != "=" ? 
        calc.operator = op : (
            calc.result = eval(`${calc.a} ${calc.operator} ${calc.b}`), calc.a = calc.result,
            input.value = calc.result,
            calc.result = "recalc"
        )
    }))
}
const setAction = () => {
    const actions = d.querySelectorAll("#actions button");
    const input = getInput();
    // Identificar accion de borrado
    actions.forEach(a => a.addEventListener('click', () => {
        switch(a.innerText){
            case "CE":
                const i = getNumber();
                calc[i] = calc[i].toString().slice(0,-1);
                input.value = calc[i];
            break;
            default:
                calc.result = "recalc";
                limpiar();
                input.value = "";
        }
    }))
}
// Renderizado
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
//# Funciones
//# Eventos 
d.addEventListener('DOMContentLoaded', () => {
    // Renderizado
    calcInput();
    renderElements(numbers(),"numbers");
    renderElements(symbols,"symbols");
    renderElements(actions,"actions");
    // Eventos
    setNumber();
    setOperator();
    setAction();
})
//# Eventos