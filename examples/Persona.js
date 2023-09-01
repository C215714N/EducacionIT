class Persona{
    constructor(nombre, apellido, edad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    setEdad(edad){
        this.edad = edad;
    }
    saludar(){
        return "buenos dias, mi nombre es " + this.nombre
    }
    presentarse(){
        return "¿que tal? mi nombre es " + this.nombre + " y tengo " + this.edad + " años";
    }
    despedirse (){
        return "hasta la proxima"
    }
}

const p1 = new Persona('cristian', 'racedo', 22);
const p2 = new Persona('john', 'doe', 30);
const p3 = new Persona();
