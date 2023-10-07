## Registry Editor

* __Comando:__ regedit
* __descripcion:__ base de datos jerarquica que almacena información necesaria para la configuracion del sistema operativo, los usuarios, aplicaciones y dispositivos de hardware.

### ESTRUCTURA PRINCIPAL

| Clave | Abrev. | Descripcion|
|--|--|--|
|  __HKEY_CLASSES_ROOT__ | __HKCR__| Almacena informacion que _garantiza la apertura del programa indicado al abrir un archivo_ en el Explorador.
|  __HKEY_CURRENT_USER__ | __HKCU__ | Posee la _raiz de la informacion del perfil del usuario_ que inicio sesión, como carpetas o Panel de control.
|  __HKEY_LOCAL_MACHINE__ | __HKLM__ | Continene _información de configuración específica del equipo_ aplicable para cualquier usuario.
|  __HKEY_USERS__ | __HKU__ | Almacena _los perfiles de usuario_ que se encuentran cargados en el equipo actualmente.
| __HKEY_CURRENT_CONFIG__ | __HKCC__ | Incluye _información sobre el perfil de hardware_ utilizado por el equipo local al iniciar el sistema.

### SUBARBOL DE ARCHIVOS

| Subclave | Descripcion
|--|--|
| __HKLM\SAM__ | Información sobre las bases de datos del Administrador de cuentas de seguridad para dominios. Dentro de cada base de datos hay alias de grupo, usuarios, cuentas de invitado y cuentas de administrador. |
| __HKLM\SECURITY__ | Almacena las directivas de seguridad del usuario actual. Está vinculado a la base de datos de seguridad del dominio donde el usuario inició sesión o a la sección de registro en la computadora local. |
| __HKLM\SOFTWARE__ | Esta organizado alfabéticamente por el proveedor del software y es donde cada programa escribe datos en el registro para que la próxima vez que se abra la aplicación, su configuración específica se aplique automáticamente. |
| __HKLM\SYSTEM__ | Contains information stored in the about the computer's system configuration. |
| __HKU\\.DEFAULT__ | Informacion predeterminada utilizada por la _Cuenta Local del Sistema_, no por una cuenta de usuario normal. Cualquier cambio realizado se reflejara automáticamente en la subclave __HKEY_USERS\S-1-5-18__. |
| __HKLM\HARDWARE__ | Contiene datos relacionados con el BIOS, los procesadores y otros dispositivos de hardware. No se almacena como un archivo, porque se vuelve a crear cada vez que se inicia el sistema. |

### VALORES DE REGISTRO

|Tipo|Descripción|
|--- |--- |
|__REG_BINARY__| _Datos binarios_ sin formato. |
|__REG_DWORD__| Datos representados por un _entero de 32 bytes_|
|__REG_EXPAND_SZ__| _Cadena de datos_ de longitud variable. |
|__REG_MULTI_SZ__|Una _cadena múltiple_ separada con espacios, comas u otras marcas.|
|__REG_SZ__| _Cadena de texto_ de longitud fija.|
|__REG_RESOURCE_LIST__| Una serie de _matrices binarias_ anidadas que almacenan una lista de recursos que usa un controlador de dispositivo de hardware. |
|__REG_RESOURCE_REQUIREMENTS_LIST__|Una serie de _matrices binarias_ anidadas que almacena la lista de posibles recursos de hardware que puede usar el controlador.|
|__REG_FULL_RESOURCE_DESCRIPTOR__|Una serie de _matrices binarias_ anidadas que almacenan una lista de recursos que usa un dispositivo de hardware físico. |
|__REG_NONE__| Datos sin _ningún tipo_ determinado. |
|__REG_LINK__| _Cadena Unicode_ que nombra un vínculo simbólico.|
|__REG_QWORD__| Datos representados por un _entero de 64 bits_.|