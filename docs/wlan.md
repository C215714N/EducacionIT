# Redes Inalámbricas (WLAN)

Una Red de Área Local Inalámbrica (WLAN) es un sistema de comunicación de datos que utiliza ondas de radio en lugar de cables para transmitir información entre dispositivos. Permite a los usuarios moverse libremente dentro del área de cobertura mientras mantienen su conexión a la red. La configuración se realiza típicamente en un Access Point (AP) o un Wireless LAN Controller (WLC).

1. AP(config)# __(Configuración de la Red Inalámbrica)__
    * __dot11 ssid `<ssid-name>`__: Crea o modifica un SSID.
    * __authentication open | key-management wpa [version 2]__: Define el tipo de autenticación.
    * __guest-mode__: Habilita el SSID para difusión (broadcasting).
2. AP(config-ssid)# __(Configuración del SSID)__
    * __wpa-psk ascii `<password>`__: Establece la clave pre-compartida (PSK) para WPA/WPA2.
3. AP(config)# __(Configuración de la Interfaz de Radio)__
    * __interface dot11radio `<0|1>`__: Ingresa a la configuración de la radio (2.4GHz o 5GHz).
    * __ssid `<ssid-name>`__: Asocia el SSID a la interfaz de radio.

## Implementacion

La implementación de una WLAN segura y eficiente requiere configurar el SSID (nombre de la red), el método de autenticación (preferiblemente WPA2 o WPA3) y una contraseña robusta. Esta configuración se asocia a una interfaz de radiofrecuencia (2.4GHz o 5GHz) para que el Access Point pueda empezar a emitir la señal de la red inalámbrica y permitir que los clientes se conecten.

```sh
dot11 ssid WIFI-CORPORATIVO
authentication open
guest-mode
!
dot11 ssid WIFI-CORPORATIVO
authentication key-management wpa version 2
wpa-psk ascii Un4Cl4v3S3gur4!
!
interface Dot11Radio0
description 2.4GHz_RADIO_INTERFACE
ssid WIFI-CORPORATIVO!
no shutdown
```

[volver](../readme.md)