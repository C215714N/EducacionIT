<?php class Persona{
    // Propiedades (Atributos)
    private $nombre;
    private $apellido;
    private $edad;
    // Metodo Constructor 
    public function __construct($nombre, $apellido, $edad){
        $this->$nombre = $nombre;
        $this->$apellido = $apellido;
        $this->$edad = $edad;
    }
    // Metodos (Acciones)
    public function saludar(){
        return "Hola, mi nombre es " + $this->$nombre;
    }
    public function presentacion(){
        return "Buenos dias, soy " + $this->$apellido + " " + $this->$nombre + " y tengo " + $this->$edad + " años";
    }
    public function despedirse(){
        return "Nos vemos, Hasta la proxima";
    }
}
$p1 = new Persona("Cristian", "Racedo", 32);
$p2 = new Persona("Juan", "Perez", 25);
$p3 = new Persona("Maria", "Gomez", 30);
$p4 = new Persona("Pedro", "Gonzalez", 40);