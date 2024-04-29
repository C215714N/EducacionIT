<?php
class Persona {
    // Propiedades
    private $nombre;
    private $apellido;
    private $edad;
    // Metodos
    // Constructor
    public function __construct($nombre, $apellido, $edad){
        $this->$nombre = $nombre;
        $this->$apellido = $apellido;
        $this->$edad = $edad;
    }
    // Getters
    public function getNombreCompleto(){
        return $this->$nombre + " " + $this->$apellido;
    }
    public function getEdad(){
        return $this->$edad;
    }
    // Setters
    public function setNombreCompleto ($nombre, $apellido){
        if (strlen($nombre) >=3) $this->$nombre = $nombre;
        if (strlen($apellido) >= 3) $this->$apellido = $apellido;
    }
    public function setEdad ($edad){
        if ($edad >= 0 && $edad <= 125) $this->$edad = $edad;
    }
}
// Instancia
$usuario = new Persona("Cristian", "Racedo", 25);
$usuario->getEdad(); // 25
$usuario->setEdad(33);
$usuario->getEdad(); // 33
?>