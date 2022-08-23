let d = document;
let w = window;

let cuentas = d.querySelector('#cuentas');

let num_a = parseInt(w.prompt('escriba un numero'));
let num_b = parseInt(w.prompt('escriba otro numero'));
let operation = w.prompt('elija una operacion:\n 1-suma\n 2-resta\n 3-multiplicacion\n 4-division');
// condicional logico
/*
    if (operation == 1){
        alert(num_a + num_b)
    } else if (operation == 2){
        alert(num_a - num_b);
    } else if (operation == 3){
        alert(num_a * num_b);
    } else if (operation == 4){
        if(num_b == 0){
            alert('No se puede dividir entre 0');
        } else {
            alert(num_a / num_b);
        }
    } else {
        alert('La opcion seleccionada NO es valida');
    }
*/

// Condicional por casos
switch(operation){
    case '1':
    case 'suma':
        alert(num_a + num_b);
    break;
    case '2':
    case 'resta':
        alert(num_a - num_b);
    break;
    case '3':
    case 'producto':
        alert(num_a * num_b);
    break;
    case '4':
    case 'division':
        if(num_b == 0){
            alert('No se puede dividir entre 0');
        } else {
            alert(num_a / num_b);
        }
    break;
    default: 
        alert('selecciona una opcion valida');
}