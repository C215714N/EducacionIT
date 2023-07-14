# Fundamentos WEB

Esto es una guia practica para los alumnos del curso de __Introduccion a HTML y CSS__, donde se recopilara informacion sobre los contenidos vistos durante las clases, ademas de ejercicios para poner en practica los temas tratados durante la capacitacion.

## Herramientas

Antes de continuar necesitaremos de un __editor de codigo__, _paciencia, actitud positiva y muchas ganas de aprender_.

Aqui dejo una lista de algunos editores que pueden utilizar para trabajar y algunas cositas a tener en cuenta con respecto a los mismos.

|Editor | Descripcion |
|--|--|
| [Visual Studio Code](https://code.visualstudio.com) | Perfecto para quienes empiezan en el mundo del desarrollo, instalas y listo para trabajar. |
| [Sublime Text](https://sublimetext.com) | Amigable con los desarrolladores, su interfaz es sencilla pero requiere ciertas nociones. |
| [Atom](https://atom.io) | Ideal para quienes utilizan un sistema de control de versiones, sus pantallas divididas son muy utiles. |
| [notepad++](https://notepad-plus-plus.org/) | Editor minimalista que requiere de poco espacio y bastante personalizable. |
| [Brackets](https://brackets.io) | Desarrollado con Javascript y pensado para ser utilizado por diseñadores web. |
| [VIM](https://www.vim.org/) | Para desarrolladores hardcore capaces de abandonar la GUI y concentrarse en el codigo. |

## Desarrollo frontend

En el mundo del __desarrollo web__ existen varias entidades que funcionan como reguladores del lenguaje, asi como referentes a la hora de escribir codigo, estableciendo lo que se conoce como __buenas practicas__.

> __W3C (World Wide Web Consortium)__ Encargada de definir el estandar y por lo tanto quien regula que elementos deben utilizarse y la sintaxis de los diferentes lenguajes web
>
> __WHATWG (Web Hypertext Application Technology Working Group)__ Fundada por _Mozilla y Apple_ se encarga de manetener y desarrollar HTML, ademas de las APIs para aplicaciones web.

Dentro de este mundo existe lo que se llama __Desarrollo FrontEnd__ que consiste en trabajar el codigo de la pagina web desde la Experiencia e interfaz de usuario, es decir, _el cliente_.

Se compone de aquellos lenguajes que pueden ser interpretados directamente por el navegador sin ninguna otra intervencion por parte del servidor y algunos de estos son:

* __HTML (Hypertext Markup Language)__ El lenguaje de marcado de hipertexto utiliza etiquetas para definir la funcion que cumple cada elementos dentro de la pagina, identificando asi la jerarquia de los mismos para facilitar a los motores de busqueda y al navegador su correcta interpretacion. Este aspecto se conoce como carga semantica y se utiliza para la indizacion de contenidos.
_ejemplo: `<p>parrafo</p>`_

* __CSS (Cascading Styles Sheets)__ Las hojas de estilo en cascada se utilizan para definir el diseño de los elementos representados en la pagina web, utilizando selectores y reglas para esto. El diseño debe planificarse en funcion de la estructura, teniendo en cuenta que este aspecto de la pagina esta destinado para mejorar la Experiencia de usuario mediante la interfaz.
_ejemplo: `p{color:blue;}`_

## Actividades

En este apartado se podran realizar diferentes ejercicios relacionados con los temas dictados en clase, organizados por contenido y donde se pondra a prueba su experiencia en el mundo del desarrollo web.

### Conceptos Basicos
1. Realizar el tipo de lista que corresponda y ordenar, en caso que sea necesario, los siguientes elementos:
   * "edad media(3300 A.C. – 476 D.C)",  "edad antigua (476 – 1492)", "edad contemporanea (1789 – actualidad)", "edad moderna (1492 – 1789)"
   * "Futbol", "Tenis", "Rugbi", "Golf", "Beisbol", "Baloncesto", "Handball"
   * "Argentina", "Chile", "Bolivia", "Brasil", "Uruguay", "Paraguay"
   * "Casper Ruud(4960pts)", "Novak Djokovic (7595pts)", "Carlos Alcaraz (7675pts)", "Daniil Mendeleev (5890pts)", "Stefanos Tsitsipas(4670pts)"

### Estructura de un sitio
1. Crear una sitio web de al menos 3 paginas utilizando la estructura semantica.
2. En cada pagina debe haber un menu de navegacion permita desplazarnos entre las mismas, como por ejemplo:
   * [inicio](index.html)
   * [nosotros](about.html)
   * [galeria](gallery.html)
3. Diferenciar el `<header>` y `<footer>` utilizando un `color` y `background-color` a eleccion
4. Agregar hipervinculos de las redes sociales a eleccion e informacion de copyright
5. Colocar contenido dentro de las diferentes paginas a eleccion.
