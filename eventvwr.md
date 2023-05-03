## Windows Event Log

* __Comando:__ eventvwr
* __PowerShell:__ Get-EventLog system  |  Out-GridView
* __Descripcion:__ Herramienta que registra en una base de datos las actividades realizadas por los diferentes usuarios, identificando las mismas segun el resultado de dichas operaciones.

### Vistas Personalizadas

* __Eventos Administrativos:__ Muestra especial en la que sólo se ven las advertencias solicitadas, como eventos críticos, de error y de advertencia de todos los registros administrativos.
    | Opcion | Descripcion |
    |-|-|
    | __Buscar__ | Permite ingresar un nombre evento o palabra clave dentro del control. |
    | __Vaciar__ | Elimina los eventos de un grupo para liberar espacio en el disco duro. |
    | __Importar__ | Admite archivos en formato HTML para agregar a las consultas. |
    | __Exportar__ | Facilita la creacion de un archivo XML para almacenar los datos. |
    | __Propiedades__ | Detalle sobre las caracteristicas de un determinado evento. |

### Registros de Windows

| Categoria | Tipo | Detalle |
|-|-|-|
| __Aplicacion__ | Administrativo | Registra los eventos de las aplicaciones y los servicios que no forman parte del sistema operativo. |
| __Seguridad__ | Administrativo |  Incluye la información de los eventos relacionados con la seguridad del sistema. |
| __Instalacion__ | Operativo | Información de los eventos relacionados a la configuración de roles y características. |
| __Sistema__ | Administrativo | Contiene información de los eventos del sistema y de sus componentes. |
| __Eventos Reenviados__ | Operativo | Almacena la Informacion reenviada desde otros sistemas de la red. |

### Registros de Aplicaciones y Servicios

| Elemento | Descripcion |
|-|-|
| __Nombre__ | Indica el grupo al cual pertenece el evento. |
| __Origen__ | Corresponde a la procedencia del evento. |
| __ID__ | Hace referencia a el identificador unico del evento. |
| __Nivel__ | Categoría a la que pertenece el evento <ul><li>__Crítico__ Este nivel de gravedad está reservado para eventos que indican un fallo crítico del sistema o de la aplicación que requiere atención inmediata.</li><li>__Error__ Se utiliza para eventos que indican un problema grave que requiere atención pero no necesariamente acción inmediata.</li><li>__Aviso__ Indica un problema potencial que los administradores del sistema deben vigilar, incluidas las advertencias de poco espacio en disco y las infracciones de las políticas de seguridad.</li><li>__Verboso__ Se utiliza para eventos que brindan información detallada sobre la actividad del sistema o de la aplicación, por lo general, con fines de resolución de problemas o depuración.</li><li>__Información__ Describe el funcionamiento correcto de una aplicación, un controlador o un servicio.</li></ul> |
| __Usuario__ | Corresponde a la cuenta que ha generado el evento. |
| __Registrado__ | Fecha y hora en la que fue generado el evento. |
| __Categoría__ | Acción realizada durante la ejecución del evento. |
| __Equipo__ | Nombre del host en el que se genero el evento. |
| __Operación__ | Permite identificar la accion realizada. |