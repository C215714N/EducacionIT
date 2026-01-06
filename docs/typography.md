# Tipografia

Bootstrap proporciona un sistema de __tipografía simple y escalable__ para el texto de tu sitio web, incluyendo encabezados, párrafos, listas y más.

* __Headings__: Todos los encabezados HTML, de `<h1>` a `<h6>`, están disponibles y estilizados. También existen las clases de `.h1` a `.h6` para igualar el estilo de fuente de un encabezado pero no se pueda usar el elemento HTML asociado.
  ```html
  <h1>Encabezado h1</h1>
  <h2>Encabezado h2</h2>
  <h3>Encabezado h3</h3>
  <h4>Encabezado h4</h4>
  <h5>Encabezado h5</h5>
  <h6>Encabezado h6</h6>
  ```
* __Display Headings__: Para encabezados que realmente destaquen, Son más grandes y ligeramente más opinados que los encabezados normales. Se utilizan para destacar el título de una sección o página.
  ```html
  <h1 class="display-1">Display 1</h1>
  <h1 class="display-2">Display 2</h1>
  <h1 class="display-3">Display 3</h1>
  ```
* __Lead__: Es ligeramente más grande y tiene más peso que un párrafo normal. Se utiliza para destacar el párrafo principal de una seccion o pagina.
  ```html
  <p class="lead">Este es un párrafo principal. </p>
  ```
* __Blockquotes__: Se utilizan para citar bloques de contenido de otra fuente o referencias dentro de tu documento. 
  ```html
  <blockquote class="blockquote">
    <p> Una cita bien conocida, contenida en un elemento blockquote.</p>
    <footer class="blockquote-footer">Alguien famoso en <cite title="Fuente">Título de la Fuente</cite></footer>
  </blockquote>
  ```
* __Listas__: Bootstrap estiliza listas ordenadas, desordenadas y de definición. Tambien se pueden utilizar las clases de `.list-unstyled` para eliminar los estilos por defecto y `.list-inline` para mostrar los elementos en una sola linea.
  ```html
  <ul class="list-inline">
    <li class="list-inline-item">Este es un item.</li>
    <li class="list-inline-item">Y otro.</li>
  </ul>
  ```
* __Inline Text__: Estiliza elementos de texto comunes, tambien se pueden utilizar las clases correspondientes a los nombres de las etiquetas para aplicar los mismos estilos o clases de utilidad.
  ```html
  <mark class="mark">Resalta texto</mark>
  <del class="text-decoration-line-through">Texto tachado</del>
  <ins class="text-decoration-underline">Texto subrayado</ins>
  <small class="small">Texto más pequeño</small>
  <strong class="fw-bold">Texto en negrita</strong>
  <em class="fs-italic">Texto en cursiva</em>
  <abbr>Abreviatura</abbr>
  ```

[volver](../readme.md)