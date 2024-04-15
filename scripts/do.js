if (confirm("¿Desea acceder a su cuenta?")){
    let saldo = 1000.00, monto, operacion;
    // El codigo se ejecuta al menos 1 vez
    do{
        // Funcion: Bloque de codigo que puede ser llamado o invocado
        function verSaldo() {
            return "Su saldo actual es de $" + saldo
        };
        operacion = prompt("Selecciona una accion \n 1) Ver Saldo \n 2) Depositar \n 3) Extraer \n 4) Salir");

        switch(operacion.toUpperCase()){
            case "2":
            case "DEPOSITAR":
                monto = prompt("¿cuanto desea ingresar?");
                saldo+= parseFloat(monto);
                alert("operacion realizada con exito. "+ verSaldo());
            break;
            case "3":
            case "EXTRAER":
                monto = prompt("¿cuanto desea extraer?");
                if (monto <= saldo){
                    saldo-=monto;
                    alert("Extraccion exitosa. " + verSaldo());
                } else {
                    alert("no puede extraer un monto mayor a " + saldo);
                }
            break;
            case "4":
            case "SALIR":
                alert("muchas gracias por usar cajeros Pescar.\nNo olvide retirar su tarjeta");
            break;
            default: 
                alert(verSaldo());
        }
    }
    // Condicion para Repetir el Bucle
    while(operacion != 4)
}
