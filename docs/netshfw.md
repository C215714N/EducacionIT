## Network Firewall

El __Firewall de Windows__ es una herramienta de seguridad integrada en el sistema que ayuda a proteger la red y el sistema contra accesos no autorizados. 

Gestiona reglas directamente en el contexto de _perfiles de red (Doméstico, Público, Privado)_ y _zonas de seguridad_. Se puede configurar mediante la interfaz gráfica o la línea de comandos con `netsh` y/o `powershell`. 

### Implementación

* __Filtrado de Paquetes__: Controla el tráfico de entrada y salida basado en reglas.
* __Redirección de Puertos__: No se maneja directamente; se usa NAT a nivel de enrutador o de aplicación.
* __Registro de Paquetes__: Permite habilitar el registro para auditoría o depuración.
* __Protección de Red__: Permite bloquear paquetes y conexiones que no cumplen con las reglas de seguridad.

### Netsh AdvFirewall

| Parámetro | Descripción | 
|-|-|
| __add rule__ | Agrega una nueva regla al firewall |
| __delete rule__ | Elimina una regla existente |
| __show rule__ | Muestra una regla específica |
| __set allprofiles__ | Configura la política para todos los perfiles |
| __set rule__ | Configura propiedades de una regla existente |
| __show allprofiles__ | Muestra el estado de los perfiles de firewall |

### PowerShell Cmdlet

| Cmdlet | Descripción |
|-|-|
| `New-NetFirewallRule` | Crea una nueva regla de firewall | 
| `Remove-NetFirewallRule` | Elimina una regla existente | 
| `Get-NetFirewallRule` | Muestra una regla específica | 
| `Set-NetFirewallRule` | Modifica una regla existente | 
| `Get-NetFirewallProfile` | Muestra la configuración del perfil de firewall |
| `Set-NetFirewallProfile` | Configura el perfil de firewall | 

### Comandos

* [Capa de Red](./osi.md)
  * Bloquear trafico ICMP
    > _Cmdlet_: __New-NetFirewallRule -Name "`Block ICMP`" -Protocol `ICMPv4` -Direction `Inbound` -Action `Block`__
    ___
    > _Netsh_: __netsh advfirewall firewall add rule name="`Block ICMP`" protocol=`ICMPv4` dir=`in` action=`block`__
  * Permitir tráfico de una IP
    > _Cmdlet_: __New-NetFirewallRule -Name "`Allow Specific IP`" -RemoteAddress `192.168.1.10` -Direction `Inbound` -Action `Allow`__
    ___
    > _Netsh_: __netsh advfirewall firewall add rule name="`Allow Specific IP`" dir=`in` remoteip=`192.168.1.10` action=`allow`__
* [Capa de Transporte](./osi.md)
  * Permitir tráfico DNS
    > _Cmdlet_: __New-NetFirewallRule -Name "`Allow DNS`" -Protocol `UDP` -LocalPort `53` -Direction `Inbound` -Action `Allow`__
    ___
    > _Netsh_: __netsh advfirewall firewall add rule name="`Allow DNS`" protocol=`UDP` dir=`in` localport=`53` action=`allow`__
  * Bloquear trafico FTP
    > _Cmlet_: __New-NetFirewallRule -Name "`Block HTTP`" -Protocol `TCP` -LocalPort `21` -Direction `Inbound` -Action `Block`__
    ___
    > _Netsh_: __netsh advfirewall firewall add rule name="`Block HTTP`" protocol=`TCP` dir=`in` localport=`21` action=`block`__
* [Capa de Sesión](./osi.md)
  * Permitir tráfico RDP:
    > _Cmdlet_: __New-NetFirewallRule -Name "`Allow RDP`" -Protocol `TCP` -LocalPort `3389` -Direction `Inbound` -Action `Allow`__
    ___
    > _Netsh_: __netsh advfirewall firewall add rule name="`Allow RDP`" protocol=`TCP` dir=`in` localport=`3389` action=`allow`__
* [Capa de Aplicacion](./osi.md)
  * Bloquear tráfico de una aplicación
    > _Cmdlet_: __New-NetFirewallRule -Name "`Block App`" -Program "`C:\Program Files\MyApp\myapp.exe`" -Direction `Inbound` -Action `Block`__
    ___
    > _Netsh_: __netsh advfirewall firewall add rule name="`Block App`" program="`C:\Program Files\MyApp\myapp.exe`" dir=`in` action=`block`__

[volver](../readme.md)