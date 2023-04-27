## FUNCIONES MySQL
### Fecha y Hora (DATE, TIME, DATETIME)
*	__CURRENT_DATE()__		devuelve la fecha actual
*	__CURRENT_TIME()__		devuelve la hora actual
*	__CURRENT_TIMESTAMP()__	devuelve la fecha y hora actual
*	__DAY(date)__		extrae el dia de la fecha especificada
*	__MONTH(date)__		extrae el mes de la fecha especificada
*	__YEAR(date)__		extrae el año de la fecha especificada
*	__DAYNAME(date)__		retorna el nombre del dia de la fecha
*	__MONTHNAME(date)__		retorna el nombre del mes de la fecha
*	__DATE_DIFF(d2,d1)__	devuelve la diferencia en dias entre las fechas

### Numeros (INTEGER, DECIMAL, DOUBLE, LONG, FLOAT)
*	__MAX(field)__		obtiene el valor mas alto de toda la columna
*	__MIN(field)__		obtiene el valor mas bajo de toda la columna
*	__AVG(field)__		calcula el promedio de toda la columna
*	__SUM(field)__		realiza la sumatoria de los valores de la columna
*	__COUNT(field)__		cuenta la cantidad de registros de la columna
*	__ROUND(val,n)__		redondea el valor con n can. de decimales
*	__CEIL(val)__		redondea hacia arriba el valor especificado
*	__FLOOR(val)__		redondea hacia abajo el valor especificado

### Cadenas de texto (STRING, CHAR, VARCHAR)
*	__CONCAT(val,val)__		combina los valores en una cadena de texto
*	__GROUP_CONCAT(field)__	devuelve todos los registros separados con coma
*	__LOWER(val)__		convierte los valores de texto a minusculas
*	__UPPER(val)__		convierte los valores de texto a mayusculas
*	__LEFT(val,n)__		extrae n cant. de caracteres de un texto desde el inicio
*	__RIGHT(val,n)__		extrae n cant. de caracteres de un texto desde el final
*	__SUBSTRING(val, n, p)__	extrae n cant. de caracteres de un texto desde la posicion p
*	__POSITION(t IN text)__	obtiene la posicion del texto buscado

[volver al inicio](../readme.md)