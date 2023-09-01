class Persona{
    // Propiedades (Atributos)
    private:
        string nombre, apellido;
        int edad;
    // Metodo Constructor 
    public: 
    Persona(string nombre, string apellido, int edad)
    {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    // Metodos (Acciones)
    string saludar()
    {
        return "Hola, mi nombre es " + this.nombre;
    }
    string presentacion()
    {
        return "Buenos dias, soy " + this.apellido + " " + this.nombre + " y tengo " + this.edad + " años";
    }
    string despedirse()
    {
        return "Nos vemos, Hasta la proxima";
    }
}
const Persona p1 = new Persona("Cristian", "Racedo", 32);
const Persona p2 = new Persona("Juan", "Perez", 25);
const Persona p3 = new Persona("Maria", "Gomez", 30);
const Persona p4 = new Persona("Pedro", "Gonzalez", 40);