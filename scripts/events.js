// Declaraciones
const base = document.getElementById('base');
const altura = document.getElementById('altura');
const calculo = document.getElementById('calculo');

// Funciones
const superficie = (b,h) => b * h;
const perimetro = (b,h) => b * 2 + h * 2;

function result (calculo, base, altura){
    let valor;
    const resultado = document.getElementById("resultado");
    if (calculo == 1) valor = perimetro(base, altura);
    if (calculo == 2) valor = superficie(base, altura);
    resultado.value = valor;
}

// Eventos
base.oninput = () => result(calculo.value, base.value, altura.value);
altura.oninput = () => result(calculo.value, base.value, altura.value);
calculo.oninput = () => result(calculo.value, base.value, altura.value);