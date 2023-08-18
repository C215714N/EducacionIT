let account = 1000;
let option;
// El bucle se ejecutara al menos 1 vez
do{
    alert ("su saldo es " + account)
    option = parseInt(prompt('¿que desea hacer?\n1) Depositar Dinero\n2) Retirar Dinero\n3) Salir'))
    // Concional que comparara la opcion elegida por el usuario
    switch(option){
        // Deposito
        case 1:
            account+= parseInt(prompt('¿cuanto desea depositar?'))
        break;
        // Extraccion
        case 2:
            monto = parseInt(prompt('¿cuanto desea retirar?'))
            if (account < monto){
                alert('saldo insuficiente')
            }
            else{
                account-= monto
            }
        break;
        // Salida
        case 3:
            alert('muchas gracias, por confiar en nosotros')
        break;
        // Valor en caso de no cumplirse los casos anteriores
        default:
            alert('Opcion no valida')
    }
} while (option != 3) // condicion del bucle