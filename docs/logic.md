## Funciones Logicas

Son aquellas que realizan la evaluacion de valores _(condiciones)_ y permiten el uso de los operadores __"Y (AND, &)"__, __"O (OR, |)"__ y __"XO (XOR, ^)"__, determinando el resultado dependiendo del cumplimiento o incumplimiento de la condicion.

|Funcion|Descripcion|
|-|-|
|__SI(`prueba logica`, `valor V`, `valor F`)__| Comprueba si se cumple una condición y devuelve un valor si es VERDADERO y otro si es FALSO|
|__SI.ERROR(`valor`, `valor Error`)__| Devuelve un valor si la expresión es un error y otro valor si no lo es|
|__CONTAR.SI(`rango`, `criterio`)__| Cuenta las celdas que cumplen el criterio establecido|
|__CONTAR.SI.CONJUNTO(`rango 1`, `criterio 1`, `...`)__| Cuenta las celdas que cumplen todos y cada uno de los criterios establecidos|
|__SUMAR.SI(`rango`, `criterio`, `rango suma`)__| Suma los valores de las celdas que cumplen con el criterio establecido|
|__SUMAR.SI.CONJUNTO(`rango suma`, `rango 1`, `criterio 1`, `...`)__| Suma todas las celdas que cumplen todos los criterios |

## Operadores

Cuando utilizamos funciones logicas el resultado dependera de las proposiciones y conjuntamente los operadores utilizados __"Y, O, u XO"__. A continuacion se exponen las tablas de la verdad correspondientes para cada operador en base a dos condiciones (__p__ y __q__)

* __Y(`condición1`, [`condición2`], `...`)__: VERDADERO si todas las condiciones se cumplen, FALSO en caso contrario.
    |Y|p (F)|p (V)|
    |-|-|-|
    |__q (F)__|F|F|
    |__q (V)__|F|V|
* __O(`condición1`, [`condición2`], `...`)__: VERDADERO si al menos una condición se cumple, FALSO si todas son FALSAS.
    |O|p (F)|p (V)|
    |-|-|-|
    |__q (F)__|F|V|
    |__q (V)__|V|V|
* __XO(`condición1`, [`condición2`], `...`)__: VERDADERO si se cumple un número impar de condiciones, FALSO si es par.
    |XO|p (F)|p (V)|
    |-|-|-|
    |__q (F)__|F|V|
    |__q (V)__|V|F|

[volver](../readme.md)