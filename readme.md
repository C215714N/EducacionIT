# Introduccion al Paradigma de Objetos 

ParaDigma corresponde a un modelo de resolucion de problemas, mediante la utilizacion de patrones, es decir, intrucciones o pasos previamente establecidos. 

El paradigma de objetos hace referencia a la forma en que se implementa elementos de la vida real, de cuales extraemos sus caracteristicas principales para implementarlos en un sistema.

## OOP (Object Oriented Programming)

La programacion orientada a objetos (POO) consiste en la identificacion de factores o elementos que intervienen en el sistema (conjunto de elementos que interactuan entre si) que se desea desarrollar.

* __class__ corresponde a un molde que se utiliza para crear objetos.
* __object__ instancia de una clase, al que se le definen valores particulares.
* __property__ caracteristica del objeto que posee un valor y pertenece a un tipo de dato.
* __method__ acciones que pueden realizar los objetos, estan se definen en la clase.

## Pilares de POO

Si bien existen multiples caracteristicas en la programacion orientada a objetos, 4 destacan por encima del resto.

![Cuatro Pilares](./assets/pillar_men.jpg)

* __ABSTRACCION__ consiste en identificar las caracteristicas principales de los objetos del sistema.
* __HERENCIA__ capacidad para transmitir o pasar las caracteristicas a los elementos hijos.
* __ENCAPSULACION__ caracteristica que permite el acceso a las propiedades, solamente mediante sus metodos.
* __POLIMORFISMO__ adaptabilidad de clases y metodos segun sea necesario.

Segun el lenguaje la sintaxis puede variar, pero en definitiva una clase de establece de la siguiente manera, con sus propiedades y metodos correspondientes.

```sh
class Person {
    ## Propiedades
    String nombre;
    Integer edad;
    ## Metodos
    String saludar(){
        return "hola, mi nombre es " + this.nombre
    }
    Integer obtenerEdad(){
        return this.edad
    }
}
```
Luego para poder crear instancias de la clase podemos almacenar los objetos en variables definiendo, cada vez, uno nuevo de la clase instanciada.

```sh
usuario = new Person()
usuario.nombre = "cristian"
usuario.edad = 33
```

A continuacion se muestra una lista de archivos con ejemplos similares a lo expuesto anteriormente.

* [Objetos](./examples/object.md)
* [C#](./examples/Person.cs)
* [C++](./examples/Person.cpp)
* [Java](./examples/Person.java)
* [JavaScript](./examples/Person.js)
* [PHP](./examples/Person.php)
* [Python](./examples/Person.py)