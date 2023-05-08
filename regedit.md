## Registry Editor

* __Comando:__ regedit
* __descripcion:__ base de datos jerarquica que almacena información necesaria para la configuracion del sistema operativo, los usuarios, aplicaciones y dispositivos de hardware.

### CLAVES PRINCIPALES

| Clave | abreviatura | Descripcion|
|--|--|--|
|  __HKEY_CLASSES_ROOT__ | __HKCR__| esta clave almacena la informacion que _garantiza la apertura del programa indicado al abrir un archivo_ en el Explorador de Windows.
|  __HKEY_CURRENT_USER__ | __HKCU__ | esta clave contiene la _raiz de la informacion asociada al perfil del usuario_ que ha iniciado sesión, como carpetas, colores de pantalla y la configuración de Panel de control.
|  __HKEY_LOCAL_MACHINE__ | __HKLM__ | esta clave contiene _información de configuración específica del equipo_ aplicable para cualquier usuario.
|  __HKEY_USERS__ | __HKU__ | esta clave contiene _los perfiles de usuario_ que se encuentran cargados en el equipo actualmente.
| __HKEY_CURRENT_CONFIG__ | __HKCC__ | Esta clave contiene _información sobre el perfil de hardware_ utilizado por el equipo local al iniciar el sistema operativo.

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