# Excel Avanzado

## Tabla de contenidos
* [Funciones Basicas](#funciones-basicas)
    * [Texto](#texto)
    * [Numericas](#numericas)
    * [Fecha y Hora](#fecha-y-hora)
* [Funciones Logicas](#funciones-logicas)
    * [Tablas de la Verdad](#tablas-de-la-verdad)
* [Funciones de Bases de datos](#funciones-de-bases-de-datos)

## Funciones Basicas

### Texto

Son aquellas que permiten trabajar con los valores de la celda procesandolos como cadenas de texto, indistintamente de su contenido, y pueden utilizarse para dar formato a las celdas, asi como tambien para extraer o concatenar valores.

| Funcion | Descripcion|
|-|-|
|__CONCATENAR(`val`,`val`)__| combina los valores en una cadena de texto|
|__MINUSC(`val`)__| convierte los valores de texto a minusculas|
|__MAYUSC(`val`)__| convierte los valores de texto a mayusculas|
|__ESPACIOS(`val`)__| Quita los espacio al principio, al final o si se repite consecutivamente en un texto|
|__IZQUIERDA(`texto`, `n`)__| extrae __n__ cant. de caracteres de un texto desde el inicio|
|__DERECHA(`texto`, `n`)__| extrae __n__ cant. de caracteres de un texto desde el final|
|__EXTRAE(`texto`, `n`, `p`)__|	extrae __n__ cant. de caracteres de un texto desde la posicion __p__|
|__ENCONTRAR(`val`, `texto`)__|	obtiene la posicion de un valor deseado en el texto especificado|
|__LARGO(`texto`)__| devuelve la cantidad de caracteres que posee el texto seleccionado|

### Numericas

Son aquellas que se utilizan para trabajan con numeros racionales, ignorando en la mayoria de los casos cualquier valor que no sea operativo, y se organizan en diferentes categorias como operativas, estadisticas, trigonometricas, etc.

| Funcion | Descripcion|
|-|-|
|__MAX(`rango`)__| obtiene el valor mas alto de toda la seleccion|
|__MIN(`rango`)__|	obtiene el valor mas bajo de toda la seleccion|
|__MODA(`rango`)__| obtiene el valor que mas veces se repite en la seleccion|
|__PROMEDIO(`rango`)__|	calcula el promedio de toda la seleccion|
|__MEDIANA(`rango`)__| calcula la mediana de toda la seleccion|
|__SUMA(`rango`)__|	realiza la sumatoria de los valores de la seleccion|
|__CONTAR(`rango`)__| cuenta la cantidad de registros de la seleccion|
|__REDONDEAR(`val`, `n`)__|	redondea el valor con n can. de decimales|
|__REDONDEAR.MAS(`val`)__|	redondea hacia arriba el valor especificado|
|__REDONDEAR.MENOS(`val`)__| redondea hacia abajo el valor especificado|

### Fecha y Hora

Son aquellas que facilitan la operatoria con los valores almacenados en la base de datos de fechas, debido a que la computadora utiliza numeros racionales para obtener las fechas utilizando el entero para los dias y los decimales para las horas.

| Funcion | Descripcion|
|-|-|
|__HOY()__| devuelve la fecha actual|
|__AHORA()__| devuelve la fecha y hora actual|
|__DIA(`fecha`)__| extrae el dia de la fecha especificada|
|__MES(`fecha`)__| extrae el mes de la fecha especificada|
|__AÑO(`fecha`)__| extrae el año de la fecha especificada|
|__HORA(`fecha`)__| extrae la hora de la fecha especificada|
|__MINUTO(`fecha`)__| extrae los minutos de la fecha especificada|
|__SEGUNDO(`fecha`)__| extrae los segundos de la fecha especificada|
|__TEXTO(`fecha`,`"dddd"`)__| devuelve el nombre del dia de la fecha|
|__TEXTO(`fecha`,`"mmmm"`)__| devuelve el nombre del mes de la fecha|

## Funciones Logicas

Son aquellas que realizan la evaluacion valores _(condiciones)_ y permiten el uso de los operadores __"Y (AND, &)"__, __"O (OR, |)"__ y __"XO (XOR, ^)"__, determinando el resultado dependiendo del cumplimiento o incumplimiento de la condicion.

|Funcion|Descripcion|
|-|-|
|__SI(`prueba logica`, `valor V`, `valor F`)__| Comprueba si se cumple una condición y devuelve un valor si es VERDADERO y otro si es FALSO|
|__SI.ERROR(`valor`, `valor Error`)__| Devuelve un valor si la expresión es un error y otro valor si no lo es|
|__CONTAR.SI(`rango`, `criterio`)__| Cuenta las celdas que cumplen el criterio establecido|
|__CONTAR.SI.CONJUNTO(`rango 1`, `criterio 1`, `...`)__| Cuenta las celdas que cumplen todos y cada uno de los criterios establecidos|
|__SUMAR.SI(`rango`, `criterio`, `rango suma`)__| Suma los valores de las celdas que cumplen con el criterio establecido|
|__SUMAR.SI.CONJUNTO(`rango suma`, `rango 1`, `criterio 1`, `...`)__| Suma todas las celdas que cumplent todos los criterios |

## Tablas de la verdad

Cuando utilizamos funciones logicas el resultado dependera de las proposiciones y conjuntamente los operadores utilizados __"Y, O, u XO"__. A continuacion se exponen las tablas de la verdad correspondientes para cada operador en base a dos condiciones (__p__ y __q__)

<div style="display:flex; justify-content: center; flex-wrap: wrap; gap: 1.5rem;">

|Y|p (F)|p (V)|
|-|-|-|
|__q (F)__|F|F|
|__q (V)__|F|V|

|O|p (F)|p (V)|
|-|-|-|
|__q (F)__|F|V|
|__q (V)__|V|V|

|XO|p (F)|p (V)|
|-|-|-|
|__q (F)__|F|V|
|__q (V)__|V|F|

</div>

## Funciones de Bases de Datos

Son aquellas que permiten la creación, modificación y depuración de los datos en una base de datos EXCEL, mediante operaciones matemáticas que se cumplen de manera automática según las especificaciones del usuario y los parametros de la misma, siendo estos los siguientes: 
    
* __base de datos:__ rango de celdas que contienen los datos a analizar
* __nombre de campo:__ celda que especifica el titulo de la columna
* __criterios:__ rango de condiciones que coincide con los campos de la base de datos

|Funcion| Descripcion|
|-|-|
|__DBSUMA()__| Suma aquellas celdas que cumplan los criterios especificados |
|__DBCONTAR()__| Cuenta solamente las celdas con numeros que cumplan los criterios|
|__DBPROMEDIO()__| Devuelve el promedio de las celdas que cumplan los criterios|
|__DBMIN()__| obtiene el valor mas bajo de la base de datos, que cumpla las condiciones|
|__DBMAX()__| obtiene el valor mas alto de la base de datos, que cumpla las condiciones|