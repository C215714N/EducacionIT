class Persona{
    private String nombre;
    private String apellido;
    private int edad;

    public void Pesona(string nombre,string apellido, int edad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    public void setEdad(edad){
        this.edad = edad;
    }
    public String saludar(){
        return "buenos dias, mi nombre es " + this.nombre
    }
    public String presentarse(){
        return "¿que tal? mi nombre es " + this.nombre + " y tengo " + this.edad + " años";
    }
    public String despedirse (){
        return "hasta la proxima"
    }
}