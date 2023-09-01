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
| prompt(`message`) | Mensaje que solicita al usuario que ingrese datos
| confirm(`message`) | Mensaje de confirmacion de tipo boolean
| write(`message`) | Metodo para escribir en el documento HTML
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

## Condicionales

En ciertas ocasiones deberemos generar una bifurcacion en nuestro codigo, donde se llevara a cabo una accion segun el resultado de una condicion, ya sea que se cumpla o no.

### Sentencia if

Para ejecutar varias sentencias en una cláusula, use una __sentencia block ({ ... })__ para agruparlas. Generalmente, es una buena práctica usar siempre sentencias block, especialmente en código que incluya sentencias if anidadas:

```
if ( test >= 7) {
  console.log('approve');
} else {
  console.log('fail');
}
```

Cualquier valor diferente de __undefined__, null, 0, -0, NaN, o la cadena vacía (""), y cualquier objecto, incluso un objeto Boolean cuyo valor es false, se evalúa como verdadero en una sentencia condicional.

```
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

```
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
    console.log('bem vindo ao curso javascript');
 break;
}
```

Podemos establecer multiples casos para un mismo resultando, evitando colocar la clausula _break_ al final de cada bloque.
Si ninguno de los casos coincide con la expresión, se ejecutará la __cláusula predeterminada__.

```
switch(instrument){
  case 'guitar':
  case 'sitar':
  case 'bass':
      console.log('string');
  break;
    case 'flute':
    case 'saxophone':
    case 'trumpet':
      console.log('wind');
  break;
  default:
    console.log('percussion');
}
```

## Bucles

En ocasiones deberemos repetir una tarea reiterada cantidad de veces en nuestro codigo en base en una condición. Podemos crear ciclos definiendo un criterio que debe cumplirse y solamente se finalizara la ejecucion del mismo cuando dicho criterio ya no pueda cumplirse.

### Sentencia While

Crea un bucle que ejecuta una sentencia especificada mientras cierta condición se evalúe como verdadera. Dicha condición es evaluada antes de ejecutar el codigo del cuerpo.

```
i = 0, 
byte = 8;
while ( i < byte ){
  dec = 2**i;
  console.log("bit " + i + " value is " + dec);
  i++;
}
```

### Sentencia Do While

Crea un bucle que evalúa la condición para seguir ejecutándose luego de haber ejecutado el código dentro de su cuerpo, es decir, que el codigo siempre se ejecuta por lo menos una vez.

```
dec = 200;
bin = '';
value = dec;
do {
  bin = (dec % 2) + bin;
  dec = Math.floor(dec / 2);
} while (dec >= 1);
console.log("binary value of " + value + " is " + bin);
```

### Sentencia for

Crea un bucle que consiste en tres expresiones opcionales, encerradas en paréntesis y separadas por puntos y comas, seguidas de una sentencia ejecutada en un bucle.

```
bin = '11001000';
dec = 0;
for(i = 0; i < bin.length; i++){
  if(reverse(bin)[i] == 1){
    dec += 2**i;
} }
console.log('decimal value of ' + bin + ' is ' + dec);
```

### Sentencia for of

Ejecuta un bloque de código para cada elemento de un objeto iterable, como los String, Array, objetos e iterables definidos por el usuario.

```
units = ['Kilo','Mega','Giga','Tera','Peta','Exa','Zeta','Yota','Bronto','Geop','Sagan'];
for (u of units){
  i = units.indexOf(u) - 1;
  console.log('1' + u + 'Byte is equal to 1000' + (units[i] || '') + Bytes');
}
```

## Eventos

Corresponden a las acciones, normalmente realizadas por el usuario, que desencadenan la ejecucion de codigo mediante el envio de una señal. Estas acciones normalmente se asocian a los diferentes elementos que se encuentran en la pagina, programa o aplicacion que se esta ejecutando y entre los mas comunes se encuentran los siguientes:

| Nombre | Descripcion |
|--|--|
| __click__ | Se hace clic con el boton primario del ratón |
| __scroll__ | Se mueve la barra de desplazamiento |
| __keydown__ | Se comienza a presionar una tecla |
| __keypress__ | Se mantiene presionada una tecla |
| __keyup__ | Se levanta el dedo de la tecla |
| __submit__ | Se envía un formulario |
| __load__ | Se ha terminado de cargar la página |
| __focus__ | Un input recibe el foco |
| __blur__ | Un input pierde el foco |
| __animationstart__ | Empieza una animación |
| __animationend__ | Termina una animación |
| __transitionstart__ | Empieza una transición |
| __transitionend__ | Termina una transición |
| __contextmenu__ | Se hace clic con el boton secundario del ratón |
| __mouseenter__ | Entra el cursor del ratón en el elemento |
| __mouseleave__ | Sale el cursor del ratón en el elemento |
| __mousemove__ | Se mueve el cursor del ratón |
