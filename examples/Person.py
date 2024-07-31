class Person:
    # Metodos Publicos
    # Constructor
    def __init__(self, name, age):
        self.name = name
        self.age = age
    # Getters
    def getName(self):
        return self.name
    def getAge(self):
        return self.age
    # Setters
    def setName(self, name):
        self.name = name
    def setAge(self, age):
        self.age = age
# Instancia
user = Person("cristian", 18)
user.setAge(33)