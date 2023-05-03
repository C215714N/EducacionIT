## Local Security Policies

*  __Comando:__ secpol.msc
*  __Descripcion:__ Herramienta que permite definir las reglas de seguridad con respecto a la ejecucion e instalacion de
programas, administracion de cuentas y otras configuraciones.

### Directivas de Contraseñas
| Directiva | Descripcion |
|-|-|
| __Vigencia Minima__ | período de tiempo, en días, en que puede usarse una contraseña antes de que el usuario pueda cambiarla.  |
| __Vigencia Maxima__ | establece que las contraseñas expiren tras un número de días, el valor predeterminado es _42_. |
| __Longitud Minima__ | número mínimo de caracteres que puede contener una contraseña para una cuenta de usuario. |
| __Requisitos de Complejidad__ | cuando se habilita, la contraseña No debe contener el nombre de cuenta del usuario, ni partes del nombre completo en más de dos caracteres consecutivos, debe poseer una longitud mínima de seis caracteres e incluir caracteres de 3 categorías: <ul> <li> __Mayúsculas__ de la _A_ a la _Z_</li><li>__Minúsculas__ de la _a_ a la _z_</li><li>__Dígitos de base 10__ del _0_ al _9_</li><li>__Caracteres no alfanuméricos__ como _!, $, #, %,_ etc. </li></ul> | 
| __Historial de Contraseñas__ | permite a los administradores mejorar la seguridad, ya que garantiza que no se reutilicen continuamente contraseñas antiguas. |
| __Cifrado Reversible__ | compatibilidad para aplicaciones que usan protocolos que exigen el conocimiento de la contraseña del usuario para fines de autenticación. |

### Directivas de Bloqueo de Cuentas

| Directiva | Descripcion |
|-|-|
| __Duracion de Bloqueo__ | tiempo expresado, en minutos, durante los cuales una cuenta bloqueada permanece en este estado antes de desbloquearse automáticamente. |
| __Reestablecimiento de Bloqueo__ | minutos que deben transcurrir tras un intento de inicio de sesión incorrecto para que el contador de intentos de inicio de sesión incorrectos se restablezca en 0. |
| __Umbral de Bloqueo__ | determina el número de intentos de inicio de sesión incorrectos que hacen que una cuenta de usuario se bloquee. Si establece el valor en 0, la cuenta no se bloqueará nunca. |

### Directivas Locales

| Directiva | Descripcion |
|-|-|
| __Directiva de Auditoria__ | proporciona amplias funcionalidades de auditoría de seguridad para los dispositivos y servidores cliente que no pueden usar la configuración de directiva de auditoría de seguridad avanzada. |
| __Asignacion de derechos__ | permite a los usuarios realizar tareas en un dispositivo o dominio, iniciar sesión en un equipo y controlan el acceso a los recursos, tambien pueden invalidar los permisos establecidos en objetos específicos. |
| __Opciones de Seguridad__ | permiten configurar el comportamiento del equipo local, y si se configuran los valores de un __objeto de directiva de grupo__, estos se aplican a todos los dispositivos que están sujetos a ese __GPO__. |

### Firewall de Windows
|Reglas | Descripcion |
|-|-|
| __Entrada__ | controlan el tráfico que se permite o bloquea desde fuentes externas, como las conexiones de Internet. |
| __Salida__ | controlan las conexiones que se generan desde nuestro equipo y que tienen como objetivo salir a Internet. |
| __Seguridad__ | especifican cuando y como tiene lugar una autenticacion, pero no permiten conexiones. |

### Directivas de restriccion de software

| Restriccion | Descripcion |
|-|-|
| __Niveles seguridad__ | define como sera el acceso al software en general y que nivel de privilegios es requerido para la ejecucion de los programas. <ul><li>__No permitido__ no se ejecutara independientemente de los derechos de acceso de usuario. </li><li>__Usuario Basico__ se puede obtener acceso a recursos permitidos para cualquier usuario normal. </li><li>__Ilimitado__ la ejecucion esta determinada por los derechos de acceso del usuario.</li></ul>
| __Reglas Adicionales__ | permite definir reglas que bloquean o permiten el acceso al software en base a _certificados, Hash, ruta de acceso o zona de red_ |

### Directivas de control de Aplicaciones
| Aplicacion | Descripcion |
|-|-|
| __Ejecutables__ | define reglas para archivos con extensiones como __.exe y .com__ asociadas a una aplicación. Dado que todas las reglas predeterminadas se basan en rutas de acceso de carpeta, se permitirán todos los archivos de esas rutas de acceso. |
| __Windows Installer__ | define reglas para incluir solamente formatos de archivo __.msi, .msp y .mst__ con el proposito de controlar la instalación en equipos cliente y servidores a través de directiva de grupo o el complemento Directiva de seguridad local. |
| __Scripts__ | define reglas para incluir solo los siguientes formatos de archivo __.ps1, .bat, .cmd, .vbs y .js__. Cuando se ejecuta un script que no está permitido se genera un evento que indica que el script se ha "bloqueado". Sin embargo, el host de script controla el comportamiento real de cumplimiento del script. |
| __Empaquetadas__ | reglas para aplicaciones universales de Windows por separado de las aplicaciones clásicas de Windows, se puede controlar tanto la instalación como la ejecución de una aplicación. |