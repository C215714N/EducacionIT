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
        eval(`this[key] = value`);
    }
}
class Cliente extends Persona{
    #codigoCliente;
    #tipoCliente;
    #cuentas;

    constructor(cc, tc, c, ...args){
        super(...args);
        this.#codigoCliente = cc ?? control.cliente++;
        this.#tipoCliente   = tc ?? 'individuo';
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
        this.#numeroCuenta = nc ?? control.cuenta++;
        this.#tipoCuenta = tc ?? "caja de ahorro";
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
const 
    d = document,
    control = {
        cliente: 0,
        empleado: 0,
        cuenta: 0,
        operacion: 0
    },
    clientes = [],
    frmCliente = d.getElementById('client'),
    frmCuenta = d.getElementById('account'),
    frmEmpleado = d.getElementById('employee');

frmCliente.addEventListener('submit', (e) => {
    e.preventDefault();
    const c = new Cliente(
        null, // codigoCliente
        null, // tipoCuenta
        [], // Cuentas
        // Datos de Persona
        e.target.nombre.value,
        e.target.apellido.value,
        e.target.fechaNac.value,
        e.target.tipoDoc.value,
        e.target.numDoc.value,
        e.target.genero.value,
        // Datos de Contacto
        [ { 
            contacto: e.target.contacto.value,
            email: e.target.email.value,
            telefono: e.target.telefono.value
        } ]
    );
    clientes.push(c);
    c.abrirCuenta("");
    frmCliente.reset();
} )


// c.abrirCuenta(312, "empresa", 10000);
