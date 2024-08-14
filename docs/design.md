# Planificacion del Diseño

* [Tipos de Unidades](#tipos-de-unidades)
* [Modelos de Color](#modelos-de-color)
* [Background](#background)

## Tipos de Unidades

Los navegadores soportan cualquier medida de medida existente, pero esto no quiere decir que debamos utilizar todas, ya que cada una se aplica dependiendo de la situacion. Las mismas se utilizan para dar tamaño a los elementos de la pagina, limitar las dimensiones de los mismos e incluso la tipografia de las etiquetas. 

| Unidad | Descripcion | Ejemplos |
|--|--|--|
| __Absolutas__ | Son aquellas que siempre valen lo mismo independientemente del medio donde se reproduzcan. Se utilizan principalmente para definir limites y la mas utilizada es el _px (puntos en pantalla)_ | <ul style="padding:0"><li>__distancia__:mm,cm,pc,in</li><li>__tipografia__:pt</li><li>__hibrida__:px</li></ul> |
| __Relativas__ | Son aquellas que dependen del tamaño de su contenedor o su tipografia. Se utilizan para definir dimensiones o modificar la fuente y las mas utilizadas son _% (porcentaje) y rem (ancho de "M" en :root)_ | <ul style="padding:0"><li>__contenedor__:%</li><li>__tipografia__:em,ex,ch</li><li>__hibrida__:rem</li></ul> |
| __Flexibles__ | Identificadas como unidades relativas, son aquellas que toman de referencia las _dimensiones del viewport_ y se implementan para tipografia flexible y definir alturas. | <ul style="padding:0"><li>__dimension__:vw,vh</li><li>__orientacion__:vmin,vmax</li></ul> |

## Modelos de Color

Otro aspecto importante es la eleccion de la paleta de colores, ya sea calida o fria, una triada de color, valores complementarios o tonos de la misma familia; pudiendo elegir el modelo que mas se adecue a nuestras necesidades, aunque solamente podemos utilizar una __sintesis adhitiva__, ya que las pantallas son fuentes de luz.

| modelo | combinaciones | ejemplo |
|--|--:|:--:|
| __HTML__ | 140 | <div style="padding:.25rem .5rem; color:#eee; background-color:darkslateblue">darkslateblue</div> |
| __DEC__  | 16.777.216 | <div style="padding:.25rem .5rem; color:#eee; background-color:rgb(68,68,136)">rgb(68,68,136)</div> |
| __HEX__  | 16.777.216 | <div style="padding:.25rem .5rem; color:#eee; background-color:#444488">#444488</div> |
| __HSL__  | 3.600.000 | <div style="padding:.25rem .5rem; color:#eee; background-color:hsl(240, 40%,40%)">hsl(240, 40%,40%)</div> |

## Background

Esta propiedad se utiliza para definir los valores individuales del fondo de una etiqueta. Se puede usar para definir los valores de una o de todas las siguientes propiedades.

| Background | Descripcion |
|--|--|
| __background-attachment__ | Propiedad que determina si la image se fijara con respecto a la pantalla o la etiqueta contenedora. |
| __background-color__ | Propiedad define el color de fondo de un elemento, puede ser un valor o la palabra _"transparent"_ |
| __background-image__ | Propiedad que establece una o más imágenes de fondo para un elemento, utilizando la funcion _url()_ |
| __background-position__ | Propiedad que define donde inicia la imagen, admite las palabras clave _top center bottom left y right_ |
| __background-size__ | Propiedad que especifica el tamaño de las imágenes, admite valores y palabras clave como _cover y contain_ |
| __background-repeat__ | Propiedad que define como se repiten los fondos, puede ser  sobre el _eje horizontal, vertical, ambos o ninguno_ |

[volver](../readme.md)