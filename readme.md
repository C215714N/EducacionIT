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
__\|\|__ 	| si "a" o "b"   | 2<0 \|\| 5>1     | true
__??__	| si no "a" 	   | 2<0 ?? 5>1     | false


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

### Captura de elementos

Cuando trabajamos con un __documento HTML__ en ocasiones sera necesario acceder a algun __nodo de la pagina__, por lo tanto estos metodos nos permitiran asociar dichos elementos a una variable para su posterior manipulacion.

| Comando | Implementacion |
|----------|-----|
| getElementById(`'Id'`) | Devuelve el primer elemento con Id que aparezca en la pagina, segun corresponda |
| getElementsByClassName(`'Class'`) | Devuelve una lista de elementos que concuerden con el nombre de la Clase
| getElementsByTagName(`'Tag'`) | Devuelve una lista de elementos que correspondan con el tipo de etiqueta
| querySelector(`'Selector'`) | Devuelve el primer elemento que coincida con el selector cuya sintaxis es similar a css
| querySelectorAll(`'Selector'`) | Devuelve una lista de elementos que correspondan con el selector

## Condicionales

En ciertas ocasiones deberemos generar una bifurcacion en nuestro codigo, donde se llevara a cabo una accion segun el resultado de una condicion, ya sea que se cumpla o no.

### Sentencia if

Para ejecutar varias sentencias en una cláusula, use una __sentencia block ({ ... })__ para agruparlas. Generalmente, es una buena práctica usar siempre sentencias block, especialmente en código que incluya sentencias if anidadas:

```js
if ( test >= 7) {
  console.log('pass');
} else {
  console.log('fail');
}
```

Cualquier valor diferente de __undefined__, null, 0, NaN, o la cadena vacía (""), y cualquier objeto, incluso un objeto Boolean cuyo valor es false, se evalúa como verdadero en una sentencia condicional.

```js
if (speed >= 90) {
  console.log('fast');
} else if (speed >= 40){
  console.log('regular');
} else {
  console.log('slow');
}
```
### Sentencia Switch

Es una instrucción de __flujo de control__ que prueba el valor de una expresión contra varios casos. La computadora revisará la sentencia switch y __verificará la igualdad estricta === entre el  case y la expresión__.

```js
switch(language){
case 'english':
    console.log('welcome to the javascript course');
  break;
  case 'spanish':
    console.log('bienvenido al curso de javascript');
  break;
  case 'french':
    console.log('bienvenue dans le cours javascript');
  break;
  case 'portuguese':
    console.log('bem vindo ao curso de javascript');
  break;
}
```

Podemos establecer multiples casos para un mismo resultando, evitando colocar la clausula _break_ al final de cada bloque.
Si ninguno de los casos coincide con la expresión, se ejecutará la __cláusula predeterminada__.

```js
switch (vehicle) {
  case 'car':
  case 'truck':
  case 'bus':
   console.log("Gasoline or diesel");
  break;
  case 'skate':
  case 'bike':
    console.log("human-powered");
  break;
  case 'hoverboard':
  case 'hibryd car':
  case 'ebike':
    console.log("Electricity");
  break;
  default:
    console.log("Fuel type unknown");
  break;
}
```

## Ejercicios

### Condicionales

Desarrolla los siguientes algoritmos utilizando las __sentencias if o switch__, segun corresponda. Recorda __declarar variables__ para _almacenar los valores_ ingresados por el usuario o almacenar los _resultados de cada proceso_.

1. Un script que solicite al usuario __ingresar 2 numeros__, y que luego indique, con una ventana emergente o en el documento, __cual es mayor y cual es menor__.
  
1. Un script que pregunte al usuario si __es mayor de edad (18 años)__, y luego le pregunte su __año de nacimiento__ para corroborar si _se cumple premisa anterior_.

1. Un script que indique al usuario en que __estacion del año__ se encuentra, teniendo en cuenta que este debe __ingresar el numero o nombre del mes__ correpondiente.