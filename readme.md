# Maquetacion Web

Continuacion de la guia practica para los alumnos que finalizaron el curso de __Fundamentos Web__, y comienzan con __Maquetacion Web con HTML y CSS__ donde se recopilara informacion sobre los contenidos vistos durante las clases, ademas de ejercicios practicos y consejos a tener en cuenta al momento de poner en practica los temas.

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

| Flexbox |Descripcion|
|--|--|
| __justify-Content__ | propiedad usada para alinear los ítems en el eje principal. El valor inicial es flex-start que alineará los ítems al inicio del margen del contenedor |
| __align-items__ | propiedad que alinea los ítems sobre el eje cruzado. El valor inicial es stretch y haciendo que los ítems se ajusten a la altura del más alto, para llenar el contenedor |
| __flex-direction__ | propiedad que permite cambiar la dirección de los ítems. El valor row-reverse mantiene el despliegue a lo largo de la fila, pero el inicio y final quedarán invertido |

## CSS Grid

__CSS Grid layout__ contiene funciones de diseño dirigidas a los _desarrolladores de aplicaciones web_. El CSS grid se puede utilizar para lograr muchos diseños diferentes. También se destaca por permitir __dividir una página en áreas o regiones principales__, por definir la relación en términos de tamaño, posición y capas entre partes de un control construido a partir de primitivas HTML.

| Grid | Descripcion |
|__grid-template-columns__ | Propiedad que especifica el número y ancho de las columnas en un diseño de cuadrícula, en una lista separada por espacios |
|__grid-template-rows__ | Propiedad que especifica el número y las alturas de las filas en un diseño de cuadrícula, donde cada valor especifica la altura de las filas |
|__grid-template-areas__ | Propiedad que especifica áreas dentro del diseño de cuadrícula, donde cada área está definida por apóstrofes |

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