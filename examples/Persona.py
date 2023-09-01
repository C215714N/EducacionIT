class Persona:
    # Propiedades (Atributos)
    nombre
    apellido
    edad 
    # Metodo Constructor 
    def __init__(self, nombre, apellido, edad):
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
    # Metodos (Acciones)
    def saludar(self):
        return "Hola, mi nombre es " + self.nombre
    def presentacion(self):
        return "Buenos dias, soy " + self.apellido + " " + self.nombre + " y tengo " + self.edad + " años"
    def despedirse():
        return "Nos vemos, Hasta la proxima"

p1 = Persona("Cristian", "Racedo", 32)
p2 = Persona("Juan", "Perez", 25)
p3 = Persona("Maria", "Gomez", 30)
p4 = Persona("Pedro", "Gonzalez", 40)