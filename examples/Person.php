<?php 
class Person {
    // Propiedades Privadas
    private $nombre;
    private $apellido;
    private $edad;
    // Metodo Constructor
    public function __construct($name, $age) {
        $this->name = $name;
        $this->age = $age;
    }
    // Getters
    public function getName(){
        return $this->name;
    }
    public function getAge(){
        return $this->age;
    }
    // Setters
    public function setName($name){
        $this->name = $name;
    }
    public function setAge($age){
        $this->age = $age;
    }
}
// Instancia
$user = new Person("cristian", 18);
$user->setAge(33);
?>