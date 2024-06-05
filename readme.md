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

![Cuatro Pilares de POO](./assets/poo_pillars.jpg)

* __ABSTRACCION__ consiste en identificar las caracteristicas principales de los objetos del sistema.
* __HERENCIA__ capacidad para transmitir o pasar las caracteristicas a los elementos hijos.
* __ENCAPSULACION__ caracteristica que permite el acceso a las propiedades, solamente mediante sus metodos.
* __POLIMORFISMO__ adaptabilidad de clases y metodos segun sea necesario.

Segun el lenguaje la sintaxis puede variar, pero en definitiva una clase de establece de la siguiente manera, con sus propiedades y metodos correspondientes.

```c#
class Person {
    String nombre;
    Integer edad;
    String saludar(){
        return "hola, mi nombre es " + this.nombre
    }
    Integer obtenerEdad(){
        return this.edad
    }
}
```
Luego para poder crear instancias de la clase podemos almacenar los objetos en variables definiendo, cada vez, uno nuevo de la clase instanciada.

```c#
usuario = new Person()
usuario.nombre = "cristian"
usuario.edad = 33
```

A continuacion se muestra una lista de archivos con ejemplos similares a lo expuesto anteriormente.

* [Objetos](./examples/object.md)
* [C#](./examples/Person.cs)
* [C++](./examples/Person.cpp)
* [GO](./examples/Person.go)
* [Java](./examples/Person.java)
* [JavaScript](./examples/Person.js)
* [Perl](./examples/Person.pl)
* [PHP](./examples/Person.php)
* [Python](./examples/Person.py)
* [Ruby](./examples/Person.rb)

## Tipos de relaciones

Al diseñar un diagrama de Clases, es común identificar conexiones directas o indirectas entre ellas, dependiendo de los objetos que se deriven de su instancia.

1. __uno a uno:__ Cada instancia de una clase está vinculada a exactamente una instancia de otra clase. Es una relación directa y única entre dos clases.
1. __uno a varios:__ Cada instancia de una clase está vinculada a una o más instancias de otra, pero cada instancia de esta última se vincula a solo una de la primera.
1. __varios a varios:__ Múltiples instancias de una clase están asociadas con múltiples instancias de otra clase, necesitando de una asociacion intermedia.

Las relaciones entre clases son las __conexiones y asociaciones__ que existen entre distintas _clases dentro de un sistema_. Estas relaciones describen cómo las clases interactúan entre sí y pueden tomar diversas formas.

Son fundamentales para el __diseño de sistemas orientados a objetos__, ya que permiten definir la _estructura y el comportamiento_ del software de manera __modular, cohesiva y reutilizable__.

| Categoria | Descripcion |
|--|--|
| __Asociación__ | Corresponde a una Relación básica entre clases. $^1$ $^2$ $^3$ |
| __Agregación__ | Una clase contiene otras, que pueden existir de manera independiente. $^2$ $^3$ |
| __Composición__ | Una clase contiene otras, que no pueden existir independientemente. $^2$ $^3$ |
| __Herencia__ | Una clase hereda atributos y métodos de otra clase |
| __Dependencia__ | Una clase depende de otra, temporal o permanentemente |

## Propiedades y Metodos

### Tipos de clases
* __SuperClases__: Clases que se utilizan para definir caracteristicas principales, que seran heredadas por otras clases.
* __SubClases__: Clases que heredan las caracteristicas de otra y agregan propiedades individuales;

```c#
// Superclase (define las propiedades principales)
class Usuario{
    string nombre;
    string apellido;
    string cuil;
    array phone;
    array email;
}
// Subclase de Usuario (polimorfismo)
class Empleado extends Usuario{
    string cargo;
    float salario;
    string sector;
}
// Subclase de Usuario (herencia)
class Cliente extends Usuario{
    string tipo;
    array tarjetas;
    array cuentas;
}
// Objeto Cliente Hereda las caracteristicas de la clase Usuario y agregas las propias
Objeto = new Cliente(
    'cristian',
    'racedo',
    '20-35336446-5',
    ['11-0303-4567','4244-4424'],
    ['cristiandracedo@hotmail.com'],
    'Individuo',
    ['visa credito','visa debito'],
    ['caja ahorro pesos','cuenta corriente pesos']
);
```

### Propiedades

* __Privado__: Aquel atributo que solamente puede ser modificado mediante los metodos de la clase.
* __Publico__: Aquel atributo al que podemos acceder y modificar tanto dentro como desde fuera de la clase.

### Metodos

* __constructor__: Metodo que se utiliza para definir los valores iniciales

```js
class Usuario{
    constructor(nombre, apellido, email){
        this.nombre = nombre;
        this.apellido = apellido,
        this.email = email;
    }
}
```

* __argumentos__: Una superclase puede pasar sus propiedades a una subclase mediante metodos como _super(arguments)_, que utiliza los valores predeteminados de la clase Padre. 

```js
class Empleado extends Usuario{
    #cargo;
    #sucursal;
    #sector;
    #turno;

    constructor(cargo, sucursal, sector, turno){
        super(arguments); // utiliza las propiedades de la superclase;
        this.#cargo = cargo;
        this.#sucursal = sucursal;
        this.#sector = sector;
        this.#turno = turno;
    }
}
Empleado = new Empleado("supervisor","Lomas de Zamora",'7g','Tarde')
```

* __get__: Metodo utilizado para que la funcion retorne un valor
* __set__: Metodo utilizado para modificar algun estado de las propiedades.

```js
    // Metodos get (consultar o ver valores)
    getCargo(){
        return cargo
    }
    getSucursal(){
        return sucursal
    }
    // Metodos set (definir o modificar valores)
    setCargo(puesto){
        this.#cargo = puesto
    }
    setSucursal(codigo){
        if (codigo >= 1 && codigo <= 5){
            this.#sucursal = codigo
        } else {
            alert('sucursal no existente')
        }
    }
```

## UML (Unified Model Language)

Es un lenguaje utilizado para la definicion de clases, mediante la realizacion de un mapa conceptual de las definiciones dentro de nuestro sistema. Existen herramientas que permiten la realizacion de estos diagramas como [starUML](https://staruml.io)