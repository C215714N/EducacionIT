# Componentes

Son __elementos reutilizables__ que forman parte de la _interfaz de usuario_, como botones, tarjetas y menús de navegación, que se pueden combinar para crear diseños complejos. Bootstrap incluye una amplia gama de componentes listos para usar, diseñados para ser _flexibles, accesibles y responsivos_, entre los cuales se encuentran:

* __Accordion__: Un componente que permite _mostrar y ocultar secciones_ de contenido.
  ```html
  <div class="accordion" id="accordionExample">
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingOne">
        <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#collapseOne">Accordion Item</button>
      </h2>
      <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
        <div class="accordion-body">Accordion Item</div>
      </div>
    </div>
  </div>
  ```
* __Alerts__: _Mensajes contextuales_ para acciones típicas del usuario.
  ```html
  <div class="alert alert-primary" role="alert">
    A simple primary alert—check it out!
  </div>
  ```
* __Buttons__: Estilos de botones _para acciones_ en formularios, diálogos, y más.
  ```html
  <button type="button" class="btn btn-primary">Primary</button>
  ```
* __Card__: Un contenedor de _contenido flexible y extensible_.
  ```html
  <div class="card">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    </div>
  </div>
  ```
* __Carousel__: Una galeria para _navegar en bucle_ a través de sus elementos.
  ```html
  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
    </div>
  </div>
  ```
* __Dropdowns__: Menús desplegables para _seleccionar opciones_.
  ```html
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" id="dropdownMenuButton" data-bs-toggle="dropdown">Dropdown button</button>
  </div>
  ```
* __Modal__: Diálogos de JavaScript para _notificaciones_ o contenido personalizado.
  ```html
  <div class="modal fade" id="exampleModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">...</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>  
    </div>
  </div>
  ```
* __Navbar__: Un contenedor de _navegacion responsive_ que puede incluir la marca del sitio, enlaces, y más.
  ```html
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </nav>
  ```
* __Offcanvas__: Un contenedor que _se despliega desde el lado_ de la pantalla.
  ```html
  <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title">Offcanvas</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      ...
    </div>
  </div>
  ```
* __Pagination__: Se utiliza para _navegar entre páginas_ mediante enlaces alineados horizontalmente.
  ```html
  <nav aria-label="Page navigation example">
    <ul class="pagination">
      <li class="page-item"><a class="page-link" href="#">Previous</a></li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul>
  </nav>
* __Placeholder__: Muestra _contenido de reemplazo_ mientras se carga el contenido real o este no esta disponible.
  ```html
  <div class="placeholder"></div>
  ```
* __Popover__: Textos de ayuda que aparecen cuando _el usuario pasa el mouse_ sobre un elemento.
  ```html
  <button type="button" class="btn btn-secondary" data-bs-toggle="popover" data-bs-content="And here's some amazing content. It's very engaging. Right?" data-bs-placement="top">
    Click to toggle popover
  </button>
  ```
* __Progress__: Un componente para mostrar el progreso de una tarea.
  ```html
  <div class="progress">
    <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
  </div>
* __Spinners__: Indicadores de _estado de carga_ con animacion.
  ```html
  <div class="spinner-border" role="status">
    <span class="visually-hidden">Loading...</span>
  </div>
* __Toast__: Notificaciones temporales que aparecen en la _parte inferior derecha_ de la pantalla.
  ```html
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <strong class="me-auto">Bootstrap</strong>
      <small>11 mins ago</small>
      <button class="btn-close" data-bs-dismiss="toast"></button>
    </div>
  </div>
  ```
* __Tooltip__: Textos de ayuda que aparecen cuando _el usuario pasa el mouse_ sobre un elemento.
  ```html
  <button class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="Tooltip on top">
    Tooltip on top
  </button>
  ```

La mayoría de los componentes se pueden __personalizar con clases de utilidad__ para ajustar el espaciado, los colores y otros aspectos visuales.

[volver](../readme.md)