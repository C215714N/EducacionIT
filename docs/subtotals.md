# Subtotales

Herramienta de subtotales en Excel permite calcular automáticamente sumas, promedios, conteos y otros cálculos agrupados por una columna específica.

* Los datos deben estar organizados como una tabla con encabezados.
* La columna por la que se agruparán los subtotales debe estar ordenada.

## Implementacion

* Insertar Subtotales
   1. Ordena los datos por la columna que se usará para agrupar.
   2. Ve a la pestaña __Datos__ → __Subtotales__.
   3. En el cuadro de diálogo:
      - __Para cada cambio en__: elige la columna de agrupación.
      - __Usar función__: selecciona la operación (Suma, Promedio, Contar, etc.).
      - __Agregar subtotal a__: selecciona las columnas a las que se aplicará el cálculo.
   4. Haz clic en __Aceptar__.
* Configuracion adicional
   * __Reemplazar subtotales actuales__: elimina los anteriores al aplicar nuevos.
   * __Agregar un salto de página entre grupos__: útil para impresión.
   * __Resumen debajo de los datos__: muestra los subtotales al final de cada grupo.
* Eliminar subtotales
   1. Ve a la pestaña __Datos__ → __Subtotales__.
   2. Haz clic en __Quitar todos__.

## Limitaciones

* No se puede usar subtotales en tablas de Excel (convertidas con "Insertar tabla"). Es necesario convertirlas a rango primero.
* Los subtotales insertan filas adicionales, lo que puede afectar otras fórmulas o referencias.

[volver](../readme.md)

