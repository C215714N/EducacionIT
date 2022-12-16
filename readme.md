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

## Objects (OBJETO)

Es una instancia de una Clase, es el elemento resultante tras llamar a la clase, este posee sus propias caracteristicas, pero sus atributos son heredades de la clase Padre.

## Objetos de clase Profesor:
```
cristian = {
    string cargo: 'docente',
    int edad: 31,
    array lenguajes: ['html, css, js, python, c#, sql, ... ]
}
```