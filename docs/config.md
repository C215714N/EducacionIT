# Configuracion Inicial

## JsDelivr

Es una __Red Publica de Distribucion de Contenido__ para proyectos de software de código abierto, se encuentra estrechamente _integrada con Github y NPM_, proporcionando automáticamente un servicio confiable para casi todos los proyectos de código abierto que existen.

Gracias al _CDN_ se puede omitir la descarga del codigo fuente utilizando una version en caché de CSS y JS compilados de Bootstrap. Los desarrolladores pueden acceder a los archivos de BootstrapCDN utilizando los siguientes enlaces.

```html
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous"> 
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
```

## Package Managers

Utilizando cualquier __Gestor de Paquetes__ podemos descargar Bootstrap para obtener el código fuente, los archivos CSS y JavaScript compilados, ademas de los _archivos minificados_. Esto es muy util si necesitamos los archivos base para editarlos o evitar una conexion de origen cruzado.

| Gestor | Comando |
|-|-|
| __npm__ | npm install bootstrap |
| __yarn__ | yarn add bootstrap |
| __Bundler__ | gem install bootstrap |
| __Composer__ | composer require twbs/bootstrap |
| __NuGet__ | Install-Package bootstrap |

[volver](../readme.md)