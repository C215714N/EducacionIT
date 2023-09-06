// Clase Abstracta (SuperClass)
class Persona{
    /* Propiedades Privadas */
    #nombre;
    #apellido;
    #fechaNac;
    #tipoDoc;
    #numDoc;
    #genero;
    #datosContacto;
    /* Metodos Publicos */
    constructor(n, a, fdn, td, nd, g, dc){
        this.#nombre    = n;
        this.#apellido  = a;
        this.#fechaNac  = fdn;
        this.#tipoDoc   = td;
        this.#numDoc    = nd;
        this.#genero    = g;
        this.#datosContacto = dc;
    }
    // Getters
    get(key){
        return this[key];
    }
    // Setters
    set(key, value){
        return this[key] = value;
    }
}
class Cliente extends Persona{
    #codigoCliente;
    #tipoCliente;
    #cuentas;

    constructor(cc, tc, c, ...args){
        super(...args);
        this.#codigoCliente = cc;
        this.#tipoCliente   = tc;
        this.#cuentas       = c;
    }
    #ok(){ return "Operacion realizada exitosamente"; }
    #no(error){ return "Error al realizar la operacion " + error; }

    abrirCuenta(args){
        this.#cuentas.push(new Cuenta(args));
        return this.#ok();
    }
    cerrarCuenta(args){
        if (this.#cuentas.length >= 1){
            this.#cuentas = this.#cuentas.filter(cuenta => 
            cuenta.numeroCuenta != args.numeroCuenta);
            return this.#ok();
        } else {
            return this.#no("no puede eliminar su unica cuenta")
        }
    }
    verCuentas(){
        return this.#cuentas;
    }
    darBaja(){

    }
}
class Cuenta{
    #numeroCuenta;
    #tipoCuenta;
    #saldo;
    constructor(nc, tc, s){
        this.#numeroCuenta = nc;
        this.#tipoCuenta = tc;
        this.#saldo = s ?? 0;
    }
    depositar(monto){
        this.#saldo += monto;
    }
    retirar(monto){
        if(this.#saldo >= monto){
            this.#saldo -= monto;
        } 
        else {
            return "Fondos insuficientes";
        }
    }
}

const c = new Cliente(
    1, // codigoCliente
    "individuo", // tipoCuenta
    [], // Cuentas
    // Datos de Persona
    "cristian", 
    "racedo",
    "1990-04-18",
    "dni",
    "35336446",
    "m",
    [
        {   
            contacto: "cristian",
            email: "cristiandracedo@hotmail.com",
            telefono: "11-0303-4567"
        },
        {
            contacto: "damian",
            email: "cristiandracedo@gmail.com",
            telefono: "11-0303-4567"
        }
    ]
);

c.abrirCuenta("");
c.abrirCuenta(312, "empresa", 10000);

