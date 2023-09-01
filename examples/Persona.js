class Persona{
    // Propiedades (Atributos)
    nombre;
    apellido;
    edad;
    // Metodo Constructor 
    constructor(nombre, apellido, edad){
        this.nombre = nombre
        this.apellido = apellido
        this.edad = edad
    }
    // Metodos (Acciones)
    saludar(){
        return "Hola, mi nombre es " + this.nombre;
    }
    presentacion(){
        return "Buenos dias, soy " + this.apellido + " " + this.nombre + " y tengo " + this.edad + " años";
    }
    despedirse(){
        return "Nos vemos, Hasta la proxima";
    }
}
const p1 = new Persona("Cristian", "Racedo", 32);
const p2 = new Persona("Juan", "Perez", 25);
const p3 = new Persona("Maria", "Gomez", 30);
const p4 = new Persona("Pedro", "Gonzalez", 40);