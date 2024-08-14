# Implementacion del Diseño

* [Flexbox](#flexbox)
* [CSS Grid](#css-grid)
* [Position](#position)

## Flexbox

__El Módulo de Caja Flexible__ fue diseñado como un _modelo unidimensional de layout_, y como un método que pueda ayudar a _distribuir el espacio entre los ítems de una interfaz_ y mejorar las capacidades de alineación. Para crear un contenedor flex, establecemos la propiedad display del contenedor como __flex__ o __inline-flex__. Tan pronto como hacemos esto, __los hijos directos de este se vuelven ítems flex__.

### Propiedades Contenedor Flex

| Propiedad |Descripcion|
|--|--|
| __justify-Content__ | propiedad usada para alinear los ítems en _el eje principal_. El valor inicial es __flex-start__ que alineará los ítems al inicio del margen del contenedor |
| __align-items__ | propiedad que alinea los ítems sobre el _eje cruzado_. El valor inicial es __stretch__ y haciendo que los ítems ajusten sus dimensiones para llenar el contenedor |
| __flex-direction__ | propiedad que permite cambiar la dirección de los ítems. El valor __row-reverse__ mantiene el despliegue a lo largo de la fila, pero el inicio y final quedarán invertido |
| __flex-wrap__ | propiedad especifica si los elementos son obligados a permanecer en una misma línea o pueden fluir en varias líneas, permite controlar la dirección de apilamiento |

### Valores de Alineacion y Distribucion

| Valor | Descripcion |
|--|--|
| __flex-start__ | ubica los elementos al inico del _contendor flex_ |
| __center__ | ubica los elementos en el centro del _contenedor flex_ |
| __flex-end__ | ubica los elementos al final del _contenedor flex_ |
| __space-around__ | separa los elementos sumando las distancias intermedias sobre el _eje principal_ |
| __space-between__ | separa los elementos ubicando al primero y al ultimo a los extremos del _eje principal_ |
| __space-evenly__ | separa los elementos de manera totalmente equitativa sobre el _eje principal_ |
| __baseline__ | alinea las etiquetas sobre el _eje cruzado_ en funcion del tamaño de la tipografia |

### Propiedades Items Flex

| Propiedad | Descripcion |
|--|--|
| __flex-grow__ | propiedad que determina cuanto espacio restante del contenedor flex debe ocupar un item |
| __flex-shrink__ | propiedad que determina cuanto se encogerán los items para rellenar el contenedor flex |
| __flex-basis__ | propiedad que determina el tamaño de una caja de contenidos dentro del contenedor flex |
| __align-self__ | propiedad que alinea los items flexibles reemplazando el valor de align-items |

## CSS Grid

__CSS Grid layout__ contiene funciones de diseño dirigidas a los _desarrolladores de aplicaciones web_ y se puede utilizar para lograr muchos diseños diferentes. También se destaca por permitir __dividir una página en áreas o regiones principales__, por definir la relación en términos de tamaño, posición y capas entre partes de un control construido a partir de primitivas HTML.

### Propiedades contenedor Grid

| Propiedad | Descripcion  |
|--|--|
| __grid-template-columns__ | Propiedad que especifica el número y ancho de las columnas en un diseño de cuadrícula, en una lista separada por espacios |
| __grid-template-rows__ | Propiedad que especifica el número y las alturas de las filas en un diseño de cuadrícula, donde cada valor especifica la altura de las filas |
| __grid-template-areas__ | Propiedad que especifica áreas dentro del diseño de cuadrícula, donde cada área está definida por apóstrofes |
| __grid-gap / gap__ | Propiedad que especifica el distanciamiento entre las celdas (calles) indicando el valor para las filas y columnas respecticamente |

### Propiedades Item Grid

| Propiedad | Descripcion |
|--|--|
| __grid-column__ | Propiedad que especifica el tamaño y la ubicación de un elemento de la cuadrícula dentro de una columna, especificando el borde de inicio y fin en línea de su cuadrícula |
| __grid-row__ | Propiedad que especifica el tamaño y la ubicación de un elemento de la cuadrícula dentro de una fila, especificando el borde de inicio y fin en línea de su cuadrícula, por defecto es automatico |
| __grid-area__ | Propiedad que especifica el tamaño y la ubicación de un elemento, especificando así los bordes de las filas y columnas a la que pertenece o el repectivo nombre de su area |

## Position

Propiedad que especifica cómo un elemento es ubicado en el documento, se puede utilizar para modificar la posición donde aparecerá y las propiedades __top, right, bottom, y left__ determinan la ubicación final del mismo.

| Valor | Descripcion |
|--|--|
| __static__ | El elemento es posicionado de acuerdo al flujo normal del documento, ocupando su espacio predeterminado. Es el valor predeterminado |
| __relative__ | El elemento es posicionado de acuerdo al flujo del documento, es desplazado en relación a sí mismo. No afecta la posición de ningún otro elemento |
| __absolute__ | El elemento es removido del flujo normal del documento y es posicionado en relacion a su ancestro posicionado más cercano |
| __fixed__ | El elemento es removido del flujo normal del documento y es posicionado en relación al bloque contenedor inicial establecido por el viewport |
| __sticky__ | El elemento es posicionado de acuerdo al flujo del documento, luego es desplazado con relación a su ancestro que se desplace más cercano y su bloque contenedor |

[volver](../readme.md)