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
* __SOBRECARGA__ Propiedad que permite la reutilizacion de metodos, alterando levemente su funcionamiento.
* __VISIBILIDAD__ Capacidad de acceder a las propiedades o metodos desde fuera de la clase

## Propiedades y Metodos

### Tipos de clases
* SuperClases: Clases que se utilizan para definir caracteristicas principales, que seran heredadas por otras clases.

* SubClases: Clases que heredan las caracteristicas de otra y agregan propiedades individuales;

```
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
let Objeto = new Cliente(
    'cristian',
    'racedo',
    '20-35336446-5',
    [
        '11-0303-4567',
        '4244-4424'
    ],
    [
        'cristiandracedo@hotmail.com'
    ],
    'Individuo',
    [
        'visa credito', 
        'visa debito'
    ],
    [
        'caja ahorro pesos',
        'cuenta corriente pesos'
    ]
);
```

### Propiedades
* __Privado__: Aquel atributo que solamente puede ser modificado mediante los metodos de la clase.
* __Publico__: Aquel atributo al que podemos acceder y modificar tanto dentro como desde fuera de la clase.

### Metodos
* __constructor__: Metodo que se utiliza para definir los valores iniciales

```
class Usuario{
    constructor(nombre, apellido, email){
        this.nombre = nombre;
        this.apellido = apellido,
        this.email = email;
    }
}
```
* __argumentos__: Una superclase puede pasar sus propiedades a una subclase mediante metodos como _super(arguments)_, que utiliza los valore predeteminados de la clase Padre. 

```
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