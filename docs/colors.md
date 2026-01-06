# Paleta de Colores

Bootstrap utiliza _colores temáticos predefinidos_ que se aplican mediante __clases de utilidad__ permitiendo estilos rápidos y consistentes; estos colores se basan en __variables Sass__ y se pueden personalizar a través de _mapas de colores y modos_ para una apariencia única y adaptada a la marca.

| color | r | g | b | hex | sample |
|-|-:|-:|-:|-:|:-:|
| primary  | 13 | 110 | 253 | #0d6efd | ![primary](../assets/bg/bs-colors.svg#primary) |
| secondary  | 108 | 117 | 125 | #6c757d | ![secondary](../assets/bg/bs-colors.svg#secondary) |
| success  | 25 | 135 | 84 | #198754 | ![success](../assets/bg/bs-colors.svg#success) |
| info  | 13 | 202 | 240 | #17a2b8 | ![info](../assets/bg/bs-colors.svg#info) |
| warning  | 255 | 193 | 7 | #ffc107 | ![warning](../assets/bg/bs-colors.svg#warning) |
| danger  | 220 | 53 | 69 | #dc3545 | ![danger](../assets/bg/bs-colors.svg#danger) |
| light  | 248 | 249 | 250 | #f8f9fa | ![light](../assets/bg/bs-colors.svg#light) |
| dark  | 33 | 37 | 41 | #212529 | ![dark](../assets/bg/bs-colors.svg#dark) |

## Clases de Utilidad

La paleta de colores se implementa en combinación con las clases de utilidad de Bootstrap y sus respectivas variantes, para ello debemos indicar el atributo correpondiente seguido del nombre del color, opcionalmente podemos agregar algun tipo de modificador, en caso que este disponible.

* __Background__: `bg-#{$color}`, `bg-#{$color}-subtle`
* __Text__: `text-#{$color}`, `text-#{$color}-emphasis`
* __Border__: `border-#{$color}`, `border-#{$color}-subtle`
* __Buttons__: `btn-#{$color}`, `btn-outline-#{$color}`

Las variantes `-subtle` y `-emphasis` son nuevas en Bootstrap 5.3 y están diseñadas para funcionar perfectamente con los modos de color, ya que permiten mostrar versiones sutiles y enfatizadas del color seleccionado que varian segun el tema.

## Modos de Color

A partir de Bootstrap 5.3, se introdujo el soporte nativo para __modos de color__, incluido el popular tema oscuro. Para activarlo, simplemente agrega el atributo `data-bs-theme` al elemento `<html>` o a un contenedor específico.

* __Tema Global__: Aplica el tema elegido a toda la página.
  ```html
  <html data-bs-theme="dark">
    ...
  </html>
  ```
* __Tema en Componente__: Aplica el tema seleccionado a un componente especifico.
  ```html
  <div class="dropdown" data-bs-theme="dark">
    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">Menú Oscuro</button>
    <ul class="dropdown-menu">
      <li><a class="dropdown-item" href="#">Acción</a></li>
    </ul>
  </div>
  ```

## Personalización

Para una personalización mas profunda, se recomienda __utilizar Sass__, ya que de esta manera se pueden sobrescribir las _variables de color predeterminadas_ en tu propio archivo Sass antes de importar el framework. En el siguiente ejemplo se muestra como cambiar los valores de las variables correspondientes al color principal y las acciones que representan peligro, asi como tambien, los colores de texto y fondo para tema oscuro.

```scss
// redefinir colores tematicos
$primary: #66a;
$danger: #a33;
// redefinir fondo y texto para tema oscuro
$body-bg-dark: #333;
$body-color-dark: #eee;
// importar estilos bootstrap
@import "../node_modules/bootstrap/scss/bootstrap";
```

Por ultimo, _compilamos el archivo a CSS_. Esto generara una _hoja de estilos personalizada_ con la nueva paleta de colores, manteniendo toda la funcionalidad de Bootstrap. Para ello podemos utilizar alguna extension como [Compile-Hero](https://marketplace.visualstudio.com/items?itemName=Wscats.eno) o el compilador de consola mediante el comando `sass --watch origen.scss destino.css` reemplazando _origen y destino_ por los nombres correspondientes.

[volver](../readme.md)