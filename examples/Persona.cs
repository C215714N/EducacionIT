public class Persona {
    Persona(String nombre, String apellido, Int edad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    public Int setEdad(edad){
            this.edad = edad;
    }
    public String saludar(){
        return "buenos dias";
    }
    public String despedirse (){
        return "hasta la proxima";
    }
}

p1 = new Persona("Juan", "Perez", 20);