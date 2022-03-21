# Fundamentos Web
En el mundo del __desarrollo web__ existen varias entidades que funcionan como reguladores del lenguajes, asi como referentes a la hora de escribir codigo, estableciendo lo que se conoce como __buenas practicas__.

* __W3C (World Wide Web Consortium)__ Encargada de definir el estandar y por lo tanto quien regula que elementos deben utilizarse y la sintaxis de los diferentes lenguajes web
* __WHATWG (Web Hypertext Application Technology Working Group)__ Fundada por _Mozilla y Apple_ se encarga de manetener y desarrollar HTML y las APIs para aplicaciones web.

___

## Tabla de contenidos
1. [Fundamentos Web](#fundamentos-web)
2. [Desarrollo FrontEnd](#desarrollo-frontend)
3. [Estructura semantica](#estructura-semantica)
4. [Hojas de Estilo](#hojas-de-estilo)
5. [Formularios](#formularios)
3. [Actividades](#actividades)
    * [Conceptos Basicos](#conceptos-basicos)
    * [Estructura de un sitio](#estructura-de-un-sitio)
    * [Formularios](#formularios)

___

## Desarrollo FrontEnd
* __HTML (Hypertext Markup Language)__ El lenguaje de marcado de hipertexto utiliza etiquetas para definir la funcion que cumple cada elementos dentro de la pagina, identificando asi la jerarquia de los mismos para facilitar a los motores de busqueda y al navegador su correcta interpretacion. Este aspecto se conoce como carga semantica y se utiliza para la indizacion de contenidos.
_ejemplo: `<p>parrafo</p>`_

* __CSS (Cascading Styles Sheets)__ Las hojas de estilo en cascada se utilizan para definir el diseño de los elementos representados en la pagina web, utilizando selectores y reglas para esto. El diseño debe planificarse en funcion de la estructura, teniendo en cuenta que este aspecto de la pagina esta destinado para mejorar la Experiencia de usuario mediante la interfaz.
_ejemplo: `p{color:blue;}`_

## Estructura semantica
Las paginas web no solamente deben ser llamativas para el usuario y deben contar con una interfaz facil de utilizar, tambien deben poseer una estructura correctamente definida.

Por esta razon en la version 5 se agregaron etiquetas que indican el funcionamiento de cada parte de la pagina, de manera tal que le resulte mas facil al motor de busquedar realizar el indexado de los contenidos de nuestro sitio.

* **header** la cabecera indica el contenido introductorio, como encabezados.
* **nav** la navegacion debe poseer los links mas importantes de nuestro sitio.
* **main** el contenido principal puede indicar la informacion mas relevante para el usuario o el contenido mas relevante de la pagina.
* **article** un articulo corresponde al contenido independiente dentro de la pagina, que funciona tanto dentro como fuera de la misma.
* **section** una seccion corresponde al contenido contextualizado, que depende de otros elementos dentro para su correcta comprension.
* **aside** un contenido lateral es aquel que se relaciona tangencialmente con los elementos hermanos, se utiliza  para sugerencias o publicidad
* **footer** el pie de pagina es complementario a lo expuesto anteriormente, contiene las redes sociales, mapas del sitio y formularios/datos de contacto.

## Hojas de Estilo
Una vez definida la estructura de la pagina debemos pasar implementar el diseño de la misma, indicando a que elementos se les deben aplicar los cambios (selectores) y cuales seran los mismos, indicando el atributo a modificar, seguido de su valor (reglas)

* *_estilo interno_* Es aquel que se utiliza dentro de la misma pagina
	* *inline*: Es el mas facil de aplicar y tiene mayor prioridad, ya que debemos indicar a cada etiqueta sus cambios _e.g: `<div style="color: darkblue;">`_ siendo poco practico y lento.
	* *inblock*: Es mas general que el anterior, pero los cambios aplicados solo funcionan dentro de la pagina, _e.g `div{ color: darkblue; }`_ pudiendo afectar a mas de una etiqueta a la vez, debido al selector.
* *_estilo externo_* Es aquel que se implementa en un archivo aparte y asi utilizarlo en diferentes paginas, para poder vincularlo se coloca en la cabecera de pagina una etiqueta como la siguiente _`<link rel="stylesheet" href="styles.css">`_ indicando la ubicacion de la hoja de estilos.

## Formularios
Uno de los elementos fundamentales en las paginas web 2.0 son los formularios, ya que permiten al usuario realizar un intercambio de datos entre cliente y servidor. Si bien existen diferentes tipos y su funcionamiento varia segun este detalle, los elementos que los componen se dividen en los siguientes

* __label__ elemento que identifica la opcion a selecciona o valor a completar.
* __input__ campo monolinea que permite al usuario ingresar o seleccionar un valor
    * <input type="text">  _type="text" (Abc123!#)_
    * <input type="number">  _type="number" (12345)_
    * <input type="email">  _type="email" (user@server)_
    * <input type="password">  _type="password" (****)_
    * <input type="date">  _type="date" (YYYY-MM-DD)_
    * <input type="radio">  _type="radio" (opcion unica)_
    * <input type="checkbox">  _type="checkbox" (opcion multiple)_
* __textarea__ campo utilizado para desarrollar un comentario en varias lineas. <textarea></textarea>
* __select__ campo de lista desplegable para que el usuario seleccione opciones.
  <select>
    <option>FrontEnd</option>
    <option>BackEnd</option>
    <option>Fullstack</option>
  </select>
* __botones__  elementos que permiten la ejecucion de acciones, entre ellas el envio de los formularios. <button>button</button> <input type="reset"> <input type="submit">
___

## Actividades

### Conceptos Basicos
1. Realizar el tipo de lista que corresponda y ordenar, en caso que sea necesario, los siguientes elementos:
    * "edad media(3300 A.C. – 476 D.C)",  "edad antigua (476 – 1492)", "edad contemporanea (1789 – actualidad)", "edad moderna (1492 – 1789)"
    * "Futbol", "Tenis", "Rugbi", "Golf", "Beisbol", "Baloncesto", "Handball"
    * "Argentina", "Chile", "Bolivia", "Brasil", "Uruguay", "Paraguay"
    * "Alexander Zverev(7515pts)", "Novak Djokovic (8465pts)", "Rafael Nadal(6515pts)", "Daniil Mendeleev (8615pts)", "Stefanos Tsitsipas(6325pts)"

### Estructura de un sitio
1. Crear una sitio web de al menos 3 paginas utilizando la estructura semantica.
2. En cada pagina debe haber un menu de navegacion permita desplazarnos entre las mismas.
    * [inicio](index.html)
    * [nosotros](about.html)
    * [galeria](gallery.html)
3. Diferenciar el `<header>` y `<footer>` utilizando un `color` y `background-color` a eleccion
4. Agregar hipervinculos de las redes sociales a eleccion e informacion de copyright
5. Colocar contenido dentro de las diferentes paginas a eleccion.

### Formularios
1. Crear un formulario de registro o inicio de sesion con las siguientes caracteristicas:
  * __nombre de usuario__ entre 5 y 20 caracteres maximo
  * __contraseña__ de al menos 8 caracteres
  * __edad__ con valor minimo de 18
2. Crear un formulario donde se pueda elegir cualquiera de las siguientes opciones:
  * __hobbies:__ "deporte", "cocina", "lectura", "cine", "teatro", "costura", "musica", "jardineria", "meditacion".
  * __musica:__ "cumbia", "reggaeton", "rock", "metal", "salsa", "merengue", "bachata", "cuarteto", "clasica", "tango", "blues", "jazz", "country", "reggae", "disco".
3. Crear un formulario donde solo se pueda elegir una de las siguientes opciones:
  * __area:__ "diseño grafico", "diseño UX/UI", "Desarrollo frontend", "administrador DB" "Desarrollo backend", "desarrollo fullstack".
  * __salario:__ "Cobro, luego Pago y despues subsisto", "menos de 50000", "entre 50000 y 100000", "entre 100000 y 200000", "entre 200000 y 500000", "Ni Jeff Bezos, ni Elon Musk pueden pagarme"
