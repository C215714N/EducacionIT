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
const setNumber = () => {
    const numbers = d.querySelectorAll("#numbers button");
    const input = d.querySelector("#app-calculadora input");
    
    // Asignar numero con Botones
    numbers.forEach( n => n.addEventListener('click', () => {
        limpiar();
        calc.operator == "" ?
        (calc.a+= n.innerText, input.value = calc.a) :
        (calc.b+= n.innerText, input.value = calc.b)
    }))
    // Asignar numero con Input
    input.addEventListener('input', (e) => {
        limpiar();
        calc.operator == "" ? calc.a = e.target.value : calc.b = e.target.value
    })
}
const setOperator = () => {
    const symbols = d.querySelectorAll("#symbols button");
    const input = d.querySelector("#app-calculadora input");

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
// Renderizado
calcInput();
renderElements(numbers(),"numbers");
renderElements(symbols,"symbols");
renderElements(actions,"actions");
// Eventos
setNumber();
setOperator();