# Introduccion a Paradigma de Objetos

Un paradigma (Para: Modelo y Digma: Patron) consiste en un conjuntos practicas que deben implementarse al momento de resolver alguna situacion. Estas practicas se definen por convencion y se establecen empiricamente mediante prueba  y error.

## OOP (Object Oriented Programming)

Particularmente la programacion orientada a objetos consiste en abstraer objetos de la vida real, determinar sus caracteristicas y que acciones realizan dentro del sistema a desarrollar. para mediante el armado de un modelo, transcribir las mismas a codigo interpretable y ejecutable.

## Clase (CLASS)

Consiste en la abstraccion principal que definimos cuando implementamos el paradigma de objetos. Se definen como sustantivos singulares de los factores que intervienen en el sistema.

Consiste en un molde que va a ser utilizado para definir los atributos y funciones que tendran los objetos derivados de las mismas.

### Hospital
* Profesional
* Paciente
* Habitacion
* Turno
* Guardia
* Padecimiento

### Escuela
* Profesor
* Estudiante
* Capacitacion
* Curso
* Aula

## Objeto (OBJECT)

Corresponde una instancia de una Clase, es el elemento resultante tras llamar a la clase, este posee sus propias caracteristicas, pero sus atributos son heredades de la clase Padre.

## Objeto de clase Profesor:
```
cristian = {
    cargo: 'docente',
    edad: 31,
    lenguajes: ['html, css, js, python, c#, php, sql, ... ]
}
```
## Objeto de clase Paciente:
```
cristian = {
    genero: 'm',
    grupo: 'o+',
    padecimientos: [],
    medico: Racedo
}
```

## CARACTERISTICAS DE POO

* __ABSTRACCION:__ Capacidad de separar las caracteristas mas importantes de los objetos.
* __ENCAPSULAMIENTO:__ Capacidad de Aislar las caracteristicas para su reutilizacion.
* __HERENCIA:__ Capacidad de traspasar las propiedades y metodos de las clases a los objetos.
* __POLIMORFISMO:__ Capacidad de amoldar las caracteristicas a cada objeto particular.
* __SOBRECARGA:__ Capacidad de reutilizar metodos variandos sus argumentos.

```
    class Persona{
    // Propiedades (Caracteristicas de la clase)
        string nombre,
        string apellido,
        date nacimiento,
        int edad
        float peso,
        float altura

    // Metodos (Funciones de la clase)
        saludar(){
            return 'Hola'
        }
        saludar(string persona){
            return 'Hola' + persona + '¿como estas?'
        }
        saludar(string persona, boolean muchos){
            return muchos ? 'Hola a todos' : 'Hola'
        }
    }
```

## UML (Unified Model Language)

Es un lenguaje utilizado para la definicion de clases, mediante la realizacion de un mapa conceptual de las definiciones dentro de nuestro sistema. Existen herramientas que permiten la realizacion de estos diagramas como [starUML](https://staruml.io)