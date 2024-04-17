// Declaraciones
const base = document.getElementById('base');
const altura = document.getElementById('altura');

// Funciones
const superficie = (b,h) => b * h 
const perimetro = (b,h) => b * 2 + h * 2

function result (valor){
    const resultado = document.getElementById("resultado")
    resultado.value = valor;
}

// Eventos
base.oninput = function () {
    result(superficie(base.value, altura.value))
}

altura.oninput = function () {
    result(superficie(base.value, altura.value))
}