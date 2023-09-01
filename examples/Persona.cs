class Persona {
    Persona(string nombre, string apellido, int edad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    setEdad(int edad){
            this.edad = edad;
    }
    saludar(){
        return "buenos dias"
    }
    despedirse (){
        return "hasta la proxima"
    }
}

p1 = new Persona("Juan", "Perez", 20);