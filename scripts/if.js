// devuelve TRUE o FALSE en base a la seleccion del usuario
let pregunta = confirm("¿Tienes ganas de hacer cuentas?");

// Condicional
if (pregunta){
    // Ingreso de datos
    const numA = prompt("ingrese un numero");
    const Op = prompt("seleccione una operacion: \n 1) SUMA \n 2) RESTA \n 3) PRODUCTO \n 4) DIVISION");
    const numB = prompt("ingrese otro numero");
    let result;
    
    // Algoritmo, Procesamiento o logica interna
    if (Op == 1 || Op.toUpperCase() == "SUMA"){
        result = parseInt(numA) + parseInt(numB);
    }
    else if(Op == 2 || Op.toUpperCase() == "RESTA"){
        result = numA - numB;
    }
    else if(Op == 3 || Op.toUpperCase() == "PRODUCTO"){
        result = numA * numB;
    }
    else if(Op == 4 || Op.toUpperCase() == "DIVISION"){
        result = numA / numB;
    }
    else {
        result = "SI NO TENIAS GANAS DE REALIZAR CUENTAS, LO HUBIERAS DICHO DESDE UN PRINCIPIO. ADIOS."
    }
    // Salida de datos
    alert("El resultado de la operacion es " + result);
}
else {
    alert("Bueno, Vos te lo perdes");
}
