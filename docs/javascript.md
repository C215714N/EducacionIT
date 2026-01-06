# JavaScript Integrado

Bootstrap utiliza JavaScript para dar vida a muchos de sus componentes interactivos, como modales, carousels y dropdowns. Desde Bootstrap 5, __jQuery ya no es una dependencia__, lo que facilita su integración en proyectos modernos.

## Activación Declarativa

La forma más común y sencilla de usar los componentes JavaScript de Bootstrap es a través de los _data attributes_ directamente en el HTML. Esto te permite activar y configurar componentes sin escribir una sola línea de JavaScript.

| dataset | descripcion | ejemplo |
|-|-|-|
| __data-bs-toggle__ | Activa el componente alternando su estado | `modal` `dropdown` `collapse` |
| __data-bs-target__ | Indica el selector del elemento objetivo del componente | `#elementId` `.elementClass` `tagName`|
| __data-bs-dismiss__ | Cierra el componente padre en el que se encuentra | `modal` `offcanvas` `alert` |
| __data-bs-backdrop__ | Configura el estilo de fondo del modal/offcanvas | `true` `false` `static` |

```html
<!-- Boton mostrar -->
<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalElement">Abrir Modal</button>
<!-- Elemento Modal -->
<div class="modal fade" id="modalElement" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="modalTitle">Título</h2>
        <button class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">...</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button class="btn btn-primary">Guardar cambios</button>
      </div>
    </div>
  </div>
</div>
```

## Activación Programática

Para un _control más avanzado_ o para integrar Bootstrap con __frameworks de JavaScript__, puedes usar la __API de JavaScript__ directamente. Cada componente tiene un _constructor y métodos específicos_.

```javascript
/* Declaraciones */
const modalElement = document.getElementById('modalElement'); // elemento modal
const modalShowBtn = document.getElementById('modalShowBtn'); // boton mostrar
const modalHideBtn = document.getElementById('modalHideBtn'); // boton ocultar
const modalToggleBtn = document.getElementById('modalToggleBtn'); // boton alternar
const modal = new bootstrap.Modal(modalElement); // Instancia de Modal
/* Eventos */
modalShowBtn.onclick = () => modal.show(); // Mostrar elemento modal
modalHideBtn.onclick = () => modal.hide(); // Ocultar elemento modal
modalToggleBtn.onclick = () => modal.toggle(); // Alternar estado
```

## Eventos

Los componentes JavaScript de Bootstrap emiten __eventos personalizados__ que puedes escuchar para ejecutar código en momentos específicos del _ciclo de vida_ del componente.

```javascript
modalElement.addEventListener('shown.bs.modal', () => console.log('El modal se ha abierto completamente.'));
modalElement.addEventListener('hidden.bs.modal', () => console.log('El modal se ha cerrado completamente.'));
```

## Datasets

Puedes acceder a la instancia del componente JavaScript, asi como tambien a los       métodos y propiedades de un elemento DOM a través del atributo `data`.

```javascript
const modalInstance = bootstrap.Modal.getInstance(modalElement); // Obtiene la instancia del componente

if (modalInstance) {
  console.log('El componente está activo:', modalInstance._is = true); // Acceso a propiedades internas
}
```

[volver](../readme.md)