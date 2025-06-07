# Administracion

El sistema de almacenamiento se estructura mediante particiones y formatos de sistema de archivos. Estas herramientas permiten organizar, gestionar y optimizar el uso del disco según las necesidades del sistema o usuario.

## Particionado

Consiste en dividir un disco en secciones independientes llamadas particiones. Esto facilita la organización de datos y la posibilidad de instalar múltiples sistemas operativos.

### Tipos

| Tipo | Descripción |
|--|--|
| **Primaria** | Es una partición principal en el disco. Se pueden tener hasta 4 particiones primarias o 3 primarias y 1 extendida. Una de estas particiones puede ser configurada como activa para iniciar el sistema. |
| **Extendida** | Es una partición contenedora que no almacena datos directamente, pero puede dividirse en múltiples particiones lógicas. Útil para superar la limitación de 4 particiones principales. |
| **Lógica** | Son particiones creadas dentro de una partición extendida. Se utilizan para almacenar datos o sistemas operativos adicionales. |
| **Swap** | Específica de Linux, se utiliza como memoria virtual cuando la RAM está llena. Es una extensión temporal del sistema que permite ejecutar aplicaciones de gran consumo de recursos. |
| **EFI System Partition (ESP)** | Es una partición especial para sistemas que utilizan UEFI en lugar de BIOS tradicional. Contiene los cargadores de arranque y otros archivos esenciales para iniciar el sistema. |

### Métodos

* __MBR (Master Boot Record)__: Formato tradicional con límite de 4 particiones primarias y tamaño máximo de hasta 2 TB por dispositivo de almacenamiento.
* __GPT (GUID Partition Table)__: Método moderno con soporte para dispositivo de almacenamiento de gran tamaño y más de 128 particiones. Requerido para sistemas UEFI.

### Herramientas

| Sistema | Herramientas |
|--|--|
| **Windows** | `diskmgmt.msc`, `diskpart`. |
| **Linux** | `fdisk`, `parted`, `gparted`. |
| **MacOS** | `diskutil`. |

## Formateo

El formato de sistema de archivos determina cómo se organizan y gestionan los datos en una partición.

| Formato | Descripción |
|--|--|
| **ext4** | Soporta volúmenes grandes, tiempos de acceso rápidos y journaling. Utilizado en Particiones principales de Linux. |
| **ext3** | Incluye journaling para proteger datos en caso de fallo, menos eficiente que ext4. Usado en Sistemas Linux más antiguos. |
| **ext2** | Carece de journaling, pero es ligero y eficiente; usado comunmente en Dispositivos de almacenamiento extraíbles. |
| **XFS** | Optimizado para manejar grandes archivos y alto rendimiento. Implementado en Servidores Linux con necesidades de alta capacidad. |
| **Btrfs** | Diseñado para ofrecer snapshots, compresión y gestión avanzada de almacenamiento. Para Sistemas avanzados y servidores Linux. |
| **vfat/fat32** | Compatible con Windows y dispositivos extraíbles. Ideal para Pendrives y particiones compartidas entre sistemas operativos. |
| **swap** | No almacena archivos, sino que es utilizada como espacio de intercambio de memoria virtual en sistemas Linux. |
| **NTFS** | Soporte para archivos grandes, permisos avanzados y seguridad integrada en Windows. permite la compartición de discos entre Sistemas. |
| **FAT32** | Compatibilidad con múltiples dispositivos, pero con limitaciones en tamaño de archivos. Ideal para Dispositivos USB y almacenamiento externo. |
| **exFAT** | Diseñado para discos extraíbles, posee mejor rendimiento que FAT32 y sin restricciones de tamaño de archivo. |
| **ReFS** | Optimizado para servidores Windows con recuperación automática de errores. Utilizado en Sistemas de almacenamiento avanzado. |

## Mantenimiento

La correcta gestión de almacenamiento asegura mejor rendimiento y seguridad en los sistemas operativos. Adaptar el tipo de partición y sistema de archivos según las necesidades garantizará una administración eficiente.

* Sistemas Operativos GNU/Linux
    * __sudo apt autoremove && sudo apt autoclean__: Limpia los archivos temporales
    * __fsck -y `/dev/sdX`__: Verificar y reparar la unidad seleccionada
    * __smartctl -a `/dev/sdX`__: Monitorea el estado del disco
    * __tune2fs -o journal_data_writeback `/dev/sdX`__: Optimiza el sistema de archivos
    * __e4defrag `/dev/sdX`__: Desfragmenta las particiones ext4
    * __du -sh * | sort -h__: Liberar espacio en disco
    * __mount -o noatime,discard `/dev/sdX` `/mnt/dispositivo`__: Monta unidades con opciones de rendimiento
* Sistemas Operativos de Microsoft
    * __cleanmgr__: Libera espacio en el dispositivo de almaacenamiento
    * __chkdsk /f /r__: Verifica y repara errores en la unidad seleccionada
    * __defrag `C:`/O__: Optimiza y desfragmenta la particion indicada
    * __sfc /scannow__: Verifica la integridad de archivos del sistema
    * __wuauclt /detectnow__: Actualiza el sistema operativo
    * __wmic diskdrive get status__: Monitorea el estado del dispositivo
    * __del /s /q `C:\Windows\Temp\*`__: Elimina archivos temporales

[volver](../readme.md)