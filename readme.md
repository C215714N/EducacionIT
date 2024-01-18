# Maquetador Avanzado

Esto es una guia para los alumnos de la capacitacion __Maquetado con SASS__ que cursan los dias _lunes y miercoles de 20hs a 22hs_, donde podran revisar los contenidos vistos en clase.

## Tabla de Contenidos

* [Estructura Semántica](#estructura-semántica)
* [Jerarquia CSS](#jerarquia-css)
* [Tipos de Unidades](#tipos-de-unidades)
* [Background](#background)
* [Flexbox](#flexbox)

## Estructura Semántica

HTML5 incorpora nuevos elementos que permiten a los motores de busqueda interpretar con mayor facilidad el contenido dentro de cada pagina. El objetivo de esta implementacion radica en la __reduccion de etiquetas &lt;div>__ y mejorar la estructura semantica de los sitios web, haciendo referencia a la funcion que cumple cada elemento contenedor dentro de cada pagina del sitio.

| Etiqueta | Descripcion |
|--|--|
| __header__ | Cabecera o contenido introductorio, debe contener los encabezados y suele poseer alguna galeria a modo de introduccion.
| __nav__ | Corresponde a los links mas importantes, se aconseja evitar el uso de redes sociales y tratar que sea de facil acceso |
| __main__ | Contenido principal que suele englobar la informacion relevante para el usuario, aunque se utilizar tambien para resaltar la seccion mas importante de la pagina |
| __article__ | Contenido Independiente que funciona tanto dentro como fuera de la pagina debido a que posee una _Estructura definida_ |
| __section__ | Contenido Contextualizado que solamente funciona dentro de la pagina y se relacion con otro elemento |
| __aside__ | Contenido tangencial que se relaciona indirectamente con sus elementos hermanos, se utiliza para publicidad o sugerencias de contenido |
| __footer__ | Pie de Pagina o Contenido complementario de la pagina, se utiliza para mostrar informacion de contacto, redes sociales, mapa del sitio y derechos de autor |

## Jerarquia CSS

Cada una de las reglas aplicadas con CSS posee una __prioridad segun el tipo de selector utilizado__, es fundamental que las mismas esten _organizadas para facilitar la comprension del diseño_ y no superponer o repetir reglas de forma innecesaria.

| Selector | Descripcion  | Prioridad | Ejemplo |
|--|--|--:|--|
| __tag__ | Selector que afecta a todas la etiquetas del mismo nombre, cuya prioridad es la mas baja | 001 | __header__{ _color: #F00;_ } |
| __class__ | Selector que afecta a todos los elementos que pertenezcan a la misma clase | 010 | __.header__{ _color: #0F0;_ } |
| __id__ | Selector que afecta a los elemento cuyo id sea el indicado (atributo unico) | 100 | __#header__{ _color: #00F;_ } | 
| __!important__ | Regla que aumenta la prioridad del selector para el atributo especidicado | +1000 | h1{ ___color: #F0F_ !important__; } |
| __inline style__ | Valor correspondiente al _estilo unico_ de la etiqueta html, cuya prioridad es la mas alta | +10000 | &lt;h1 __style="_color:#0FF_"__> |

## Tipos de Unidades

Los navegadores soportan cualquier medida de medida existente, pero esto no quiere decir que debamos utilizar todas, ya que cada una se aplica dependiendo de la situacion. Las mismas se utilizan para dar tamaño a los elementos de la pagina, limitar las dimensiones de los mismos e incluso la tipografia de las etiquetas. 

| Unidad | Descripcion | Ejemplos |
|--|--|--|
| __Absolutas__ | Son aquellas que siempre valen lo mismo independientemente del medio donde se reproduzcan. Se utilizan principalmente para definir limites y la mas utilizada es el _px (puntos en pantalla)_ | <ul style="padding:0"><li>__distancia__:mm,cm,pc,in</li><li>__tipografia__:pt</li><li>__hibrida__:px</li></ul> |
| __Relativas__ | Son aquellas que dependen del tamaño de su contenedor o su tipografia. Se utilizan para definir dimensiones o modificar la fuente y las mas utilizadas son _% (porcentaje) y rem (ancho de "M" en :root)_ | <ul style="padding:0"><li>__contenedor__:%</li><li>__tipografia__:em,ex,ch</li><li>__hibrida__:rem</li></ul> |
| __Flexibles__ | Identificadas como unidades relativas, son aquellas que toman de referencia las _dimensiones del viewport_ y se implementan para tipografia flexible y definir alturas. | <ul style="padding:0"><li>__dimension__:vw,vh</li><li>__orientacion__:vmin,vmax</li></ul> |

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