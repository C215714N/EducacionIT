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
    def getEdad(self)
        return self.edad
    ## Setters
    def setNombreCompleto (self, nombre, apellido)
        if (nombre.length >=3) self.nombre = nombre
        if (apellido.length >= 3) self.apellido = apellido
    def setEdad (self, edad)
        if (edad >= 0 && edad <= 125) self.edad = edad
# Instancia
usuario = Persona("Cristian", "Racedo", 25)
usuario.getEdad() # 25
usuario.setEdad(33)
usuario.getEdad() # 33