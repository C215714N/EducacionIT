# Paradigma de objetos

se conoce como paradigma a un modelo de ejemplo utilizado para la resolucion de algun planteo previo. El paradigma de objetos se enfoca en la identificacion de cada uno de los factores dentro de un sistema.

Dentro de la programacion orientada a objetos encontraremos los siguientes elementos:

* __Class (clase)__: Molde de referencia utilizado para la creacion de los objetos, donde se definen las caracteristicas y acciones que pueden realizar.
* __Object (Objeto)__: Instancia de una clase que hereda las caracteristicas y metodos de la misma. Suele definirse con pares de atributos "clave":"valor".
* __Properties (propiedades)__: Caracteristicas que describen a la clase y por lo tanto a los Objetos. Similar a las variables, les corresponde un tipo de dato.
* __Methods (metodos)__: Acciones o funciones que se pueden llevar a cabo el objeto de la clase. Reciben datos y ejecutan procedimientos.

```
class Persona{
// Propiedades
    nombre: string,
    apellido: string,
    edad: number,
    vivo: boolean

// Metodos
    contarPersonas();
    agregarPersona();
    saludarPersona();
}
```
## Caracteristicas de POO

* __ABSTRACCION__: Capacidad de separar las caracteristicas mas importantes de los elementos que interactuan en un sistema.
* __ENCAPSULAMIENTO__: Aislar las caracteristicas principales de los elementos para su uso.
* __HERENCIA__: Capacidad de pasar las caracteristicas de un elemento a otros.
* __POLIMORFISMO__: Capacidad de adaptar caracteristicas a los diferentes elementos.

## Propiedades y Metodos
