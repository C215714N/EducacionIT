public class Persona {
    Persona(string nombre, string apellido, int edad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    public int setEdad(edad){
            this.edad = edad;
    }
    public string saludar(){
        return "buenos dias";
    }
    public string despedirse (){
        return "hasta la proxima";
    }
}

p1 = new Persona("Juan", "Perez", 20);