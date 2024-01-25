# Maquetador Avanzado

Esto es una guia para los alumnos de la capacitacion __Maquetado con SASS__ que cursan los dias _lunes y miercoles de 20hs a 22hs_, donde podran revisar los contenidos vistos en clase.

## Tabla de Contenidos

* [Estructura Semántica](#estructura-semántica)
* [Jerarquia CSS](#jerarquia-css)
* [Tipos de Unidades](#tipos-de-unidades)
* [Background](#background)
* [Flexbox](#flexbox)
* [CSS Grid](#css-grid)
* [Position](#position)
* [Selectores Especiales](#selectores-css)

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

## Selectores Especiales

### Combinadores

Símbolo que permite combinar dos o más selectores CSS, formando uno más complejo y potente. Se llaman así porqué proporciona una relación útil entre ellos y la ubicación del contenido en el documento.

| selector | descripcion | ejemplo | 
|--|--|--|
| __*__ | selecciona a todos los elementos | _div __*__ {...}_ |
| __>__ | elementos que sean hijos directos | _ul __>__ li {...}_ |
| __+__ | elemento que se encuentre al lado | _h1 __+__ p {...}_ |
| __~__ | elementos que sean hermanos  | _header __~__ p{...}_ |
| __[^]__ | atributos que empiecen con un valor | _a\[href **^=**"http"\]_ |
| __[*]__ | atributos que coincidan con un valor | _a\[href ***=**"www"\]_ |
| __[$]__ | atributos que terminen con un valor | _a\[href **$=**".com"\]_ |

### PseudoClases

Instancia o caracteristica de un elemento, ayudan a reducir el exceso de clases y proporcionan un marcado más flexible y fácil de mantener. Pueden interpretarse como el estado del mismo, actuando como si se hubiese aplicado una clase, ademas que poseen la misma jerarquia que estas.

| selector | Descripcion |
|--|--|
| __:hover__ | interviene si el usuario _pasa el cursor_ sobre un elemento |
| __:focus__ | interviene si el usuario _selecciona el elemento_ con los controles del teclado |
| __:link__ | __hipervinculo__ que aún no se ha visitado por el usuario |
| __:active__ | __hipervinculo__ o __boton__ cuando se presiona el boton primario del mouse |
| __:visited__ | __hipervinculo__ que ha sido visitado por el usuario |
| __:checked__ | __input__ de tipo _radio_ o _checkbox_ o etiqueta __option__ seleccionado |
| __:valid__ | _campo de formulario_ que cumple con sus atributos de validacion |
| __:invalid__ | _campo de formulario_ que no cumple con alguno de sus atributos de validacion |
| __:first-child__ | corresponde al _primer elemento_ entre un grupo de elementos hermanos |
| __:last-child__ | corresponde al _ultimo elemento_ entre un grupo de elementos hermanos |
| __:first-of-type__ | _primer elemento de su tipo_ entre un grupo de elementos hermanos |
| __:last-of-type__ | ultimo elemento de su t_ipo entre un grupo de elementos hermanos |
| __:nth-child(n)__ | uno o más elementos en función de su posición entre un grupo de hermanos |
| __:nth-last-child(n)__ | uno o más elementos en función de su posición, contando desde el final |

### PseudoElementos

Parte o elemento dentro de una etiqueta que, a diferencia de las pseudoclases, no describen un estado especial, sino que, permiten añadir estilos a una parte concreta del documento, como si se hubiese añadido un elemento HTML totalmente nuevo en el marcado.

| selector | Descripcion |
|--|--|
| __:before__ | permite agregar elementos antes del contenido de la etiqueta |
| __:after__ | permite agregar elementos despues del contenido de la etiqueta |
| __:first-line__ | corresponde a la primera línea de un elemento de bloque |
| __:first-letter__ | corresponde a la primera letra del contenido un elemento de bloque |
| __:placeholder__ | representa al _texto provisional_ en una etiqueta __input__ o __textarea__. |
| __:marker__ | corresponde a la _caja de marcadores_ de un __elemento de la lista__ |