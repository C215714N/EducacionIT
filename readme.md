# Paradigma de Objetos

Hace refencia a un __modelo de resolucion de problemas__, basado en la _identificacion de las partes escenciales_ que componen un sistema; extrayendo las caracteristicas de dicho elementos y utilizandolas como si se tratase de elementos de la vida real.

## Elementos de POO (Object Oriented Programming)

* __Clase__: Molde de referencia a partir del cual se van a crear los diferentes objetos.
* __Objeto__: Instancia de una clase, que hereda las caracteristicas definidas en esta.
* __Propiedad__: Atributos o caracteristicas que definen al objeto.
* __Metodo__: Acciones o funciones que puede ejecutar dicho objeto.

## Definicion de una clase

Normalmente se utiliza la palabra reservada __class__ seguido del nombre de la misma, _empezando en Mayusculas_. En algunos casos debemos definir las propiedades y sus respectivos tipos de datos; pero siempre sera necesario definir los metodos que pueden ejecutar los hijos de dicha clase.

```Java
class Person {
    // Propiedades
    String name,
    Number age,
    // Metodos
    saludar(){
        return "hola, mi nombre es "+ name;
    }
    actualizarEdad(Number age){
        if (age <= 125) this.age = age
    }
}
```
## Instancia de una clase

Regularmente vamos a trabajar con una o mas instancias de una clase, y debemos definir los valores iniciales para las propiedades

```java
user = new Person(); // instancia de una clase
user.name = "Cristian"; // asignacion directa
user.actualizarEdad(33) // ejecucion del metodo
```