class Persona:
    # Propiedades
    nombre
    apellido
    edad
    # Metodos
    ## Constructor
    def __init__(self, nombre, apellido, edad)
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
    ## Getters
    def getNombreCompleto(self)
        return self.nombre + " " + self.apellido
    ## Setters
    def setNombreCompleto (self, nombre, apellido)
        if (nombre.length >=3) self.nombre = nombre
        if (apellido.length >= 3) self.apellido = apellido
    def setEdad (self, edad)
        if (edad >= 0 && edad <= 125) self.edad = edad
    

usuario = new Persona("Cristian", "Racedo", 33)
usuario.edad # 33
usuario.setEdad(25)
usuario.edad # 25