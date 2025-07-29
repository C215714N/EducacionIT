# Base de Datos

Son un grupo de funciones que operan sobre datos estructurados como bases de datos, permitiendo realizar cálculos específicos según criterios definidos por el usuario. Todas las funciones que se encuentran dentro de esta categoría comienzan con __"BD"__ seguido de nombres de algunas funciones conocidas en Excel.

* __Flexibilidad__: Ofrecen la posibilidad de aplicar diferentes criterios para obtener resultados específicos.  
* __Eficiencia__: Permiten realizar análisis complejos de datos de manera más rápida y eficiente.  
* __Automatización__: Realizan cálculos automáticamente según los criterios definidos, ahorrando tiempo y esfuerzo.  
* __Precisión__: Solo se consideran los registros que cumplen con los criterios establecidos.  
* __Versatilidad__: Se pueden aplicar sobre rangos dinámicos y combinar con otras funciones.  

## Sintaxis

Todas las funciones de Base de datos cuentan con tres argumentos. Aunque son obligatorios, el último puede ser un rango de celdas vacías (mínimo dos filas) si no se desea aplicar ningún criterio.

* __Base de Datos__: Conjunto de datos a consultar, cuya primera fila debe contener los encabezados.  
* __Campo__: Columna sobre la que se realizará la operación, puede indicarse por nombre (entre comillas) o por número de columna.  
* __Criterios__: Rango que contiene los encabezados y las condiciones que deben cumplirse.  

## Funciones disponibles

| Función | Descripción |
|-|-|
| __BDEXTRAER__ | Devuelve un valor único de una base de datos que cumpla con los criterios |
| __BDSUMA__ | Suma los valores de una columna que cumplen con criterios específicos |
| __BDCONTAR__ | Cuenta el número de celdas que cumplen con ciertos criterios |
| __BDMAX__ | Devuelve el valor más alto de una columna que cumpla con los criterios |
| __BDMIN__ | Devuelve el valor más bajo de una columna que cumpla con los criterios |
| __BDPROMEDIO__ | Calcula el promedio de los valores de una columna que cumplen con criterios específicos |
| __BDPRODUCTO__ | Multiplica los valores de una columna que cumplen con los criterios |
| __BDVAR__ | Calcula la varianza de una muestra de registros que cumplen con los criterios |
| __BDVARP__ | Calcula la varianza de toda la población que cumple con los criterios |
| __BDDESVEST__ | Calcula la desviación estándar de una muestra que cumple con los criterios |
| __BDDESVESTP__ | Calcula la desviación estándar de toda la población que cumple con los criterios |
| __BDCONTARA__ | Cuenta las celdas no vacías que cumplen con los criterios |

## Consideraciones

* Los encabezados del rango de criterios deben coincidir exactamente con los de la base de datos.  
* Se pueden usar múltiples filas de criterios para aplicar condiciones con lógica __O__.  
* Las funciones no funcionan correctamente si hay errores en los encabezados o en el rango de criterios.  
* Es posible usar rangos dinámicos con nombres definidos para facilitar la actualización de criterios.  

[volver](../readme.md)