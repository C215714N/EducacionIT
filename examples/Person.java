class Persona{
    // Propiedades
    private String nombre;
    private String apellido;
    private Integer edad;
    // Metodos
    /// Constructor
    public Persona(String nombre, String apellido, Integer edad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    /// Getters
    public String getNombreCompleto(){
        return this.nombre + " " + this.apellido;
    }
    public Integer getEdad(){
        return this.edad;
    }
    /// Setters
    public void setNombreCompleto (String nombre, String apellido){
        if (nombre.length >=3) this.nombre = nombre;
        if (apellido.length >= 3) this.apellido = apellido;
    }
    public void setEdad (Integer edad){
        if (edad >= 0 && edad <= 125) this.edad = edad;
    }
}

Persona usuario = new Persona("Cristian", "Racedo", 33);
usuario.getEdad(); // 33
usuario.setEdad(25);
usuario.getEdad(); // 25