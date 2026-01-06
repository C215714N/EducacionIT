# Tablas

Bootstrap ofrece un conjunto de clases para estilizar tablas de datos, mejorando su legibilidad y apariencia. Para crear una tabla básica con un mínimo de estilo, solamente debemos añadir la clase base `.table`.

```html
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Usuario</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Cristian</td>
      <td>Racedo</td>
      <td>@c215714n</td>
    </tr>
  </tbody>
</table>
```

## Clases Contexturales

Bootstrap ofrece varias clases contexturales para personalizar la apariencia de las tablas. Estas clases pueden ser utilizadas para añadir estilos adicionales a las tablas, filas o celdas individuales.

* __table-dark__: Invierte los colores de la tabla, por defecto fondo oscuro y texto claro.
  ```html
  <table class="table table-dark">...</table>
  ```
* __table-striped__: Agrega lineas de cebra a cualquier fila de la tabla dentro del `<tbody>`.
  ```html
  <table class="table table-striped">...</table>
  ```
* __table-hover__: Habilita un efecto al pasar el mouse por encima de las filas de la tabla dentro del `<tbody>`.
  ```html
  <table class="table table-hover">...</table>
  ```

## Diseño Responsive

Para que las tablas se adapten a los distintos tamaños de pantalla y no rompan el layout en dispositivos pequeños, envuelve `.table` en un elemento con la clase `.table-responsive`. Esto añadirá una barra de desplazamiento horizontal si es necesario.

```html
<div class="table-responsive">
  <table class="table">...</table>
</div>
```

[volver](../readme.md)