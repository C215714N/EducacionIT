# Excel Avanzado

## Tabla de contenidos
* [Funciones Basicas](#funciones-basicas)

## Funciones Basicas

### Texto

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
