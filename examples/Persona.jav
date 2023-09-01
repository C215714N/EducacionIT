class Persona{
    // Propiedades (Atributos)
    String nombre;
    String apellido;
    Int edad;
    // Metodo Constructor 
    Persona(String nombre,String apellido,Int edad){
        this.nombre = nombre
        this.apellido = apellido
        this.edad = edad
    }
    // Metodos (Acciones)
    public String saludar(){
        return "Hola, mi nombre es " + this.nombre;
    }
    public String presentacion(){
        return "Buenos dias, soy " + this.apellido + " " + this.nombre + " y tengo " + this.edad + " años";
    }
    public String despedirse(){
        return "Nos vemos, Hasta la proxima";
    }
}
const p1 = new Persona("Cristian", "Racedo", 32);
const p2 = new Persona("Juan", "Perez", 25);
const p3 = new Persona("Maria", "Gomez", 30);
const p4 = new Persona("Pedro", "Gonzalez", 40);