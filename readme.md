# Maquetador Avanzado

Esto es una guia para los alumnos de la capacitacion __Maquetado con SASS__ que cursan los dias _lunes y miercoles de 20hs a 22hs_, donde podran revisar los contenidos vistos en clase.

## Tabla de Contenidos

* [Estructura Semántica](#estructura-semántica)
* [Jerarquia CSS](#jerarquia-css)
* [Background](#background)

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
