# Bootstrap

Esto es una guia teorico/practica para los alumnos del Curso de responsive web design que _cursan los dias lunes y miercoles de 10hs a 12hs_.
Aqui podran consultar los contenidos vistos en clase, ademas de acceder a ejercicios propuestos por el __instructor Cristian Racedo__

## Primeros pasos

Podemos implementar este framework de diferentes maneras, por un lado, utilizando un _link externo_ a los archivos almacenadas en alguna _red de distribucion de contenido (CDN)_; aunque tambien podemos descargar el codigo fuente y paquetes compilados utilizando algun gestor de paquetes o desde la web de [Bootstrap](https://getbootstrap.com/docs/5.3/getting-started/download/)

### CDN JsDelivr

| Archivo | Etiqueta HTML |
|--|--|
| CSS | `<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">` |
| JS | `<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>` |

### Gestores de Paquetes

| Gestor | Comandos
|--|--| 
| __npm__ | npm install bootstrap |
| __yarn__ | yarn add bootstrap |
| __Bundler__ | gem install bootstrap |
| __Composer__ | composer require twbs/bootstrap |
| __NuGet__ | Install-Package bootstrap  |

## Caracteristicas

Bootstrap implementa la metodologia __BEM (Block Element Modifier)__ que consiste en dividir la interfaz de usuario en bloques independientes para la creacion de _componentes escalables y reutilizables_, proponiendo un estilo descriptivo para nombrar cada una de las clases a utilizar, permitiendo así crear un estructura de código consistente.
| Tipo | Descripcion |
|--|--|
| __BLOQUE__ | Corresponde a la raíz de la clase y contenedor de la estructura. |
| __ELEMENTO__ | Una de las piezas que compondrán la estructura de un bloque. |
| __MODIFICADOR__ | Clase que define un estilo alternativo a un elemento específico. |

### Ventajas
* __Especificidad__: Usa un selector único para cada regla, permitiendo menos repeticiones.
* __Independencia__: Los bloques se pueden mover a cualquier, sin afectar los estilos.
* __Reutilización__: Es posible reciclar áreas de código desde un proyecto hacia otro.
* __Simplicidad__: Las convenciones brindan un control absoluto sobre la estructura.

### Desventajas
* __Clases Largas__: En ocasiones podemos encontrarnos cadenas bastante extensas.
* __Aprendizaje__: Para usar esta metodología es necesario dedicar un poco de tiempo a entenderla y practicarla.