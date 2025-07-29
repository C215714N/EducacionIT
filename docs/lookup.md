# Búsqueda y Referencia

Grupo de funciones que permiten __localizar datos__ dentro de _rangos, matrices o tablas_, y devolver información relacionada. Son útiles para __vincular datos__ entre hojas, realizar _consultas dinámicas y automatizar análisis_.

* Permiten buscar valores específicos en rangos o matrices.
* Devuelven información relacionada con el valor buscado.
* Se utilizan comúnmente en informes, dashboards y modelos dinámicos.

## Sintaxis general

Cada función tiene su propia sintaxis, pero generalmente suelen incluir los siguientes parametros:

* __Valor buscado__: el dato que se desea encontrar.
* __Rango de búsqueda__: el conjunto de celdas donde se buscará el valor.
* __Columna o fila de resultado__: el lugar desde donde se extraerá el dato relacionado.
* __Tipo de coincidencia__: exacta o aproximada, según la función.

## Funciones principales

| Función | Descripción |
|-|-|
| __BUSCARV__ | Revisa la primera columna de un rango y devuelve un valor en la misma fila, desde otra columna. |
| __BUSCARH__ | Analiza la primer fila de un rango y devuelve un valor en la misma columna, desde otra fila. |
| __BUSCARX__ | Versión moderna que permite buscar en cualquier dirección y admite valores predeterminados si no hay coincidencia. |
| __INDICE__ | Encuentra el valor de una celda dentro de una matriz, según número de fila y columna. |
| __COINCIDIR__ | Devuelve la posición relativa de un valor dentro de un rango. |
| __TRANSPONER__ | Convierte filas en columnas y viceversa dentro de una matriz. |
| __FILA__ | Devuelve el número de fila correspondiente a una celda o rango. |
| __COLUMNA__ | Devuelve el número de columna correspondiente a una celda o rango. |
| __FILAS__ | Cantidad total de filas de un rango seleccionado. |
| __COLUMNAS__ | Cantidad total de columnas de un rango especifico. |

## Consideraciones

* __BUSCARV y BUSCARH__ requieren que el rango de búsqueda esté ordenado si se usa coincidencia aproximada.
* __BUSCARX__ es más flexible y recomendable en versiones modernas de Excel.
* __INDICE y COINCIDIR__ permiten búsquedas más dinámicas y precisas que BUSCARV.

[volver](../readme.md)
