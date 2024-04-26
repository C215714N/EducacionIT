class Persona{
    // Propiedades
    #nombre;
    #apellido;
    #edad;
    // Metodos
    // Constructor
    constructor(nombre, apellido, edad){
        this.#nombre = nombre;
        this.#apellido = apellido;
        this.#edad = edad;
    }
    // Getters
    getNombreCompleto(){
        return this.#nombre + " " + this.#apellido;
    }
    getEdad(){
        return this.#edad;
    }
    // Setters
    setNombreCompleto (nombre, apellido){
        if (nombre.length >=3) this.#nombre = nombre;
        if (apellido.length >= 3) this.#apellido = apellido;
    }
    setEdad (edad){
        if (edad >= 0 && edad <= 125) this.#edad = edad;
    }
}

const usuario = new Persona("Cristian", "Racedo", 33);
usuario.getEdad(); // 33
usuario.setEdad(25);
usuario.getEdad(); // 25