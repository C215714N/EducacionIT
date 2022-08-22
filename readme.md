# Fundamentos Javascript

Esta es una guia Practica para los alumnos del curso de __Javascript desde Cero__ donde se recapitularan los contenidos tratados en clase, ademas de ejercicios practicos y recomendaciones con respecto a las implementaciones del lenguaje.

## Variables

Corresponde a un espacio reservado en la memoria cuyo valor puede cambiar. Suelen declararse al pricipio de nuestro _script_ y deben respetar ciertas reglas para considerarse validas, entre las cuales se encuentran:

* Pueden contener `letras`, `numeros` y los simbolos `$` `_`
* No se admiten espacios u otro tipo de simbolos
* El nombre de las mismas __no debe empezar con un numero__
* Se hace distincion entre `mayusculas` y `minusculas`
* No se pueden utilizar __palabras reservadas del lenguaje__

### Ejemplos:
| valido | invalido |
|------|--------|
| Clase_1 | 1Clase |
| $nombre | mi nombre |
| _var | var |


### Datos Primitivos

Si bien a las variables se les puede reasignar su valor, entre los tipos de datos que pueden almacenar se encuentran los primitivos, que son inmutables y corresponden a los siguientes.

| Tipo | Valor | Ejemplo|
|----|-----|----|
| string | cadena texto|'Cristian'
| number | entero | 18 |
| float | decimal | 31.6 |
| boolean | binario | true |

## Comandos Basicos

| Comando | Implementacion |
|----------|-----|
| alert(`message`) | Muestra un mensaje en pantalla |
| window.prompt(`message`) | Mensaje que solicita al usuario que ingrese datos
| window.confirm(`message`) | Mensaje de confirmacion de tipo boolean
| document.write(`message`) | Metodo para escribir en el documento HTML
| console.log(`message`) | Mensaje de salida que se muestra en la consola
