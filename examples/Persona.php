<?php
class Persona{
    public function __construct($nombre, $apellido, $edad){
        $this -> $nombre;
        $this -> $apellido;
        $this -> $edad;
    }
    public function setEdad($edad){
        $this -> edad = $edad;
    }
    public function saludar(){
        return "buenos dias, mi nombre es " + $this-> nombre
    }
    public function presentarse(){
        return "¿que tal? mi nombre es " + $this -> nombre + " y tengo " + $this -> edad + " años";
    }
    public function despedirse (){
        return "hasta la proxima"
    }
}

$p1 = new Persona('cristian','racedo', 32);