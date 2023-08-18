# Fundamentos Javascript

Esta es una guia teorico practica para los alumnos de la capacitacion de __javascript__ que cursan los dias _lunes, miercoles y viernes de 14hs a 15hs_. En la misma se expondran los temas trabajados en clase y ejercicios relacionados con estos.

## Variables

Corresponde a un espacio reservado en la memoria cuyo valor puede cambiar. Suelen declararse al pricipio de nuestro _script_ y deben respetar ciertas reglas para considerarse validas, entre las cuales se encuentran:

* Pueden contener `letras`, `numeros` y los simbolos `$` `_`
* No se admiten espacios u otro tipo de simbolos
* El nombre de las mismas __no debe empezar con un numero__
* Se hace distincion entre `mayusculas` y `minusculas`
* No se pueden utilizar __palabras reservadas del lenguaje__

| valido | invalido |
|--------|--------|
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
| float | decimal | 32.6 |
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
