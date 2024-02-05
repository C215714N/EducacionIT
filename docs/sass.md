# Preprocesadores

* [SASS](#sass)
* [LESS](#less)

## SASS

SassScript es un Lenguaje de script inicialmente diseñado por Hampton Catlin y desarrollado por Natalie Weizenbaum, que proporciona los siguientes mecanismos: variables, nesting (anidamiento), mixins, y herencia de los selectores. La implementación oficial de Sass es open-source, escrita en Ruby y traducido a CSS. La misma consiste en dos sintaxis, la sintaxis indentada y los ficheros SCSS que tienen las extensiones .sass y .scss respectivamente.

### Variables

Son una _forma de almacenar información_, como colores, fuentes o cualquier valor CSS que creas que se necesite reutilizar reutilizar. Sass usa el __símbolo $__ para convertir cualquier elemento en una variable.

```scss
// Declaracion
$color: #eee;
$bg: #333;
// Implementacion
.dark{
    color: $color;
    background-color: $bg;
}
```

### Nesting

Cuando se escribe codigo HTML, se puede notar una jerarquía visual y anidada clara, mientras que esto no es asi para CSS. Por lo tanto, es una manera que permite que nuestra hoja de estilos siga la __misma jerarquía visual del HTML__, generando selectores especificos en el proceso.

```scss
// contenedor principal
nav{
    a{ 
        text-decoration: none;
        color: #eee;
    }
    ul{ 
        list-style: none;
        padding: 0;
    }
}
```

### Mixin

Funciones que permiten crear __grupos de declaraciones CSS__ que necesiten ser reutilizadas, incluso se les pueden pasar valores para hacer una mezcla más flexible; permitiendo que el codigo SASS se vea mucho mas limpio.

```scss
// Definicion (valores predeterminados)
@mixin box-sizing($m:0,$p:0,$b:0){
    margin: $m; 
    border: $b;
    padding: $p;
}
// Inclusion sin parametros
.reset{
    @include .box-sizing;
}
// Inclusion con parametros
.regular{
    @include box-sizing(.25rem, 1rem);
}
```

### Herencia

La __regla @extend__ permite _compartir un conjunto de propiedades CSS_ de un selector a otro, creando un selector compuesto, en lugar de copiar las propiedades de este a los elementos en los que se aplica. Se puede utilizar un selector con el __simbolo %__ para evitar la aparicion de este en el codigo resultante.

```scss
// selector base
%message{
    border-radius: .5rem;
    padding: 1rem;
    color: #333c;
}
// extension de selector
.error{
    @extend %message;
    background-color: #c335;
}
.warning{
    @extend %message;
    background-color: #da35;
}
.success{
    @extend %message;
    background-color: #3c65;
}
```

### Loops

La __regla @for__ cuenta desde un número a otro y _evalúa un bloque para cada número intermedio_. Cada número a lo largo del camino se asigna al nombre de la variable. Si se utiliza __to__, _se excluye_ el número final; si se utiliza __through__, _está incluido_.

```scss
$cols: 12;
// Condicion
@for $i from 1 through $cols{
    // Iteracion
    .col-#{$i}{
        width: percentage($i/$cols);
    }
}
```

La __regla @each__ facilita la emisión de estilos o la evaluación de código para cada elemento de una lista o cada par en un mapa. Es ideal para estilos repetitivos que sólo tienen algunas variaciones entre ellos.

```scss
// Lista de Valores (Array)
$colors: red, green, blue, cyan, magenta, yellow;
// Extraccion de valores
@each $value in $colors{
    .bg-#{$value}{
        background-color: $value;
    }
}
```

## LESS

Lenguaje de hojas de estilo dinámico diseñado por Alexis Sellier, que proporciona los siguientes mecanismos: variables, anidamiento, operadores, mixins y funciones. La principal diferencia entre Less y otros precompiladores CSS es que Less permite la compilación en tiempo real vía less.js por lo que se puede ejecutar del lado del cliente y del lado del servidor, o se puede compilar en CSS sin formato.

[volver](../readme.md)