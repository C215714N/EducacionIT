let d = document;
let w = window;

let cuentas = d.querySelector('#cuentas');
a = w.confirm('¿deseas realizar una cuenta?')
/** Condiconal Logico
 *  Evalua una condicion no estricta
 *  Ejecuta el codigo si el resultado es verdadero
 *  caso contrario, continua con la ejecucion
 */
if(a){

    let num_a = parseInt(w.prompt('escriba un numero'));
    let num_b = parseInt(w.prompt('escriba otro numero'));
    let operation = w.prompt('elija una operacion:\n 1-suma\n 2-resta\n 3-multiplicacion\n 4-division');

/** Condicional por casos 
 *  Evalua una condicion de manera estricta
 *  Compara multiples valores para una misma condicion
 *  Ejecuta el codigo y continua a menos que se interrumpa  
*/
    switch(operation){
        case '1':
        case 'suma':
        case 'adicion':
            alert(num_a + num_b);
        break;
        case '2':
        case 'resta':
        case 'sustraccion':
            alert(num_a - num_b);
        break;
        case '3':
        case 'producto':
        case 'multiplicacion':
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
}
let forExample = '<li>for(condicion){...}</li>';
let switchExample = '<li>switch(condicion){...}</li>';

cuentas.innerHTML = forExample + switchExample;