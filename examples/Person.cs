public class Persona{
    // Propiedades
    private string Nombre;
    private string Apellido;
    private int Edad;
    // Metodos
    // Constructor
    public Persona(string nombre, string apellido, int edad){
        Nombre = nombre;
        Apellido = apellido;
        Edad = edad;
    }
    // Getters
    public string getNombreCompleto(){
        return Nombre + " " + Apellido;
    }
    // Setters
    public void setNombreCompleto (string nombre, string apellido){
        if (nombre.length >=3) this.nombre = nombre;
        if (apellido.length >= 3) this.apellido = apellido;
    }
    public void setEdad (int edad){
        if (edad >= 0 && edad <= 125) this.edad = edad;
    }
}

Persona usuario = new Persona("Cristian", "Racedo", 33);
usuario.edad; // 33
usuario.setEdad(25);
usuario.edad; // 25