# Ordenar y Filtrar

__Ordenar__ es el proceso de _reorganizar datos_ en un orden específico, ya sea ascendente o descendente, según uno o más criterios, como por ejemplo, alfabéticamente, por fecha o por valor numérico; por otro lado, __Filtrar__ consiste en mostrar únicamente los _datos que cumplen con una o más condiciones_ específicas, ocultando temporalmente el resto de la información.

## Ordenar

1. Selecciona una celda dentro del rango de datos.
2. Ve a la pestaña __Datos__.
3. En el grupo ordenar y filtrar selecciona alguna de las opciones:
   * Para orden directo, __Ordenar A-Z__ o __Ordenar Z-A__.
   * Para orden personalizado, __Ordenar por columna__ y agrega niveles.
   * Para ordenar por múltiples columnas:
      1. Haz clic en __Ordenar__.
      1. Agrega niveles y define el criterio para cada uno.

| Orden | Descripcion |
|-|-|
| __Ascendente__ | Segun el tipo de datos organiza los valores __del más antiguo a más reciente__ |
| __Descendente__ | Segun el tipo de datos organiza los valores __del más reciente a más antiguo__ |
| __Texto__ | Idoneo para apellidos, nombres, direcciones, etc... A a Z y viceversa |
| __Numero, Fecha/Hora__ | Ideal para cantidades, precios, codigos, registros; de menor a mayor y viceversa |
| __Personalizado__ | Permite un orden específico utilizando valores como _"Alto", "Medio", "Bajo"_ |
| __Multinivel__ | Utiliza varias columnas para mayor especificidad como _apellido, nombre y documento_  |

## Filtrar

1. Selecciona el rango de datos.
2. Haz click en la Pestaña __Datos__ → __Filtro__
3. Usa los menús desplegables en los encabezados para aplicar condiciones.
4. Para eliminar los filtros puedes realizar alguna de las siguientes acciones:
   * Haz clic en el icono de filtro en la columna y selecciona "Borrar filtro de...".
   * desactiva el botón __Filtro__ en la pestaña __Datos__.
   
| Filtro | Descripcion |
|-|-|
| __Automático__ | Se activa desde la pestaña __Datos__ → __Filtro__ |
| __Texto, número o fecha__ | Condiciones como _"Contiene"_, _"Es mayor que"_, _"Entre"_, etc... |
| __Por color__ | Muestra elementos en base al color de celda o de fuente |
| __Simple__ | Basado en un solo campo o condición |
| __Compuesto__ | Usa múltiples condiciones (ej. estado = "activo" y edad > 30) |
| __Avanzado__ | Utiliza expresiones lógicas, fórmulas o rangos dinámicos |

## Limitaciones

* __Ordenar__
  * Puede alterar el orden original de los datos si no se guarda una copia.
  * Si no se seleccionan todas las columnas relacionadas, se puede desalinear la información.
  * Ordenar por múltiples criterios requiere definir prioridades claras.
* __Filtrar__
  * Los datos filtrados no se eliminan, solo se ocultan.
  * Algunas fórmulas pueden comportarse de forma inesperada si dependen de celdas ocultas.
  * Al copiar datos filtrados, solo se copian los visibles (lo cual puede ser útil o problemático).

[volver](../readme.md)