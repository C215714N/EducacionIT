# Umask

Ultididad que permite implementar __una máscara de modo de creación de archivos__, que determina el valor inicial de los bits de permiso de archivo para los archivos recién creados. 

El comportamiento de esta utilidad está __estandarizado por POSIX__ y se describe en el Manual del programador de POSIX. Debido a que umask afecta la máscara actual entorno de ejecución de shell, generalmente se implementa como un comando integrado de un shell.


| Permiso | Simbolo | Binario | Octal |
|--|:--:|:--:|:--:|
| Ninguno | — | 000 | 0 |
| Solo Ejecucion | –x | 001 | 1 |
| Solo Escritura | -w-| 010| 2 | 
| Escribir y Ejecutar | -wx| 011| 3 | 
| Solo Lectura | r–| 100| 4 |
| Leer y Ejecutar | r-x| 101| 5 |
| Lectoescritura | rw-| 110| 6 | 
| Completo | rwx| 111| 7 |