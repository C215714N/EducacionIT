# Fundamentos web
html | css

## Estructura semantica
Las paginas web no solamente deben ser llamativas para el usuario y deben contar con una interfaz facil de utilizar, tambien deben poseer una estructura correctamente definida.

Por esta razon en la version 5 se agregaron etiquetas que indican el funcionamiento de cada parte de la pagina, de manera tal que le resulte mas facil al motor de busquedar realizar el indexado de los contenidos de nuestro sitio.

* **header** la cabecera indica el contenido introductorio, como encabezados.
* **nav** la navegacion debe poseer los links mas importantes de nuestro sitio.
* **main** el contenido principal puede indicar la informacion mas relevante para el usuario o el contenido mas relevante de la pagina.
* **article** un articulo corresponde al contenido independiente dentro de la pagina, que funciona tanto dentro como fuera de la pagina.
* **section** una seccion corresponde al contenido contextualizado, es decir que depende de otros elementos dentro de la pagina para su correcta comprension.
* **aside** un contenido lateral es aquel que se relaciona tangencialmente con los elementos hermanos, se utiliza principalmente para sugerencias o publicidad
* **footer** el pie de pagina indica el contenido final y es complementario a lo expuesto anteriormente, se suelen colocar aqui las redes sociales, mapas del sitio y formularios/informacion de contacto.

## Selectores y reglas
Una vez definida la estructura de la pagina debemos pasar implementar el diseño de la misma, indicando a que elementos se les deben aplicar los cambios (selectores) y cuales seran los mismos, indicando el atributo a modificar, seguido de su valor (reglas)

* *_estilo interno_* Es aquel que se utiliza dentro de la misma pagina
	* *inline*: Es el mas facil de aplicar y tiene mayor prioridad, ya que debemos indicar a cada etiqueta sus cambios _e.g: `<div style="color: darkblue;">`_ siendo poco practico y lento.
	* *inblock*: Es mas general que el anterior, pero los cambios aplicados solo funcionan dentro de la pagina, _e.g `div{ color: darkblue; }`_ pudiendo afectar a mas de una etiqueta a la vez, debido al selector.
* *_estilo externo_* Es aquel que se implementa en un archivo aparte y asi utilizarlo en diferentes paginas, para poder vincularlo se coloca en la cabecera de pagina una etiqueta como la siguiente _`<link rel="stylesheet" href="styles.css">`_ indicando la ubicacion de la hoja de estilos.

## Ejercicios
1. Crear una sitio web de al menos 3 paginas _por ejemplo: index.html, about.html, gallery.html_, las mismas deben respetar la estructura semantica y en cada una debe haber un menu de navegacion que nos permita desplazarnos entre las mismas
	* <a href="#">inicio</a>
	* <a href="about.html">nosotros</a>
	* <a href="gallery.html#">galeria</a>
2. Diferenciar el `<header>` y `<footer>` de las diferentes paginas utilizando un `color` y `background-color` a eleccion y colocar contenido dentro de las mismas a gusto.
3. Agregar hipervinculos de las redes sociales a eleccion e informacion de _copyright_
