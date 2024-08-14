# Maquetador Avanzado

Esto es una guia para los alumnos de la capacitacion __Maquetacion con SASS__ que cursan los dias _lunes y miercoles de 14hs a 17hs_, donde podran revisar los contenidos vistos en clase.

## Tabla de Contenidos

* [Introduccion a la Maquetacion](docs/intro.md)
* [Planificacion del Diseño](docs/design.md)
* [Implementacion del Diseño](docs/layout.md)
* [Selectores Especiales](docs/css.md)

## Ejercicios 

### Planificacion del Diseño

1. Crear una pagina en la que cada una de sus partes cumpla con los siguientes requisitos
    * Cabecera:
        * La cabecera debe tener la misma altura que la ventana
        * La cabecera NO debe medir mas 720px de alto
        * La tipografia debe poder adaptarse al ancho de la ventana
        * La imagen de fondo debe estar fija con respecto a la ventana
    * Contenido:
        * Las secciones no deben superar los 1320px de ancho
        * El contenido debe estar centrado respecto a la ventana
        * Si implementa una barra lateral, no debe ser mayor a 320px
    * Pie de Pagina:
        * La seccion de contacto no debe superar los 540px de ancho
        * Implementar un mapa de contacto con estilo a eleccion
        * Debe poseer una seccion de redes sociales.
2. Crear una galeria de imagenes utilizando alguna de las herramientas aprendidas
3. Insertar los textos "Seccion de " o "realizado por ..." en los encabezados utilizando los pseudoelementos correspondientes

### Implementacion del diseño

1. Crear un sitio que utilice alguna de las siguientes estructuras
    * Navegacion Lateral:
        ```
        "nav header"
        "nav main"
        "nav footer
        ```
    * Navegacion Inferior:
        ```
        "header"
        "main"
        "footer"
        "nav"
        ```
    * Navegacion Superior y contenido Lateral:
        ```
        "nav    nav     nav"
        "aside  header  header"
        "aside  main    main"
        "footer  footer  footer"
        ```
    * Contenido Central:
        ```
        "nav      nav     nav"
        "header   header  header"
        "article  main    aside"
        "footer   footer  footer"
        ```
2. Crear una galeria de elementos que se adapte segun el tamaño de la ventana y colocarla dentro de la seccion principal.
3. Fijar la barra de navegacion a la parte superior o inferior de su contenedor, segun corresponda.
4. Crear un botton flotante de contacto (whatsapp, correo, telegram) y colocarlo a un costado de la pagina.