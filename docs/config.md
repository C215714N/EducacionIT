# Configuracion Inicial

## JsDelivr

Es una __Red Publica de Distribucion de Contenido__ para proyectos de software de código abierto, se encuentra estrechamente _integrada con Github y NPM_, proporcionando automáticamente un servicio confiable para casi todos los proyectos de código abierto que existen.

Gracias al _CDN_ se puede omitir la descarga del codigo fuente utilizando una version en caché de CSS y JS compilados de Bootstrap. Los desarrolladores pueden acceder a los archivos de BootstrapCDN utilizando los siguientes enlaces.

```html
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> 
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
```

## Package Managers

Utilizando cualquier __Gestor de Paquetes__ podemos descargar Bootstrap para obtener el código fuente, los archivos CSS y JavaScript compilados, ademas de los _archivos minificados_. Esto es muy util si necesitamos los archivos base para editarlos o evitar una conexion de origen cruzado.

| Gestor | Comando |
|-|-|
| npm | npm install bootstrap |
| yarn | yarn add bootstrap |
| Bundler | gem install bootstrap |
| Composer | composer require twbs/bootstrap |
| NuGet | Install-Package bootstrap |

[volver](../readme.md)