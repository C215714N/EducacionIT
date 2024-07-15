# Fundamentos Javascript

Esta es una guia Practica para los alumnos del curso de __Javascript desde Cero__ donde se recapitularan los contenidos tratados en clase, ademas de ejercicios practicos y recomendaciones con respecto a las implementaciones del lenguaje.

## Variables

Corresponde a un espacio reservado en la memoria cuyo valor puede cambiar. Suelen declararse al pricipio de nuestro _script_ y deben respetar ciertas reglas para considerarse validas, entre las cuales se encuentran:

* Pueden contener `letras`, `numeros` y los simbolos `$` `_`
* No se admiten espacios u otro tipo de simbolos
* El nombre de las mismas __no debe empezar con un numero__
* Se hace distincion entre `mayusculas` y `minusculas`
* No se pueden utilizar __palabras reservadas del lenguaje__

| valido | invalido |
|--------|--------|
| clase_1 | 1clase |
| $nombre | mi nombre |
| _var | var |

### Declaracion

Segun la palabra clave utilizada podemos determinar el alcance de las variables, su capacidad para ser redeclaradas o que se les reasigne un nuevo valor o tipo de dato. Entre dichas palabras y sus caracteristicas se encuentran las siguientes:

|declarador|ambito|redeclarable|reasignable|
|--|--|--|--|
|var|funcion|si|si
|let|bloque|no|si
|const|bloque|no|no

### Datos Primitivos

Si bien a las variables se les puede reasignar su valor, entre los tipos de datos que pueden almacenar se encuentran los primitivos, que son inmutables y corresponden a los siguientes.

| Tipo | Descripcion |
|--|--|
| string | cadenas de texto |
| number | numero entero o decimal |
| boolean | admite true o false |
| undefined | valor no definido |
| null | sin valor almacenado |
| NaN | valor numerico invalido |

### Datos Complejos

Los objetos en JavaScript son colecciones de pares clave-valor, donde las claves son cadenas (o símbolos) y los valores pueden ser cualquier tipo de datos, incluidos otros objetos.

| Tipo | Descripcion |
|--|--|
| array | almacenan múltiples valores en una única variable |
| object | coleccion de datos organizados en pares clave-valor |
| function | elemento que recibe parametros y retorna un valor |