class Persona
    # Propiedades
    attr_accessor 
        :nombre, 
        :apellido, 
        :edad
    # Metodos
    ## Constructor
    def initialize(nombre, apellido, edad)
        @nombre = nombre
        @apellido = apellido
        @edad = edad
    end
    ## Getters
    def nombre_completo
        "#{@nombre} #{@apellido}"
    end
    ## Setters
    def set_nombre_completo(nombre, apellido)
        @nombre = nombre if nombre.length >= 3
        @apellido = apellido if apellido.length >= 3
    end
    def set_edad(edad)
        @edad = edad if edad >= 0 && edad <= 125
    end
end
# Instancia
usuario = Persona.new("Cristian", "Racedo", 25)
puts usuario.edad # 25
usuario.set_edad(33)
puts usuario.edad # 33