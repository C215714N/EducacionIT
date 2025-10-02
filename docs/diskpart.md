# Sistema de Archivos (Windows)

Los sistemas Operativos de Microsoft utilizan una __estructura jerárquica de archivos__, similar a otros; pero con diferencias clave en la organización y administración de los datos.

## Estructura del Sistema de Archivos

Windows no sigue el estándar __Filesystem Hierarchy Standard (FHS)__ como Linux, sino que organiza sus archivos en __unidades de almacenamiento__ (volúmenes) y directorios específicos.

| Directorio | Descripción |
|--|--|
| __C:\\__ | Unidad principal del sistema, equivalente a la raíz en Linux. Contiene el sistema operativo y archivos esenciales. |
| __C:\Windows__ | Directorio principal del sistema operativo, donde se almacenan archivos críticos para su funcionamiento. |
| __C:\Program Files__ | Contiene las aplicaciones instaladas en el sistema. En versiones de 64 bits, existe también `C:\Program Files (x86)` para programas de 32 bits. |
| __C:\Users__ | Directorio que almacena los perfiles de usuario, incluyendo configuraciones, documentos y datos personales. |
| __C:\System32__ | Subdirectorio dentro de `C:\Windows`, que contiene archivos esenciales del sistema y ejecutables críticos. |
| __C:\Temp__ | Directorio temporal donde se almacenan archivos temporales generados por el sistema y aplicaciones. |
| __C:\AppData__ | Contiene datos de configuración y caché de aplicaciones específicas de cada usuario. |
| __C:\ProgramData__ | Similar a `AppData`, pero accesible para todos los usuarios del sistema. |
| __C:\Recovery__ | Contiene archivos de recuperación del sistema en caso de fallos graves. |
| __C:\Drivers__ | Almacena los controladores de hardware instalados en el sistema. |

## Formatos del Sistema de Archivos

Windows admite varios sistemas de archivos, cada uno con características específicas:

| Sistema de Archivos | Descripción |
|--|--|
| __FAT32__ | Formato más antiguo, compatible con múltiples sistemas operativos, pero con limitaciones en el tamaño de archivos. |
| __NTFS__ | Formato moderno con soporte para permisos avanzados, compresión, cifrado y recuperación de errores. |
| __exFAT__ | Diseñado para unidades flash y discos externos, con mejor rendimiento que FAT32 y sin las restricciones de tamaño de archivo. |

## Administración de Archivos en Windows

- __Explorador de Archivos__: Interfaz gráfica para navegar y administrar archivos.
- __Administrador de Discos__: Herramienta para gestionar particiones y volúmenes.
- __CMD y PowerShell__: Interfaces de línea de comandos para manipulación avanzada de archivos.

## Comandos de Particionado en Windows

* Particionado
    * __diskpart__: Inicia la herramienta de administración de discos
    * __list disk__: Muestra todos los dispositivos del sistema
    * __select disk X__: Selecciona la unidad `X` para realizar operaciones
    * __list partition__: Muestra las particiones de la unidad seleccionado
    __create partition `primary`__: Crea una partición primaria en el disco seleccionado
* Formatear Sistema de Archivos
    * __format _fs_=`ntfs` `quick`__: Formatea la partición seleccionada con el sistema de archivos indicado
    * __assign _letter_=`X`__: Asigna una letra especifica a la partición seleccionada
    * __active__: Marca la partición seleccionada como activa (para arranque)
    * __convert `gpt`__: Convierte el disco seleccionado al formato __GPT__

[Volver](../readme.md)