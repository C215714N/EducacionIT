# Clases de Utilidad

Las __Utilities__ son clases de CSS de _un solo propósito_ que aplican una única regla de estilo a un elemento. Permiten aplicar __estilos complejos directamente__ en el HTML sin escribir una sola línea de CSS personalizado. Son la base del enfoque _"utility-first"_ de Bootstrap.

## API de Utilidades

Bootstrap 5 incluye una potente __API de Utilidades__ basada en Sass que permite:
* __Generar__ nuevas utilidades para incorporar a los estilos.
* __Modificar__ los valores de las utilidades existentes, como el tamaño de espaciado.
* __Eliminar__ utilidades que no se utilizan para reducir el peso del archivo CSS final.

La configuración se realiza a través de mapas de Sass en un archivo `_variables.scss`.

## Categorías Principales

* __Display__: Controla la propiedad `display`. Por ejemplo, `d-flex`, `d-grid`, `d-block`, `d-none`.
* __Spacing__: Controla el `margin` y `padding`. La sintaxis es `{propiedad}{lados}-{breakpoint}-{tamaño}`.
    * _Propiedad_: `m` para `margin`, `p` para `padding`.
    * _Lados_: `t` (top), `b` (bottom), `s` (start - left), `e` (end - right), `x` (eje-x), `y` (eje-y).
    * _Tamaño_: de `0` a `5` y `auto`.
* __Flexbox__: Un conjunto completo de utilidades para controlar contenedores flexbox y sus hijos. Incluye `flex-direction`, `justify-content`, `align-items`, `flex-grow`, y más.
* __Overflow__: Controla el comportamiento del desbordamiento (`overflow-hidden`, `overflow-auto`).
* __Borders__: Añade o elimina bordes, controla su color y su radio (`rounded-pill`, `border-primary`).
* __Sizing__: Define el ancho (`w-25`, `w-50`, `w-100`, `mw-100`) y el alto (`h-*`, `mh-100`).
* __Text__: Controla alineación (`text-center`), transformaciones (`text-uppercase`), peso (`fw-bold`), y más.
* __Visibility__: Muestra u oculta elementos sin afectar el layout (`.visible`, `.invisible`).

[volver](../readme.md)