# Paradigma de Objetos

Hace refencia a un __modelo de resolucion de problemas__, basado en la _identificacion de las partes escenciales_ que componen un sistema; extrayendo las caracteristicas de dicho elementos y utilizandolas como si se tratase de elementos de la vida real.

## Elementos de POO (Object Oriented Programming)

* __Clase__: Molde de referencia a partir del cual se van a crear los diferentes objetos.
* __Objeto__: Instancia de una clase, que hereda las caracteristicas definidas en esta.
* __Propiedad__: Atributos o caracteristicas que definen al objeto.
* __Metodo__: Acciones o funciones que puede ejecutar dicho objeto.

### Definicion de una Clase

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
### Instancia de una Clase

Regularmente vamos a trabajar con una o mas instancias de una clase, y debemos definir los _valores iniciales_ para las propiedades; aunque tambien podemos hacerlos depues. Para ello utilizaremos la palabre new seguido del nombre de la clase y preferentemente utilizaremos los metodos para actualizar los valores de cada propiedad. 

```java
user = new Person(); // instancia de una clase
user.name = "Cristian"; // asignacion directa
user.actualizarEdad(33) // ejecucion del metodo
```

## Pilares de POO

![Pilares de POO (Programacion Orientada a Objetos)](assets/poo_pillars.jpg)

* __ABSTRACCION__: Capacidad para identificar los actores principales de un sistema.
* __HERENCIA__: Capacidad de transmitir propiedades y metodos a clases hijas y objetos instanciados.
* __ENCAPSULACION__: Capacidad para aislar caracteristicas privadas y que sean accesibles unicamente a traves de metodos.
* __POLIMORFISMO__: Capacidad de modificar y adaptar tanto propiedades y metodos como sea necesario.

### Ejemplos

* [Estructuras de Datos](./examples/object.md)
* [C++](./examples/Person.cpp)
* [C#](./examples/Person.cs)
* [Java](./examples/Person.java)
* [JavaScript](./examples/Person.js)
* [PHP](./examples/Person.php)
* [Python](./examples/Person.py)


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