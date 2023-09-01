class Persona{
    private string nombre;
    private string apellido;
    private int edad;

    public void Pesona(string nombre,string apellido, int edad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    public void setEdad(edad){
        this.edad = edad;
    }
    public string saludar(){
        return "buenos dias, mi nombre es " + this.nombre
    }
    public string presentarse(){
        return "¿que tal? mi nombre es " + this.nombre + " y tengo " + this.edad + " años";
    }
    public string despedirse (){
        return "hasta la proxima"
    }
}