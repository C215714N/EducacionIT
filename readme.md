# Fundamentos WEB

Esto es una guia practica para los alumnos del curso de __Introduccion a HTML y CSS__, donde se recopilara informacion sobre los contenidos vistos durante las clases, ademas de ejercicios para poner en practica los temas tratados durante la capacitacion.

## Herramientas

Antes de continuar necesitaremos de un __editor de codigo__, paciencia, actitud positiva y _muchas ganas de aprender_.

Aqui dejo una lista de algunos editores con los que pueden utilizar para trabajar y algunas cositas a tener en cuenta con respecto a los mismos.

* [Visual Studio Code](https://code.visualstudio.com) Editor ideal para quienes empiezan en el mundo del desarrollo, instalas y listo para trabajar.
* [Sublime Text](https://sublimetext.com) Editor amigable con los desarrolladores, con una interfaz sencilla pero requiere de ciertas nociones basicas.
* [Atom](https://atom.io) Editor perfecto para quienes utilizan algun sistema de control de versiones, sus pantallas divididas son muy utiles.
* [notepad++](https://notepad-plus-plus.org/) Editor minimalista que requiere de poco espacio y bastante personalizable, perfecto para la programacion.
* [Brackets](https://brackets.io) Editor desarrollado con Javascript, pensado para ser utilizado por desarrolladores frontend y diseñadores web.
* [VIM](https://www.vim.org/) Editor de consola, solo para los desarrolladores hardcore, capaces de abandonar la GUI y concentrarse en el codigo.

___

## Desarrollo frontend

En el mundo del __desarrollo web__ existen varias entidades que funcionan como reguladores del lenguajes, asi como referentes a la hora de escribir codigo, estableciendo lo que se conoce como __buenas practicas__.

> __W3C (World Wide Web Consortium)__ Encargada de definir el estandar y por lo tanto quien regula que elementos deben utilizarse y la sintaxis de los diferentes lenguajes web
>
> __WHATWG (Web Hypertext Application Technology Working Group)__ Fundada por _Mozilla y Apple_ se encarga de manetener y desarrollar HTML y las APIs para aplicaciones web.

Dentro de este mundo existe lo que se llama __Desarrollo FrontEnd__ que consiste en trabajar el codigo de la pagina web desde la Experiencia e interfaz de usuario, es decir, _el cliente_.

Se compone de aquellos lenguajes que pueden ser interpretados directamente por el navegador sin ninguna otra intervencion por parte del servidor y algunos de estos son:

* __HTML (Hypertext Markup Language)__ El lenguaje de marcado de hipertexto utiliza etiquetas para definir la funcion que cumple cada elementos dentro de la pagina, identificando asi la jerarquia de los mismos para facilitar a los motores de busqueda y al navegador su correcta interpretacion. Este aspecto se conoce como carga semantica y se utiliza para la indizacion de contenidos.
_ejemplo: `<p>parrafo</p>`_

* __CSS (Cascading Styles Sheets)__ Las hojas de estilo en cascada se utilizan para definir el diseño de los elementos representados en la pagina web, utilizando selectores y reglas para esto. El diseño debe planificarse en funcion de la estructura, teniendo en cuenta que este aspecto de la pagina esta destinado para mejorar la Experiencia de usuario mediante la interfaz.
_ejemplo: `p{color:blue;}`_
