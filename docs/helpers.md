# Clases de Ayuda

Los __Helpers__ son clases que permiten modificar la apariencia o el comportamiento de los componentes de una manera no estándar. A diferencia de las utilidades, que aplican una sola propiedad CSS, los helpers pueden tener efectos más complejos o aplicar reglas CSS específicas para resolver problemas comunes.

* __Ratio__: Permite crear contenedores que mantienen una relación de aspecto específica (ej. 16x9, 1x1). Ideal para videos o imágenes incrustadas.
  ```html
  <div class="ratio ratio-16x9">
    <iframe src="..." title="YouTube video"></iframe>
  </div>
  ```
* __Stretched link__: Hace que un elemento contenedor se pueda hacer clic en toda su área, actuando como un solo enlace. Se aplica a un enlace (`<a>`) dentro de un contenedor con `position: relative`.
  ```html
  <div class="card position-relative" style="width: 18rem;">
    <div class="card-body">
      <h5 class="card-title">Tarjeta Enlazada</h5>
      <p>Toda esta tarjeta es ahora un enlace clickeable.</p>
      <a href="#" class="stretched-link"></a>
    </div>
  </div>
  ```
* __Text truncation__: acorta los textos largos con puntos suspensivos.
  ```html
  <div class="d-inline-block text-truncate" style="max-width: 150px;">
    Este texto es muy largo y será truncado si no cabe en el espacio.
  </div>
  ```
* __Clearfix__: Soluciona problemas de layout con elementos flotantes sin necesidad de añadir `divs` vacíos. Se aplica al contenedor padre.
  ```html
  <div class="bg-light clearfix p-2">
    <button type="button" class="btn btn-secondary float-start">Flota a la izquierda</button>
    <button type="button" class="btn btn-secondary float-end">Flota a la derecha</button>
  </div>
  ```
* __Visually hidden__: Oculta un elemento visualmente, pero lo mantiene disponible para tecnologías de asistencia como los lectores de pantalla. Es clave para la accesibilidad.
  ```html
  <a class="visually-hidden" href="#content">Saltar al contenido principal</a>
  ```
* __Focus ring__: Permite crear anillos de enfoque (`outline`) personalizados y accesibles, controlando su color y estilo al hacer foco en un elemento.
  ```html
  <button class="btn btn-primary focus-ring">Botón con anillo de enfoque</button>
  ```
* __Icon link__: Un helper para estilizar enlaces que contienen iconos SVG, alineándolos correctamente y añadiendo un ligero efecto al pasar el cursor.
  ```html
  <a href="#" class="icon-link">
    <svg class="icon icon-link__icon" viewBox="0 0 24 24">
      <path d="M12 2L2 22h20L12 2z"/>
    </svg>
    Enlace con icono
  </a>
  ```

[volver](../readme.md)