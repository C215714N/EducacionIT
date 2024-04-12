# Fundamentos Javascript

Esta es una guia teorico practica para los alumnos de la capacitacion de __javascript__ que cursan los dias _lunes, miercoles y viernes de 09hs a 12hs_. En la misma se expondran los temas trabajados en clase y ejercicios relacionados con estos.

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
| float | decimal | 32.9 |
| boolean | binario | true |

## Operadores

### Aritmeticos

| signo | representacion| ejemplo | salida |
|-------|---------------|---------|--------|
 __+__	|suma           | 4 + 6   | 10
 __-__	|resta          | 15 - 10 | 5
 __*__	|multiplicacion |  3 * 8  | 24
 __/__	|division       |  10 / 5 | 2
 __%__	|modulo (resto) |  13 % 2 | 1
 __**__ | potencia      | 2 ** 3  | 8

### Comparacion

| signo   |representacion|ejemplo | salida |
|---------|--------------|--------|--------|
  __==__  |es igual a    | 10 = 5 | false
  __>__	  |mayor que     | 20 > 2 | true
  __>=__  |mayor o igual | 5 >= 5 | true
  __<__	  |menor que     | 10 < 10| false
  __<=__  |menor o igual | 8 <= 20| true
  __!=__  |no es igual   | 3 != 7 | true

### Logicos

| signo | representacion | ejemplo        | salida |
|-------|----------------|----------------|--------|
__&&__	| si "a" y "b"   | 2<0 && 5>1     | false
__||__ 	| si "a" o "b"   | 2<0 || 5>1     | true
__??__	| si no "a" 	 | 2<0 ?? 5>1     | false

## Comandos

### Entrada y Salida

Son aquellos que nos permiten establecer una comunicacion con el usuario final, ya sea mediante la __solicitud de valores__ o mediante la __notificacion en pantalla__ o por __consola__ de los valores resultantes de alguna operacion.

| Comando | Implementacion |
|----------|-----|
| alert(`message`) | Muestra un mensaje en pantalla |
| prompt(`message`) | Mensaje que solicita al usuario que ingrese datos |
| confirm(`message`) | Mensaje de confirmacion de tipo _boolean_ |
| write(`message`) | Metodo para escribir en el documento HTML |
| console.log(`message`) | Mensaje de salida que se muestra en la consola |
