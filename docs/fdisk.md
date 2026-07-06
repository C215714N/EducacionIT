# Particionado

En Linux, el sistema de almacenamiento se estructura mediante particiones y formatos de sistema de archivos. Estas herramientas permiten organizar, gestionar y optimizar el uso del disco según las necesidades del sistema o usuario.

## Tipos de Particiones

Linux soporta distintos tipos de particiones, cada una diseñada para un propósito específico.

| Tipo de Partición | Descripción |
|--|--|
| __Primaria__ | Es una partición principal en el disco. Se pueden tener hasta 4 particiones primarias o 3 primarias y 1 extendida. Una de estas particiones puede ser configurada como activa para iniciar el sistema. |
| __Extendida__ | Es una partición contenedora que no almacena datos directamente, pero puede dividirse en múltiples particiones lógicas. Útil para superar la limitación de 4 particiones principales. |
| __Lógica__ | Son particiones creadas dentro de una partición extendida. Se utilizan para almacenar datos o sistemas operativos adicionales. |
| __Swap__ | Específica de Linux, se utiliza como memoria virtual cuando la RAM está llena. Es una extensión temporal del sistema que permite ejecutar aplicaciones de gran consumo de recursos. |
| __EFI System Partition (ESP)__ | Es una partición especial para sistemas que utilizan UEFI en lugar de BIOS tradicional. Contiene los cargadores de arranque y otros archivos esenciales para iniciar el sistema. |

## Formatos de Sistema de Archivos

El formato de sistema de archivos determina cómo se organizan y gestionan los datos en una partición. Algunos de los formatos más comunes en Linux son:

| Formato | Descripción | Uso Típico |
|--|--|--|
| __ext4__ | Versión mejorada de ext3, soporta volúmenes grandes, tiempos de acceso rápidos y journaling. Es el más utilizado en distribuciones modernas. | Particiones principales en sistemas Linux. |
| __ext3__ | Incluye journaling para proteger datos en caso de fallos. Es menos eficiente que ext4. | Sistemas más antiguos. |
| __ext2__ | Carece de journaling, pero es ligero y eficiente. | Dispositivos de almacenamiento extraíbles. |
| __XFS__ | Optimizado para el manejo de grandes archivos y alto rendimiento. | Servidores y sistemas con necesidades de alta capacidad. |
| __Btrfs__ | Diseñado para ofrecer snapshots, compresión y gestión avanzada de almacenamiento. | Sistemas avanzados y servidores. |
| __vfat/fat32__ | Compatible con sistemas Windows y dispositivos de almacenamiento extraíbles. | Pendrives y particiones compartidas entre sistemas operativos. |
| __NTFS__ | Sistema de archivos nativo de Windows, soportado por Linux mediante `ntfs-3g`. | Compartición de discos entre Linux y Windows. |
| __swap__ | No almacena archivos como tal; es utilizada como espacio de intercambio de memoria virtual. | Memoria virtual en sistemas Linux. |

## Herramientas Comunes

* __fdisk__: Herramienta tradicional para gestionar particiones en discos MBR.
* __gdisk__: Similar a `fdisk`, pero para discos GPT.
* __parted__: Herramienta más flexible que permite gestionar particiones tanto en MBR como GPT.
* __gparted__: Interfaz gráfica para `parted`, ideal para usuarios menos experimentados.

### Linea de Comandos

* Particionado
   * __sudo fdisk -l__: Lista los discos disponibles
   * __sudo fdisk `/dev/sdX`__: Selecciona un disco para particionar
* Formatear Sistema de Archivos
   * __sudo mkfs.ext4 `/dev/sdX1`__: Formatea la particion en ext4
   * __sudo mkdir `/mnt/miparticion`__: Crea un punto de montaje
   * __sudo mount `/dev/sdX1` `/mnt/miparticion`__: Monta la partición seleccionada
* Creacion de Particion Swap
   * __sudo mkswap /dev/sdX2__: Crear una partición swap
   * __sudo swapon /dev/sdX2__: Activar el área de intercambio
   * __free -h__: Verificar swap activo

[volver](../readme.md)