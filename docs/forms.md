# Formularios

Los formularios son una parte esencial de la interacción en la web. Bootstrap simplifica enormemente el estilo y la disposición de los formularios, haciéndolos consistentes, accesibles y responsivos.

## Controles

* __form-control__: Estilo global aplicable a la mayoría de los controles de formulario, como input, textarea y select.
  ```html
  <div class="mb-3">
    <label for="emailField" class="form-label">Email</label>
    <input type="email" class="form-control" id="emailField" placeholder="nombre@ejemplo.com">
  </div>
  <div class="mb-3">
    <label for="messageField" class="form-label">Mensaje</label>
    <textarea class="form-control" id="messageField" rows="3"></textarea>
  </div>
  ```
* __form-select__: Los _menus desplegables_ utilizan una clase especifica para asegurar una apariencia consistente en todos los navegadores.
  ```html
  <select class="form-select">
    <option selected hidden>Selecciona una opción</option>
    <option value="1">Uno</option>
    <option value="2">Dos</option>
    <option value="3">Tres</option>
  </select>
  ```
* __form-check__: Los _botones de opcion_ tienen una estructura específica para asegurar que los elementos estén alineados y sean accesibles.
  ```html
  <div class="form-check">
    <input class="form-check-input" type="checkbox" value="" id="checkField">
    <label class="form-check-label" for="checkField">Checkbox por defecto</label>
  </div>
  <div class="form-check">
    <input class="form-check-input" type="radio" name="radio" id="radioField">
    <label class="form-check-label" for="radioField">Radio por defecto</label>
  </div>
  ```

## Validación

Proporciona feedback a los usuarios sobre sus entradas con los estilos de validación de Bootstrap. Añade la clase `.was-validated` al `<form>` para activar los estilos de validación basados en los atributos HTML5 `:invalid` y `:valid`.

```html
<form class="row g-3 was-validated">
  <div class="col-md-6">
    <label for="firstname" class="form-label">Nombre</label>
    <input type="text" class="form-control" id="firstname" value="Cristian" required>
    <!-- Mensaje de validacion -->
    <div class="valid-feedback">¡Correcto!</div>
  </div>
  <div class="col-md-6">
    <label for="lastname" class="form-label">Apellido</label>
    <input type="text" class="form-control" id="lastname" value="Racedo" required>
    <!-- Mensaje contenido Invalido -->
    <div class="invalid-feedback">Por favor, introduce un apellido.</div>
  </div>
</form>
```

[volver](../readme.md)