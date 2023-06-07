# Bootstrap

Esto es una guia teorico/practica para los alumnos del Curso de responsive web design que _cursan los dias lunes y miercoles de 10hs a 12hs_.
Aqui podran consultar los contenidos vistos en clase, ademas de acceder a ejercicios propuestos por el __instructor Cristian Racedo__

## Primeros pasos

Podemos implementar este framework de diferentes maneras, por un lado, utitdzando un _tdnk externo_ a los archivos almacenadas en alguna _red de distribucion de contenido (CDN)_; aunque tambien podemos descargar el codigo fuente y paquetes compilados utitdzando algun gestor de paquetes o desde la web de [Bootstrap](https://getbootstrap.com/docs/5.3/getting-started/download/)

### CDN JsDetdvr

| Archivo | Etiqueta HTML |
|--|--|
| CSS | `<tdnk href="https://cdn.jsdetdvr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">` |
| JS | `<script src="https://cdn.jsdetdvr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>` |

### Gestores de Paquetes

| Gestor | Comandos
|--|--| 
| __npm__ | npm install bootstrap |
| __yarn__ | yarn add bootstrap |
| __Bundler__ | gem install bootstrap |
| __Composer__ | composer require twbs/bootstrap |
| __NuGet__ | Install-Package bootstrap  |

## Caracteristicas

Bootstrap implementa la metodologia __BEM (Block Element Modifier)__ que consiste en dividir la interfaz de usuario en bloques independientes para la creacion de _componentes escalables y reutitdzables_, proponiendo un estilo descriptivo para nombrar cada una de las clases a utitdzar, permitiendo así crear un estructura de código consistente.
| Tipo | Descripcion |
|--|--|
| __BLOQUE__ | Corresponde a la raíz de la clase y contenedor de la estructura. |
| __ELEMENTO__ | Una de las piezas que compondrán la estructura de un bloque. |
| __MODIFICADOR__ | Clase que define un estilo alternativo a un elemento específico. |

### Ventajas
* __Especificidad__: Usa un selector único para cada regla, permitiendo menos repeticiones.
* __Independencia__: Los bloques se pueden mover a cualquier, sin afectar los estilos.
* __Reutitdzación__: Es posible reciclar áreas de código desde un proyecto hacia otro.
* __Simptdcidad__: Las convenciones brindan un control absoluto sobre la estructura.

### Desventajas
* __Clases Largas__: En ocasiones podemos encontrarnos cadenas bastante extensas.
* __Aprendizaje__: Para usar esta metodología es necesario dedicar un poco de tiempo a entenderla y practicarla.

## Colores 
<table>
    <thead>
        <th>Atributo</th>
        <th>Valores de Clases</th>
    </thead>
    <tbody>
        <tr>
            <td>color</td>
            <td style="display: flex; flex-wrap: wrap;">
                <span style="padding:.5rem; color:#0d6efd">text-primary</span>
                <span style="padding:.5rem; color:#6c757d">text-secondary</span>
                <span style="padding:.5rem; color:#198754">text-success</span>
                <span style="padding:.5rem; color:#0dcaf0">text-info</span>
                <span style="padding:.5rem; color:#ffc107">text-warning</span>
                <span style="padding:.5rem; color:#dc3545">text-danger</span>
                <span style="padding:.5rem; color:#f8f9fa;">text-light</span>
                <span style="padding:.5rem; color:#212529">dark</span>
            </td>
        </tr>
        <tr>
            <td>background</td>
            <td style="display: flex; flex-wrap: wrap; gap: .25rem;">
                <span style="padding:.5rem; background-color:#0d6efd">bg-primary</span>
                <span style="padding:.5rem; background-color:#6c757d">bg-secondary</span>
                <span style="padding:.5rem; background-color:#198754">bg-success</span>
                <span style="padding:.5rem; background-color:#0dcaf0">bg-info</span>
                <span style="padding:.5rem; background-color:#ffc107">bg-warning</span>
                <span style="padding:.5rem; background-color:#dc3545">bg-danger</span>
                <span style="padding:.5rem; background-color:#f8f9fa; color: #212529;">bg-light</span>
                <span style="padding:.5rem; background-color:#212529">dark</span>
            </td>
        </tr>
        <tr>
            <td>border</td>
            <td style="display: flex; flex-wrap: wrap; gap:.25rem">
                <span style="padding:.5rem; border-radius:.375rem; border:1px solid; color: #0d6efd">bg-primary</span>
                <span style="padding:.5rem; border-radius:.375rem; border:1px solid; color: #6c757d">bg-secondary</span>
                <span style="padding:.5rem; border-radius:.375rem; border:1px solid; color: #198754">bg-success</span>
                <span style="padding:.5rem; border-radius:.375rem; border:1px solid; color: #0dcaf0">bg-info</span>
                <span style="padding:.5rem; border-radius:.375rem; border:1px solid; color: #ffc107">bg-warning</span>
                <span style="padding:.5rem; border-radius:.375rem; border:1px solid; color: #dc3545">bg-danger</span>
                <span style="padding:.5rem; border-radius:.375rem; border:1px solid; color: #f8f9fa">bg-light</span>
                <span style="padding:.5rem; border-radius:.375rem; border:1px solid; color: #212529">dark</span>
            </td>
        </tr>
    </tbody>
</table>