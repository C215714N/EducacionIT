public class Persona{
    // Propiedades
    private string nombre;
    private string apellido;
    private int edad;
    // Metodos
    // Constructor
    public Persona(string nombre, string apellido, int edad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    // Getters
    public string getNombreCompleto(){
        return nombre + " " + apellido;
    }
    public int getEdad(){
        return edad;
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
// Instancia
Persona usuario = new Persona("Cristian", "Racedo", 25);
usuario.getEdad(); // 25
usuario.setEdad(33);
usuario.getEdad(); // 33