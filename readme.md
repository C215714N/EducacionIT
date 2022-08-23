# Fundamentos Javascript

Esta es una guia Practica para los alumnos del curso de __Javascript desde Cero__ donde se recapitularan los contenidos tratados en clase, ademas de ejercicios practicos y recomendaciones con respecto a las implementaciones del lenguaje.

## Tabla de contenidos

1. [Variables](#variables)
  1. [Declaraciones](#declaraciones)
  1. [Datos Primitivos](#datos-primitivos)
1. [Comandos](#comandos)
  1. [Entrada y Salida](#entrada-y-salida)
  1. [Captura de Elementos](#captura-de-elementos)

## Variables

Corresponde a un espacio reservado en la memoria cuyo valor puede cambiar. Suelen declararse al pricipio de nuestro _script_ y deben respetar ciertas reglas para considerarse validas, entre las cuales se encuentran:

* Pueden contener `letras`, `numeros` y los simbolos `$` `_`
* No se admiten espacios u otro tipo de simbolos
* El nombre de las mismas __no debe empezar con un numero__
* Se hace distincion entre `mayusculas` y `minusculas`
* No se pueden utilizar __palabras reservadas del lenguaje__
| valido | invalido |
|------|--------|
| Clase_1 | 1Clase |
| $nombre | mi nombre |
| _var | var |

### Declaracion

Segun la palabra clave utilizada podemos determinar el alcance de las variables, su capacidad para ser redeclaradas o que se les reasigne un nuevo valor o tipo de dato. Entre dichas palabras y sus caracteristicas se encuentran las siguientes:

|declarador|alcance|redeclarable|reasignable|
|--|--|--|--|
|var|global|si|si
|let|local|no|si
|const|local|no|no

### Datos Primitivos

Si bien a las variables se les puede reasignar su valor, entre los tipos de datos que pueden almacenar se encuentran los primitivos, que son inmutables y corresponden a los siguientes.

| Tipo | Valor | Ejemplo|
|----|-----|----|
| string | cadena texto|'Cristian'
| number | entero | 18 |
| float | decimal | 31.6 |
| boolean | binario | true |

## Comandos

### Entrada y Salida

Son aquellos que nos permiten establecer una comunicacion con el usuario final, ya sea mediante la __solicitud de valores__ o mediante la __notificacion en pantalla__ o por __consola__ de los valores resultantes de alguna operacion.

| Comando | Implementacion |
|----------|-----|
| alert(`message`) | Muestra un mensaje en pantalla |
| window.prompt(`message`) | Mensaje que solicita al usuario que ingrese datos
| window.confirm(`message`) | Mensaje de confirmacion de tipo boolean
| document.write(`message`) | Metodo para escribir en el documento HTML
| console.log(`message`) | Mensaje de salida que se muestra en la consola

### Captura de elementos

Cuando trabajamos con un __documento HTML__ en ocasiones sera necesario acceder a algun __nodo de la pagina__, por lo tanto estos metodos nos permitiran asociar dichos elementos a una variable para su posterior manipulacion.

| Comando | Implementacion |
|----------|-----|
| getElementById(`'Id'`) | Devuelve el primer elemento con Id que aparezca en la pagina, segun corresponda |
| getElementsByClassName(`'Class'`) | Devuelve una lista de elementos que concuerden con el nombre de la Clase
| getElementsByTagName(`'Tag'`) | Devuelve una lista de elementos que correspondan con el tipo de etiqueta
| querySelector(`'Selector'`) | Devuelve el primer elemento que coincida con el selector cuya sintaxis es similar a css
|  querySelectorAll(`'Selector'`)| Devuelve una lista de elementos que correspondan con el selector
